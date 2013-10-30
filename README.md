# Middleman-Layout-Switchboard

`middleman-layout-switchboard` is an extension for the [Middleman] static site generator that makes it possible to set the layout using tags or other variables in the front matter.

## Installation

Add `gem "middleman-layout-switchboard"` to your `Gemfile` and run `bundle install`

## Configuration

In `config.rb`:

```
activate :layout_switchboard do |switchboard|
  switchboard.trigger_layout = [ ]
end
```

To configure, fill the array with suitable values. An example:

```
activate :layout_switchboard do |switchboard|
  switchboard.trigger_layout = [
    {:region => 'Albania',     :layout => 'albanianstyle'},
    {:region => 'New Zealand', :layout => 'kiwistyle'},
    {:tag => 'Sweden',         :layout => 'scandinaviandesign'}
  ]
```

First of all, it the page has a `layout:` option in its front matter, it will take precedence.

Else, the list will be searched until a match is found.

In this case, it will first look for a `region:` option with the value 'Albania' (case sensitive). If found, a layout named `albanianstyle` will be used.

If not found, it will look for New Zealand.

Then it will look for a 'Sweden' tag. This behaves slightly different. It will look for a `tags:` option, parse it into individual tags and see if any of those matches.

## License

Copyright (c) 2013 Tommy Sundström. MIT Licensed, see [LICENSE] for details.

[middleman]: http://middlemanapp.com
[gem]: https://rubygems.org/gems/middleman-blog
[travis]: http://travis-ci.org/middleman/middleman-blog
[gemnasium]: https://gemnasium.com/middleman/middleman-blog
[codeclimate]: https://codeclimate.com/github/middleman/middleman-blog
[rubydoc]: http://rubydoc.info/github/middleman/middleman-blog
[LICENSE]: https://github.com/middleman/middleman-blog/blob/master/LICENSE.md
