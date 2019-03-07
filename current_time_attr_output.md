talk.start_time = element.css("time.start-time")
#Output:

[#<Nokogiri::XML::Element:0x2cda440 name="time" attributes=[#<Nokogiri::XML::Attr:0x2cda3c8 name="class" value="start-time">, #<Nokogiri::XML::Attr:0x2cda3a0 name="itemprop" value="startDate">, #<Nokogiri::XML::Attr:0x2cda378 name="datetime" value="October 27T9:30">] children=[#<Nokogiri::XML::Text:0x2ce3568 " 9">, #<Nokogiri::XML::Element:0x2ce3360 name="span" children=[#<Nokogiri::XML::Text:0x2ce2ca8 "30">]>, #<Nokogiri::XML::Text:0x2ce2a50 " ">]>]

talk.start_time = element.css("time.start-time").attribute("datetime")
#Output:

(Attr:0x2c2f004 { name = "datetime", value = "October 27T10:30" }),
