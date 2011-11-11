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
