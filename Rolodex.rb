#Rolodex.rb

class Rolodex

require_relative './Contact.rb'


	@@ids = 1001

	def initialize
		@contacts = []
	end


	def add_contact(contact)

		contact.id = @@ids
		@contacts << contact
		@@ids += 1
		contact
	end


	def modify_contact(id_find, choice, edit_attribute)
	    case choice
	      when 1 then @first_name = edit_attribute
	      when 2 then @last_name = edit_attribute
	      when 3 then @email = edit_attribute
	      when 4 then @note = edit_attribute
	      else
	        "Invalid entry, please try again."
	    end
	end


	def display_contacts
		@contacts
	end

	def find_contact(id_find)
		@contacts.each 	do |contact| 
							if id_find == contact.id.to_s
								puts contact
							else
								"That contact does not exist, please try again."
							end
						end
	end

	def display_attribute(attribute)
		@contacts.each do |contact|
		case  attribute
			when 1 then  puts "#{first_name}"
	       	when 2 then puts "#{last_name}"
	       	when 3 then puts "#{email}"
	       	when 4 then puts "#{note}"
	       	else
	        	"That is not a valid entry, please try again."
	      	end
		end		
	end

	def delete(id)
		#@contacts.each {|contact| contact.delete if contact.id.to_s == id}
		del = find_contact(id)
    	@contacts.delete(del)
	end

end

