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
@itinerary = Itinerary.find(params[:id])
inviter_name = session[:first_name]
binding.pry
require 'mandrill'
m = Mandrill::API.new 
message = {  
 :subject=> "#{inviter_name} has invited you to join #{@itinerary.name}!",  
 :from_name=> "#{@itinerary.name}",  
 :text=>"#{inviter_name} has invited you to join #{@itinerary.name}!",  
 :to=> emails.map {|email|{email:email,name:"Friend"}},

 :html=>"<html><h1>Your friend, #{inviter_name}, has invited you to join their itinerary: #{@itinerary.name}. <a href='http://localhost:3000/itineraries/#{params[:id]}/invite/signup'>Join Now!</a> </h1></html>",  
 :from_email=>"gannavas@gmail.com"  
}  
binding.pry
sending = m.messages.send message  
puts sending
redirect_to itineraries_path
end
private
  def invite_params
    params.require(:invite).permit(:itinerary_id, :email)
  end
end

