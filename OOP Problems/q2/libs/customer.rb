class Customer
  attr_accessor :name, :customer_unique_id, :phone_number, :email, :address, :payment_status

  def initialize(customer_unique_id, name, phone_number, email, address, payment_status)
    @customer_unique_id = customer_unique_id
    @name = name
    @phone_number = phone_number
    @email = email
    @address = address
    @payment_status = payment_status
  end

  def save_customer
    ifile = File.open("data/customerdata")
    data = ifile.readlines
    ifile.close
    data.insert(1, "Customer ID: ", @customer_unique_id, " ", "Name :", @name, "  ", "Address:", @address, " ", "Phone No:", @phone_number, " ", "Email:", @email, " ", "Payment Status:", @payment_status, " ", "\n")
    File.write("data/customerdata", data.join, mode: "w")
    puts "Record Added Sucessfully"
  end

  def self.show_customer
    File.foreach("data/customerdata") { |line| puts line }
  end

  def update_customer(prev_name)
    ifile = File.open("data/customerdata")
    data = ifile.readlines
    id = 1
    data.insert(1, "Customer ID: ", id.to_s, " ", "Name :", @name, "  ", "Address:", @address, " ", "Phone No:", @phone_number, " ", "Email:", @email, " ", "Payment Status:", @payment_status, " ", "\n")
    File.write("data/customerdata", data.join, mode: "w")
    read_file = File.new("data/customerdata", "r+").read
    write_file = File.new("data/customerdata", "w")
    puts "Record Updated Sucessfully"
    read_file.each_line do |line|
      write_file.write(line) unless line.include? prev_name
    end
    write_file.close
  end
end
