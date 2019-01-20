gem 'activerecord', '=4.2.10'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact
  attr_reader :id
attr_accessor :first_name, :last_name, :email, :note
@@contacts = []
@@id = 1


  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1

  end

  # This method should call the initializer, 
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    a = Contact.new(first_name, last_name, email, note)
    @@contacts << a
    return a

  end

  # This method should return all of the existing contacts
  def self.all
   return @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(input_id)
      @@contacts.each do |c|
       if input_id == c.id
        puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#{c}"
        return c
       end
       
      end
      return nil
  end

  # This method should allow you to specify 
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, new_value)
    if attribute == "first_name"
      self.first_name = new_value
  
    elsif attribute == "last_name"
      self.last_name = new_value
  
    elsif attribute == "email"
      self.email = new_value
  
    elsif attribute == "note"
      self.note = new_value
    end

  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(input_attribute, value)
      @@contacts.each do |c|
       if input_attribute == 'first_name' && c.first_name == value
        return c
       elsif input_attribute == 'last_name' && c.last_name == value
        return c
       elsif input_attribute == 'email' && c.email == value
        return c
       elsif input_attribute == 'note' && c.note == value
        return c
       end
       
      end
      return nil

  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = 0

  end

  def full_name
    puts "#{@first_name} #{last_name}"

  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete

  end

  # Feel free to add other methods here, if you need them.
  
end
