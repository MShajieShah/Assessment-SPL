require_relative "user.rb"

class Instructor
  attr_accessor :designation, :qualification

  def initialize(inst_fname, inst_lname, inst_pass, inst_uname, inst_designation, inst_qualification)
    @user_firstname = inst_fname
    @user_lastname = inst_lname
    @user_pass = inst_pass
    @user_uname = inst_uname
    @designation = inst_designation
    @qualification = inst_qualification
  end

  def save_inst
    ifile = File.open("data/instructordata")
    data = ifile.readlines
    ifile.close
    data.insert(1, "Instructor First Name: ", @user_firstname, " ", "Instructor Last Name: ", @user_lastname, "  ", "Instructor Password: ", @user_pass, " ", "Instructor User Name: ", @user_uname, " ", "Instructor Designation: ", @designation, " ", "Instructor Qualification: ", @qualification, "\n")
    File.write("data/instructordata", data.join, mode: "w")
    puts "Account Created...!!!"
  end

  def courses
    Course.all.select { |course| course.instructor == self }
  end

  def course_names
    courses.map { |course| course.course_name }
  end
end
