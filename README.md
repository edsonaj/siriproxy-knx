##Siri Proxy KNX Plugin

###ABOUT

The siriproxy-knx is a SiriProxy plugin that allows you to control KNX devices in a BUS using a KNXnet/IP Tunneling Device.

To use this plugin you need to build a JAVA file that will control the devices using the Calimero API (See the my other repo KNX-Control-with-Calimero-API for more info on how to do that).

Be sure to have the Siri Proxy up and running before installing this plugin.

###USAGE

In this example we have 4 basic commands:

	You can say anything that has "on" and "office" (In this order) to turn on the office lights. For example, you can say:
		"Turn on the office"
		"Turn on the office lights"
		"Turn on the lights of the office"
		
	The same for "off" and "office".
	
	In the case of the room, after saying the command it will ask you if you want to turn on/off the white or the yellow lights (I tried Principal and Secundary Lights, but Siri never understood me, you can put anything, just change in the "ask" command and in both "if" commands).