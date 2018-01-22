require 'open-uri'
require 'nokogiri'

doc = Nokogiri::XML(open("http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml"))

characters = Hash.new(0) #Initialize hash values at 0.

doc.xpath('//SPEECH').each do |speech| #Takes every SPEECH element found in doc.

	 speaker = speech.at_xpath('SPEAKER') #Selects only the first SPEAKER found.

	 if(speaker.text != "ALL")
	 	speaker.css('~ LINE').each do |line| #Select sibling nodes to the speaker.

	 		characters[speaker.text] += 1 #sum a line for each line found at[speaker.text].

	 	end
	 end
end

characters.each do |key, value|

	puts "#{value} : #{key}"

end