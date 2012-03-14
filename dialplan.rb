adhearsion {
  simon_game
}

tropo_agi {
  choice = input 1, :play => 'press 1 to wait or 2 to send a text, or 3 to dial another person'
  if choice == '1'
    play 'http://net1.madringtones.org/data/13/451546/files/451546.mp3'
  elsif choice == '2'
    tel_number = input 10, :play => 'enter the number you want us to text'  
    play 'you entered'
    play tel_number
    message_choice = input 1, :play => 'press 1 to send test results,  2 for nigerian bank scam or 3 for google password reset scare'
    message = ''
    if message_choice == '1'
	message = 'your test results are in,  please call (866) 676-5817 to discuss with nurse.'
    elsif message_choice == '2'
	message = 'please email friend@nigriabank.com to discuss tansfer of 1 billion dollars to your band account'
    else
	message = 'your gmail account password has been reset.  If this was not you go to www.gggmail.com to reset'
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
