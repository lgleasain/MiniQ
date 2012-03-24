trolo {
}

tropo_agi {
  menu = "Welcome to the recruiter 2012.  " +
          "Press 1 to hear a rick roll. " +
          "Press 2 to robocall a friend with this menu. " +
          "Press 3 to send a snarky text to a recruiter. " +
          "Press 4 to rick roll someone else."

  choice = input 1, :play => menu

  case choice
    when '1'
      play 'http://net1.madringtones.org/data/13/451546/files/451546.mp3'  

    when '2'
      num_to_call = input 10, :play => 'please enter number to call' 
      play num_to_call
      num_from = input 10, :play => 'please enter the number that you want to call from'
      play num_from
      token = ''
      Net::HTTP.post_form(URI.parse('http://api.tropo.com/1.0/sessions'), "token" => token, "destination" => "1#{num_to_call}", "tropo_tag" => 666, "caller_id" => num_from, "caller_id_name" => 'beavis')

    when '3'
      tel_number = input 10, :play => 'enter the number you want us to text'  
      play 'you entered'
      play tel_number
      message_choice = input 1, 
        :play => 'press 1 to say no thank you. ' + 
               ' 2 to tell the recruiter to buzz off. ' + 
               'or 3 to refer to another source a great candidates.'
      message = ''

      case message_choice
        when '1'
          message = 'I am not in the job market,  ' + 
                    'but when I want to feel like a used car I will call you.'
        when '2'
          message = 'You guys are worse than telemarketers,  please put me on your do '  + 
                    'not call list' 
        else
	  message = 'I am not in the market right now but the people here have some ' +
                    'wonderfull candidates  (386) 462-7779.'
      end

      oneapi = Smsified::OneAPI.new(:username => 'lgleasain', :password => '')
      oneapi.send_sms :address => "1#{tel_number}", :message => message, :sender_address => '14045667572'

    else
      num_to_call = input 10, :play => 'please enter number to call' 
      play num_to_call
      num_from = input 10, :play => 'please enter the number that you are calling from'
      play num_from

      token = ''
      Net::HTTP.post_form(URI.parse('http://api.tropo.com/1.0/sessions'), "token" => token, "destination" => "1#{num_to_call}", "tropo_tag" => 666, "caller_id" => num_from, "caller_id_name" => 'beavis')
  end
}
