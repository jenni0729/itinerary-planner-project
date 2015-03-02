class MandrillController < ApplicationController
def test_form
@invite = Invite.new
end

def email 
  binding.pry

end

def invite_form
@invite =Invite.new
end

require 'mandrill'
mandrill = Mandrill::API.new ENV["MANDRIL_APIKEY"]

def test
call
end


def call
emails = invite_params[:email].split
binding.pry
require 'mandrill'
m = Mandrill::API.new 
message = {  
 :subject=> "Join Itnierary Name Now!",  
 :from_name=> "George Navas",  
 :text=>"Join George's Itinerary Now!",  
 :to=> emails.map {|email|{email:email,name:"Friend"}},

 :html=>"<html><h1>Hi <strong>message</strong>, Your friend just, George has invited you to join his itinerary: Tampa. <a href='www.espn.com'>Join Now!</a> </h1></html>",  
 :from_email=>"gannavas@gmail.com"  
}  
binding.pry
sending = m.messages.send message  
puts sending
end
private
  def invite_params
    params.require(:invite).permit(:itinerary_id, :email)
  end
end

