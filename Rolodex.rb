#Rolodex.rb

class Rolodex

#require_relative './Contact.rb'


	@@ids = 1001

	def initialize
		@contacts = []
		#@contacts= Contact.new("jesse", "jp@rogers.com", "can tie shoes")
		#@contacts= Contact.new("donna", "der@rogers.com", "call weekly")
	end


	def add_contact(contact)

		contact.id = @@ids
		@contacts << contact
		@@ids += 1
		contact
	end


	# def modify_contact(id_find, choice, edit_attribute)
	# 	c = find_contact(id_find)
	#     case choice
	#       when 1 then @contacts.each {|contact| puts contact[1]}
	#       when 2 then c[1].replace(edit_attribute)
	#       when 3 then c[2].replace(edit_attribute)
	#       when 4 then c[3].replace(edit_attribute)
	#       else
	#         "Invalid entry, please try again."
	#     end
	# end


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
			
# figure out how to pull the attribute after the ID - indexing?
		case  attribute
			when 1 then puts contact.first_name 
	       	when 2 then puts contact.last_name
	       	when 3 then puts contact.email
	       	when 4 then puts contact.note
	       	else
	        	"That is not a valid entry, please try again."
	      	end
		end		
	end

	def delete(id)
		del = find_contact(id)
    	@contacts.delete(del)
	end

end

