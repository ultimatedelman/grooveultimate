Groove Ultimate
==============

Herp. Derp.

So you'd like to contribute?
===========================

That's rad. If you know how GitHub works and how to code, see instructions below. If you don't know how to code and/or have no idea how GitHub works, submit any copy changes/ideas/suggestions/what-have-you to groovecaptains@gmail.com.

Directions for the coding-inclined
================================== 

For **simple** copy or CSS changes, do the following:

1. Create a fork of the `master` branch of this repo. This is where all the source files live.
2. Make your changes. [Want to create a new post?](#creating-a-new-post).
3. Submit a [pull request](https://github.com/ultimatedelman/grooveultimate/compare).

If everything checks out, I'll merge your changes and build the site.

**For more complex changes**, such as adding or modifying bios, adding pages, or [creating or modifying posts](#creating-a-new-post) where you'd like to see what it looks like locally:

1. This is a statically-generated site a la [Jekyll](http://jekyllrb.com/). If you haven't installed that, do that first.
2. Do step one for simple changes if you haven't already.
3. Set up [your server](http://jekyllrb.com/), run `jekyll serve` in your terminal/console.
4. To view changes locally, open the `_config.yml` file and update `baseurl` to read `baseurl: /grooveultimate`. **IT IS IMPERATIVE YOU CHANGE THIS BACK TO `baseurl: ""` AFTER YOU'RE DONE VIEWING LOCAL CHANGES AND REBUILDING**
5. Make your changes.
6. In your terminal/console, run `jekyll build`. You should be able to view your changes locally.
7. Repeat previous two steps until you've achieved the desired result.
8. Submit a [pull request](https://github.com/ultimatedelman/grooveultimate/compare).

Creating a New Post
=======================

1. Create a new file in the `_posts` directory. The filename must be of the convention: `yyyy-mm-dd-title.markdown`. For example, `2014-07-25-new-post.markdown`.
2. The top of your post must have ["front-matter"](http://jekyllrb.com/docs/frontmatter/) that looks something like this: 
<pre><code>---
layout: post
title: New Website!
date: 2014-07-25 00:00:00
---</pre></code>
3. The only thing above that must remain consistent is `layout: post`. Change the values of `title` and `date` accordingly.
4. Put your content below the second `---` in [Markdown](http://daringfireball.net/projects/markdown/syntax) format. If you don't want to deal with learning Markdown syntax, don't worry about it. Type as normal and hit enter twice between paragraphs.
5. If you want to see how it looks, follow the steps for complex changes above. Otherwise, just submit a pull request.
