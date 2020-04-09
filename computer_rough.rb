class Computer

	@@users = {}


	
	def initialize(username, password)
		
		@@users[username] = password

		@username = username
	    @password = password
	    @files = {}
	    @updates = {}
		@arr = []
	end

	# RUN is a method to iterate over the alphabet, 
	# creatings files to test READ_FILES.

	def run
  	
  	("a".."z").each do |letter|
  		@arr.push(letter)
  	end

	  	@arr.each do |item|
	  		time = "%.6f" % Time.now.to_f 

			@files[item] = time
		end
	end

	# CREATE makes a @file hash key with a Time.now value,
	# Time.now is a float so as to see the exact time of creation.
	
	def create(name)
		time = "%.6f" % Time.now.to_f 

		@files[name] = time
		puts @files
	end

	# READ_FILES displays the @files of a Computer object.	
	def read_files
  		puts @files
  	end

  	# READ_USERS displays all @username @password hashes kept in the class variable @@users

  	def self.read_users
  		puts @@users
  	end


 	# UPDATE prompts the user for a filename
 	# checks to see if the file is in the @files hash
 	# loops until given an existing file
 	# takes the value of the @file hash selected and assigns it to a variable
 	# prompts for new key 
 	# adds the new key with the old time value to @updates hash
 	# merges @files hash and @updates hash

 	# this was done in order to preserve the time stamp of the file

	def update

	  	puts "Which file would you like to update?"
	  	puts @files
	  	select_file = gets.chomp
	  		while @files.has_key?(select_file) == false
	  			puts "The file you selected is invalid. Please select a diffent file:"
	  			puts @files
	  			select_file = gets.chomp
	  		end

	  	time_val = @files.fetch(select_file)
	  	@files.delete(select_file)

	  	puts "Please enter an updated filename: "
	  	select_update = gets.chomp

	  	@updates[select_update] = time_val
	  	@files.merge!(@updates)
	  	@updates = {}

	  	puts "#{select_file} has been updated to #{select_update}."

	  	puts @files
	
	end

	#DELETE removes a file from the @files hash

 	 def delete

	    puts "Which file would you like to delete?"
	    puts @files
	    
	    selected = gets.chomp
	    @files.delete(selected)
	    
	    puts "#{selected} has been removed from #{@username}"
	   
	    puts @files

  	end
end


comp_list = {}
puts "comp_list content #{comp_list}"
puts "comp name"
comp_name = gets.chomp

puts "Enter a username: "
username = gets.chomp
puts "Enter a password: "
password = gets.chomp

comp_list[comp_name] = Computer.new(username, password)




puts "Which computer would you like to choose from?"
puts comp_list

comp_choice = gets.chomp

loop do

puts "Please choose from one of the following options: "
puts "Create, Read, Update, Delete, or Exit."

choice = gets.chomp.downcase

  	case choice

  	when "create"

  		puts "Please enter the name of your file: "
  		filename = gets.chomp.downcase

  		comp_list[comp_choice].create(filename)

  	when "read"
  		puts comp_list[comp_choice].read_files

  	when "update"
  		puts comp_list[comp_choice].update

  	when "delete"
  		puts comp_list[comp_choice].delete

  	when "exit"
  		
  		break

  	else
  	
  		puts "Your selection is not valid. "
  		
	end
end

