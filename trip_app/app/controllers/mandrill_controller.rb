class MandrillController < ApplicationController
def test_form

end

require 'mandrill'
mandrill = Mandrill::API.new ENV["MANDRIL_APIKEY"]

def test
require 'mandrill'
m = Mandrill::API.new 
message = {  
 :subject=> "Hello World",  
 :from_name=> "George Navas",  
 :text=>"Hi message, how are you?",  
 :to=>[  
   {  
     :email=> "gannavas@gmail.com",  
     :name=> "George"  
   }  
 ],  
 :html=>"<html><h1>Hi <strong>message</strong>, Hello World. This is going to be wild.?</h1></html>",  
 :from_email=>"gannavas@gmail.com"  
}  
sending = m.messages.send message  
puts sending
binding.pry
end
end

