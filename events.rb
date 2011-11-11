require 'bayeux'

events.asterisk.manager_interface.each do |event|
  p 'a event was received'
  p event.name
  case event.name
  when 'Newstate'
    Bayeux.publish('/caller/join', { :id => event.headers['Channel'], 
                                     :number => event.headers['CallerIDNum'],
                                     :joinedAt => Time.now.to_i })
  when 'Hangup'
    Bayeux.publish('/caller/leave', { :id => event.headers['Channel'] })
  end
end

events.asterisk.before_call.each do |call|
  extension = call.variables[:extension]
  ahn_log "New call with extension #{extension}"

  Bayeux.publish('/caller/join', { :id => call.variables[:channel], 
                                    :number => call.variables[:calleridname],
                                    :joinedAt => Time.now.to_i })
end

events.asterisk.after_call.each do |call|
  Bayeux.publish('/caller/leave', { :id => call.variables[:channel] })
end

