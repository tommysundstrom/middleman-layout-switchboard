activate :layout_switchboard do |switchboard|
  switchboard.trigger_layout = [
      {:country => 'Albania', :layout => 'albanianstyle'},
      {:tag => 'first layout', :layout => 'first'}
  ]
end

require "middleman-more"
