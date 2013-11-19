activate :layout_switchboard do |switchboard|
  switchboard.trigger_layout = [
      {:country => 'Albania', :layout => 'albanianstyle'},
      {:tag => 'first layout', :layout => 'first'},
      {:section => 'Användbarhetsboken', :layout => 'anvandbarhetsboken'},
      {:section => 'Strategisk design', :layout => 'strategiskdesign'},
  ]
end

require "middleman-more"
