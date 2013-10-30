# Require core library
require "middleman-core"

# Extension namespace
class LayoutSwitchboard < ::Middleman::Extension
  option :trigger_layout, {}, "Options that will trigger a layout, and the layout it triggers."
  # An example:
  # activate :layout_switchboard do |switchboard|
  # switchboard.trigger_layout = [
  #    {:region => 'Albania',     :layout => 'albanianstyle'},
  #    {:region => 'New Zealand', :layout => 'kiwistyle'},
  #    {:tag => 'Sweden',         :layout => 'scandinaviandesign'}
  # ]
  # This will trigger on the first match. If the page frontmatter has an 'region' option with the value 'Albania',
  # the layout template 'albanianstyle.haml' (or .erb or whatever) will be used. If not, the extension will
  # continue and look for a 'region' option 'New Zealand', and then a tag with the value 'Sweden'.
  # Note that 'tag' behaves slightly different. It will look for a 'tags' option, parse it into individual tags and see if
  # one of those matches.



  def initialize(app, options_hash={}, &block)
    # Call super to build options from the options_hash
    super
  end

  def after_configuration
    @app.sitemap.register_resource_list_manipulator(
        :heading_as_title,
        self,
        false
    )
  end

  # A Sitemap Manipulator
  def manipulate_resource_list(resources)
    resources.each do |resource|

      # Looking through all variables in the front matter, looking for anything that
      # matches the trigger_layout option. If there is a match, sets the corresponding
      # layout.

      # If there already is a :layout variable, it will take priority
      next if resource.data[:layout]       # POTENTIAL BUG. I don't think this will notice if another extension already
                                           # has added an layout (which I assume would end up in the metadata)?

      # Checking for a matching variable
      # trigger_key - The front matter variable that is looked at
      # trigger_value - The value of the variable. This is what gets matched.
      # layout – The name of the layout used, if there is a match
      options[:trigger_layout].each do |tl|
        trigger_key = tl.keys.keep_if{|k| k != :layout}[0]  # There should only be two items in the array.
                                                            # This keeps the key that is not :layout, i.e.
                                                            # the trigger condition
        trigger_value = tl[trigger_key]
        layout = tl[:layout]
        if trigger_key == :tag
          # Since the tags variable can contain several tags, it's handled in a different way from other variables
          # Get an array of tags
          if resource.data[:tags].is_a? String
            tags = resource.data[:tags].split(',').map(&:strip)
          else # It is already an array, or empty
            tags = resource.data[:tags] || []
          end
          tags.each do |tag|
            if tag == trigger_value
              resource.add_metadata :options => { :layout => layout }
              break # A match is found, so stop looking
            end
          end
        end
        # Check the other variables
        if resource.data[trigger_key] && resource.data[trigger_key] == trigger_value
          resource.add_metadata :options => { :layout => layout }
          break # A match is found, so stop looking
        end
      end
    end
  end
end

# Register extensions which can be activated
LayoutSwitchboard.register(:layout_switchboard)
