require_relative "user.rb"

class Student
  attr_accessor :roll_no, :status

  def initialize(std_fname, std_lname, std_pass, std_uname, std_rollno, std_status)
    @user_firstname = std_fname
    @user_lastname = std_lname
    @user_pass = std_pass
    @user_uname = std_uname
    @roll_no = std_rollno
    @status = std_status
  end

  def save_std
    ifile = File.open("data/studentdata")
    data = ifile.readlines
    ifile.close
    data.insert(1, "Student First Name: ", @user_firstname, " ", "Student Last Name: ", @user_lastname, "  ", "Student Password: ", @user_pass, " ", "Student User Name: ", @user_uname, " ", "Student Roll no: ", @rollno, " ", "Student Status: ", @status, "\n")
    File.write("data/studentdata", data.join, mode: "w")
    puts "Account Created...!!!"
  end

  def courses
    Course.all.select { |course| course.student == self }
  end

  def course_names
    courses.map { |course| course.course_name }
  end
end
