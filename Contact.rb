#Contact.rb

class Contact

	attr_accessor :id, :first_name, :last_name, :email, :note, :one_contact


	def initialize(first_name, last_name, email, note)
		@first_name = first_name
		@last_name = last_name
		@email = email
		@note = note
	end


	def to_s
		"ID: #{id}  " + "Name: #{first_name}, #{last_name}  " + "Email: #{email}  " + "Note: #{note}"
	end

end	