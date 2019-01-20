require_relative 'contact'

class CRM < Contact 
  
  def initialize

  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts "[1] add a new contact"
    puts "[2] modify an exsisting contact"
    puts "[3] delete contact"
    puts "[4] display all the contacts"
    puts "[5] search by attribute"
    puts "[6] exit"
    puts "enter a number"

  end

  def call_option(user_selected)
      case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
      when 6 then exit
      end 
  end

  def add_new_contact
    puts "first name"
    first_name = gets.chomp
    puts "last name"
    last_name = gets.chomp
    puts "email"
    email = gets.chomp
    puts "note"
    note = gets.chomp
  Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
      puts "enter id of the contact that you want to modify"
      id = gets.chomp.to_i
      found_contact = Contact.find(id)
      puts "what would you like to modify?"
      attribute = gets.chomp
      puts "enter new value"
      value = gets.chomp
      found_contact.update(attribute, value)
          
  end

  def delete_contact
    puts "enter id of the contact that you want to modify"
      id = gets.chomp
      c.id = 0

  end

  def display_all_contacts
    p Contact.all
    
  end

  def search_by_attribute
    puts "Enter attribute you want to search by"
    attribute = gets.chomp
    puts ""
    
  end


end

a = CRM.new
a.main_menu