# Design a customer class that should be used in a project that system plus client will use in his next startup.
# For simplicity the client wants a ruby native class.
# Requirments are given below:
#     It should have following fields: name , customer_unique_id , phone_number ,email , address  , payment_status(success,failed)
#     We need a function upon calling that function it returns the data of all customers.
#     If we provide data in csv(comma seprated) file . it should be able to import that data in to your class.
#     A function which should return the count of success and failed payments. (This function will be most frequently called)
#     A function which should return all those customers who have payment_status as success
#     Except unique id we can update any field of the customer.
#     Two customers cannot have same phone number or email.

# Use Object oriented programming paradigm to solve this problem.
# Your solution will be judged based on decision choices and data structures you chooze to solve this problem.
# Best of luck.
# Happy Coding.
require_relative "libs/customer.rb"

def customer_input
  puts "Enter ID "
  customer_unique_id = gets.chomp
  puts "Enter Name: "
  name = (gets.chomp).downcase
  if name[/\s/] != nil
    puts "Name not having a space"
    name = (gets.chomp).downcase
  end
  puts "Enter Address: "
  address = gets.chomp
  puts "Enter Phone Number"
  phone_number = gets.chomp
  if phone_number[/^([+])?([^\d]?\d){5,18}$/] == nil
    puts "Invalid"
    puts "Enter Again Phone Number"
    phone_number = gets.chomp
    if phone_number[/^([+])?([^\d]?\d){5,18}$/] == nil
      puts "Again wrong input."
      puts "System is about to exit"
      exit
    end
  end
  puts "Enter Email Address: "
  email = gets.chomp
  if email[/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i] == nil
    puts "Invalid Email"
    puts "Enter Again Email Address: "
    email = gets.chomp
    if email[/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i] == nil
      puts "Again wrong input."
      puts "System is about to exit"
      exit
    end
  end
  puts "Enter Payment Status"
  payment_status = gets.chomp
  return customer_unique_id, name, address, phone_number, email, payment_status
end

customer_menu_flag = true
while customer_menu_flag
  system("clear")
  puts "         Customer Menu  "
  puts "     1.Add Customer"
  puts "     2.Show Customer"
  puts "     3.Update Customer Record"
  puts "     4.Exit"
  pick = gets.chomp
  if pick == "1"
    customers = customer_input
    cust = Customer.new(customers[0], customers[1], customers[2], customers[3], customers[4], customers[5])
    cust.save_customer
    puts "Enter any key to continue"
    inp = gets.chomp
  elsif pick == "2"
    Customer.show_customer
    puts "Enter any key to continue"
    inp = gets.chomp
  elsif pick == "3"
    puts "Enter name you want to change record"
    prev_name = (gets.chomp).downcase
    customers = customer_input
    update = Customer.new(customers[0], customers[1], customers[2], customers[3], customers[4],customers[5])
    update.update_customer(prev_name)
    puts "Enter any key to continue"
    inp = gets.chomp
  elsif pick == "4"
    customer_menu_flag = false
  else
    puts "HALT...!!! You Choose Wrong option "
  end
end
