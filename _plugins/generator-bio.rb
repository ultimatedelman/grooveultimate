module Jekyll

  def Jekyll.slugify(str)
    return str.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  class BioPage < Page
    def initialize(site, base, dir, player)      
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'bio.html')
      self.data['player'] = player

      title = "#{player['name']}"
      title = "#{player['number']} - #{title}" if player['number']
      title = "#{title} (captain)" if player['isCaptain']
      title = "#{title} (practice player)" if player['isPractice']
      title = "#{title} (coach)" if player['isCoach']

      player['pic'] = "#{Jekyll.slugify(player['name'])}.jpg" if player['pic']

      self.data['title'] = title
    end
  end

  class BioPageGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'bio'
        puts '      Generating bios...'
        dir = site.config['bio_dir'] || 'bios'
        site.data['players'].each do |bio|
          permalink = File.join(dir, Jekyll.slugify(bio['name']))
          site.pages << BioPage.new(site, site.source, permalink, bio)
          bio['permalink'] = File.join(site.baseurl, permalink)
        end
        puts "      Generated #{site.data['players'].size} bios"
      end
    end
  end

end