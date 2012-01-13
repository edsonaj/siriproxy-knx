require 'cora'
require 'siri_objects'
require 'pp'

class SiriProxy::Plugin::KNX < SiriProxy::Plugin
  	def initialize(config) end
  	filter "SetRequestOrigin", direction: :from_iphone do |object|
    	puts "[Info - User Location] lat: #{object["properties"]["latitude"]}, long: #{object["properties"]["longitude"]}"
  	end 

  	listen_for /on.*office/i do
    	say "Turning on office lights..."
    	system "java -jar '/home/siriproxy/KNX/_Office__Turn_Light_ON.jar'"
    	request_completed 
  	end

  	listen_for /off.*office/i do
    	say "Turning off office lights..." 
    	system "java -jar '/home/siriproxy/KNX/_Office__Turn_Light_OFF.jar'"
    	request_completed 
  	end

  	listen_for /on.*room/i do
	response = ask "Yellow or White Light?"
	if(response =~ /White/i) 
      		say "Turning on living room white lights..." 
		system "java -jar '/home/siriproxy/KNX/_LivingRoom__Turn_Light_ON_1.jar'"
    	else
		if(response =~ /Yellow/i)
		say "Turning on living room secundary lights..." 
		system "java -jar '/home/siriproxy/KNX/_LivingRoom__Turn_Light_ON_2.jar'"
		system "java -jar '/home/siriproxy/KNX/_LivingRoom__Turn_Light_ON_3.jar'"
		else say "Sorry, I didn't get that."
		end
	end
    	request_completed
  	end

  	listen_for /off.*room/i do
   	response = ask "Yellow or White Light?"
	if(response =~ /White/i) 
      		say "Turning off living room white lights..." 
		system "java -jar '/home/siriproxy/KNX/_LivingRoom__Turn_Light_OFF_1.jar'"
	    	else
		if(response =~ /Yellow/i)
		say "Turning off living room yellow lights..." 
		system "java -jar '/home/siriproxy/KNX/_LivingRoom__Turn_Light_OFF_2.jar'"
		system "java -jar '/home/siriproxy/KNX/_LivingRoom__Turn_Light_OFF_3.jar'"
		else say "Sorry, I didn't get that."
		end
	end
    	request_completed
  	end


end
