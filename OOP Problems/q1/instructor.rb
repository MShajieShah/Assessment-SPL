require_relative "user.rb"

class Instructor
  attr_accessor :instructor_username, :designation, :qualification

  def initialize(inst_fname, inst_lname, inst_pass, instructor_username, inst_designation, inst_qualification)
    @user_firstname = inst_fname
    @user_lastname = inst_lname
    @user_pass = inst_pass
    @instructor_username = instructor_username
    @designation = inst_designation
    @qualification = inst_qualification
  end

  def save_inst
    ifile = File.open("data/instructordata")
    data = ifile.readlines
    ifile.close
    data.insert(1, "instructor_first_name: ", @user_firstname, ",", "instructor_last_name: ", @user_lastname, ",", "instructor_password: ", @user_pass, ",", "instructor_username: ", @instructor_username, ",", "instructor_designation: ", @designation, ",", "instructor_qualification: ", @qualification)
    File.write("data/instructordata", data.join, mode: "w")
    puts "Account Created...!!!"
  end

  def courses
    Course.all.select { |course| course.instructor_username == @instructor_username }
  end

  def course_names
    courses.map { |course| course.course_name }
  end
end
