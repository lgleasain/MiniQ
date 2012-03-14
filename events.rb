require 'bayeux'

events.asterisk.before_call.each do |call|

  Bayeux.publish('/caller/join', { :id => call.variables[:channel], 
                                    :number => call.variables[:calleridname].empty? ? call.variables[:dnid] : call.variables[:calleridname],
                                    :joinedAt => Time.now.to_i })
end

events.asterisk.after_call.each do |call|
  Bayeux.publish('/caller/leave', { :id => call.variables[:channel] })
end

