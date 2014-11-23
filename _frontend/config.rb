# Require any additional compass plugins here.
# Set this to the root of your project when deployed:
http_path = "../"
css_dir = "../public/css"
sass_dir = "src"
images_dir = "../assets"
javascripts_dir = "../public/js"
js_src_dir = "js_src"

# You can select your preferred output style here (can be overridden via the command line):
output_style = :compressed

# To enable relative paths to assets via compass helper functions. Uncomment:
relative_assets = false

# To disable debugging comments that display the original location of your selectors. Uncomment:
line_comments = false

######################
# automatically smushes and compresses JS through compass ;)
######################

require 'smusher'
require 'uglifier'

def minify_files(arr, source, target)
  filecount = {:identical => 0, :unchanged => 0, :errored => 0, :minified => 0, :JSONed => 0}
  arr.each do |file|
    filecount[minify_file(file, source, target)] += 1
  end
  filecount.each do |key, value|
    if value > 0
      puts  "#{value} javascript file(s) #{key}."
    end
  end
end 

def minify_file(filepath, source, target)
  file = File.basename(filepath)
  newpath = "./" + filepath.dup.gsub(source, target)
  type = nil
  extension = File.extname(file)
  begin
    if FileUtils.uptodate?(filepath, [newpath]) #if source file is "newer" than target file, recompile
      # the second param in File.open makes Uglifier work when saving files using VS by stripping out encoding
      sourceFileContents = File.open(filepath, "r:bom|utf-8").read
      targetFileContents = File.exists?(newpath) ? File.open(newpath, "r:bom|utf-8").read : File.open(newpath, "w+:bom|utf-8").read      
      if sourceFileContents.eql?(targetFileContents)
        type = :identical
      elsif extension == ".json"
        puts ">>> copying JSON file \"#{file}\" - #{Time.new.strftime("%r")}"
        File.open(newpath, "w+:bom|utf-8").write(sourceFileContents.strip)
        type = :JSONed
      else  
        puts ">>> minifying \"#{file}\" - #{Time.new.strftime("%r")}"
        js = Uglifier.compile(sourceFileContents, :copyright => false)
        if targetFileContents.eql?(js)
          type = :identical
        else
          File.open(newpath, "w+:bom|utf-8").write(js)
          type = :minified
          puts ">>>>> minifying complete!"
        end
      end
    else
      type = :unchanged
    end
  rescue Exception => e
    puts "<<< A JS compiling error occurred: #{e.to_s}"
    puts "<<<<< Existing output file \"#{newpath}\" has not been overwritten."
    type = :errored
  end  
  type
end

# check to make sure js directory structures match
# if they don't, err on side of changing compiled dir struct
source_dir = Dir["#{js_src_dir}/*/"].map {|dir| File.basename(dir)}
source_files = Dir.glob("#{js_src_dir}/**/*.{js,json}")
source_file_names = source_files.map {|f| File.basename(f)}

compiled_dir = Dir["#{javascripts_dir}/*/"].map {|dir| File.basename(dir)}
compiled_files = Dir.glob("#{javascripts_dir}/**/*.{js,json}")
compiled_file_names = compiled_files.map {|f| File.basename(f)}

if source_dir != compiled_dir
  begin
    puts "Deleting compiled javascript files and syncing file structure..."
    FileUtils.rm_rf("#{javascripts_dir}/.", :secure => true) if Dir.exists?('./' + javascripts_dir)
    sleep 1
    Dir.mkdir("./#{javascripts_dir}", 0777)
    source_dir.each { |dir| Dir.mkdir(javascripts_dir + '/' + dir) }
    puts "File structure synced! Recompiling scripts..."
    minify_files(source_files, js_src_dir, javascripts_dir)    
  rescue Exception => e
    puts "Javascript source and output file structure could not be synced. Error: " + e.to_s
  end
else  
  puts "Compiling any modified javascript files..."
  minify_files(source_files, js_src_dir, javascripts_dir)    
end

watch js_src_dir + "/**/*" do |project_dir, relative_path| 
  if File.exists?(File.join(project_dir, relative_path)) 
    result = minify_file(relative_path, js_src_dir, javascripts_dir)
    if result != :minified and result != :JSONed
      puts "1 javascript file #{result}. No files overwritten."
    end
  end 
end

watch images_dir + "/**/*" do |project_dir, relative_path| 
  if File.exists?(File.join(project_dir, relative_path)) 
    begin
      Smusher.optimize_image([relative_path],{})      
    rescue Exception => e
      puts "An error smushing #{relative_path} has occurred"
    end
  end 
end
