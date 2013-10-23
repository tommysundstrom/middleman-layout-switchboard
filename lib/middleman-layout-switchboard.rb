# Require core library
require "middleman-core"

# Extension namespace
class LayoutSwitchboard < ::Middleman::Extension
  option :my_option, "default", "An example option"

  def initialize(app, options_hash={}, &block)
    # Call super to build options from the options_hash
    super

    # Require libraries only when activated
    # require 'necessary/library'

    # set up your extension
    # puts options.my_option
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
        resource.add_metadata :options => { 
          :layout => 'strategiskdesign'
        }
      end
    end

  # module do
  #   def a_helper
  #   end
  # end

end

# Register extensions which can be activated
# Make sure we have the version of Middleman we expect
# Name param may be omited, it will default to underscored
# version of class name

LayoutSwitchboard.register(:layout_switchboard)
