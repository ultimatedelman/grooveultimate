Groove Ultimate
==============

Herp. Derp.

So you'd like to contribute?
===========================

That's rad. If you know how GitHub works and how to code, see instructions below. If you don't know how to code and/or have no idea how GitHub works, submit any copy changes/ideas/suggestions/what-have-you to groovecaptains@gmail.com.

Directions for the coding-inclined
================================== 

For *simple* copy or CSS changes, do the following:

1. Create a fork of the `master` branch of this repo. This is where all the source files live.
2. Make your changes. [Want to create a new post?](#new-post).
3. Submit a [pull request](https://github.com/ultimatedelman/grooveultimate/compare).

If everything checks out, I'll merge your changes and build the site.

*For more complex changes*, such as adding or modifying bios, adding pages, or [creating or modifying posts](#new-post) where you'd like to see what it looks like locally:

1. This is a statically-generated site a la [Jekyll](http://jekyllrb.com/). If you haven't installed that, do that first.
2. Do step one for simple changes if you haven't already, then step two (make your changes).
3. Set up [your server](http://jekyllrb.com/), run `jekyll serve`.
4. To view changes locally, open the `_config.yml` file and update `baseurl` to read `baseurl: /grooveultimate`. **IT IS IMPERATIVE YOU CHANGE THIS BACK TO `baseurl: ""` AFTER YOU'RE DONE VIEWING LOCAL CHANGES AND REBUILDING**