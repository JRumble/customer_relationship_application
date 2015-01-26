#CRKM.rb

require_relative './Rolodex.rb'
require_relative './Contact.rb'

class CRM


	def initialize(name)
		@name = name
		@rolodex = Rolodex.new
	end


	def	print_main_menu
		puts "[1] Add a contact"
		puts "[2] Modify a contact"
		puts "[3] Display all contacts"
		puts "[4] Display one contact"
		puts "[5] Display an attribute"
		puts "[6] Delete a contact"
		puts "[7] Exit"
		puts "Enter a number:"
	end


	def main_menu
		puts "Welcome to #{@name}"

		while true
			print_main_menu
			input = gets.chomp.to_i
			choose_option(input)
			return if input == 7
		end
	end


	def choose_option(option)
		case option
		when 1 then add_contact
		when 2 then modify_contact
		when 3 then display_all_contacts
		when 4 then display_contact
		when 5 then display_attribute
		when 6 then delete_contact
		when 7 then 
			puts "Good-bye"
			return
		else
			puts "Invalid entry, please try again."
		end
	end



	def add_contact
		puts "Please provide contact details."

		print "First Name: "
		first_name = gets.chomp.capitalize

		print "Last Name: "
		last_name = gets.chomp.capitalize

		print "Email: "
		email = gets.chomp.downcase

		print "Note: "
		note = gets.chomp.capitalize

		new_contact = Contact.new(first_name, last_name, email, note)
		# contact = Contact.new("Jesse", "Paget", "jesse.paget@rogers.com", "the dude")
		# contact = Contact.new("Donna", "Rumble", "der@rogers.com", "needs phone call weekly")
		# contact = Contact.new("Ben", "Sutton", "b.sutton@rogers.com", "Jesse friend")
		@rolodex.add_contact(new_contact)
	end

	def modify_contact
		puts "Please enter the ID of contact to modify: "
 		id_find = gets.chomp
     	puts "Is this the correct contact? Enter Yes or No: "
     	@rolodex.find_contact(id_find)
     	response = gets.chomp.capitalize
     		if response == "Yes"
	      		puts "[1] First Name"
				puts "[2] Last Name"
				puts "[3] Email"
				puts "[4] Note"
				puts "Please enter the number of the attribute you would like to modify: "
      			choice = gets.chomp
      			puts "Enter modification:"
      			edit_attribute = gets.chomp!
      			@rolodex.modify_contact(id_find, choice, edit_attribute)
      			puts "Modification complete: "
      			@rolodex.find_contact(id_find)
    		elsif response == 'No'
      			modify_contact
    		else
      			puts "That is not a valid answer, please try again."
      		end
    end


	def display_all_contacts
		puts @rolodex.display_contacts
	end


	def display_contact
		puts "Please enter your ID"
		print "ID: "
		id_find = gets.chomp
		@rolodex.find_contact(id_find)	
	end


	def display_attribute
		puts "Please identify the number of the attribute."
		puts "[1] First Name"
		puts "[2] Last Name"
		puts "[3] Email"
		puts "[4] Note"
		attribute = gets.chomp
		@rolodex.display_attribute(attribute)
	end


	def delete_contact
		puts "Which contact ID would you like to delete?"
		id = gets.chomp
    	@rolodex.delete(id)
	end



end

bitmaker = CRM.new("Rumble's CRM")
bitmaker.main_menu