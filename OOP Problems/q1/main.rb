# Object Oriented Programming
# Simple Learning Management System:
# You are required to use Object Oriented Approach to design a Learning Management System for students and professors.
# A user of LMS has three data members: firstName, lastName, password and userName. (may be other data members also). A user can sign in/sign out to LMS system. A user of LMS can be a
# Student
# Instructor
# A student has two additional data members: roll number and status (status can be freshman, sophomore, junior and senior). A student can:
# View his own marks only
# View resources uploaded by instructor
# View roster of a course (list of students enrolled in a course + instructor(s) offering that course)
# View Assignments of a course
# An instructor has two additional data members: designation and qualification. An instructor can:
# Add/View Marks of all students enrolled in a course being taught by that teacher
# Add/View Resources to a course tab
# View roster of a course (list of students enrolled in a course + instructor(s) offering that course)
# Add/View Assignments of a course
# A course has data members: courseName, courseCode and offeringSchool and capacity. (may be other data members also). You are free to add data members to any class. Make sure that you can’t declare data members of any class public.
# When a student logs in to LMS, (s)he will see the list of course tabs in which (s)he is enrolled in. On navigating to particular course tab, a student can view list of resources, assignments, view list of students enrolled in that course and can view his/her marks list only. When an instructor logs in to LMS, he will see the list of courses being taught by him. On navigating to a particular course tab, instructor can view list of resources, add a new resource item to resources list, view list of assignments, add a new assignment to assignment list, add marks of students enrolled in that course, view marks of all students enrolled in that course and view list of students enrolled in that course. [For adding a new assignment/resource, instructor only adds name of assignment/resource or some text as content. Obviously there will be a due date only for assignments.] You have to implement concepts of inheritance and polymorphism in this assignment.
# Requirements:
# Create Interfaces/Abstractions for Users and Course Class.
# Create Interface/Abstractions for Student And Professor Class.
# Proper Encapsulations for all the classes based on Functionality
# Override a method getProfile in User class that will print status for Student and designation for a Professor i.e. for Student("Sohail Aslam","senior") getProfile prints Sohail Aslam is a senior student at LUMS
# And for a Professor("Habib-ur-Rehman","Assistant Professor") overridden getProfile will print Habib-ur-Rehman is Assistant Professor at LUMS
# Overload operators if required.
# Thought Process and Approach in this problem should be well documented
require_relative "student.rb"
require_relative "instructor.rb"
require_relative "course.rb"

def student_input
  puts "Enter First Name: "
  std_fname = (gets.chomp).downcase
  puts "Enter Last Name: "
  std_lname = (gets.chomp).downcase
  puts "Enter Password: "
  std_pass = gets.chomp
  if std_pass[/^(?=.*[a-zA-Z])(?=.*[0-9])/] == nil
    puts "Invalid Password"
    puts "Enter Again Password "
    std_pass = gets.chomp
    if std_pass[/^(?=.*[a-zA-Z])(?=.*[0-9])/] == nil
      puts "Again wrong input."
      puts "System is about to exit"
      exit
    end
  end
  puts "Enter User Name: "
  std_uname = (gets.chomp).downcase
  if std_uname[/\s/] != nil
    puts "Name not having a space"
    std_uname = (gets.chomp).downcase
  end
  puts "Enter Student Roll No"
  std_rollno = gets.chomp
  puts "Enter Student Status"
  puts "(status can be freshman, sophomore, junior and senior)"
  std_status = gets.chomp
  return std_fname, std_lname, std_pass, std_uname, std_rollno, std_status
end

def course_input
  puts "Enter code: "
  course_code = (gets.chomp).downcase
  puts "Enter Course Name: "
  course_name = gets.chomp
  puts "Enter Course : "
  offering_school = gets.chomp
  puts "Enter Course Name: "
  capacity = gets.chomp

  return course_code, course_name, offering_school, capacity
end

puts "-------------------------------------"
puts "|                                   |"
puts "|   Learning Management System      |"
puts "|                                   |"
puts "-------------------------------------"
puts "       1. Sign In"
puts "       2.Sign Up"
option = gets.chomp
if option == "1"
  puts "Enter User Name"
  entry_name = (gets.chomp).downcase
  puts "Enter a valid Password"
  pass = gets.chomp
else option == "2"
  students = student_input
  std = Student.new(students[0], students[1], students[2], students[3], students[4], students[5])
  std.save_std end
# course_menu_flag = true
# while course_menu_flag
#   system("clear")
#   puts "         Course Menu  "
#   puts "     1.Add Course"
#   puts "     2.Show Course List"
#   puts "     3.Return"
#   pick = gets.chomp
#   if pick == "1"
#     courses = course_input
#     cour = Course.new(courses[0], courses[1], courses[2], courses[3])
#     cour.save_course
#     puts "Enter any key to continue"
#     inp = gets.chomp
#   elsif pick == "2"
#     Course.show_course
#     puts "Enter any key to continue"
#     inp = gets.chomp
#   elsif pick == "3"
#     course_menu_flag = false
#   else
#     puts "HALT...!!! You Choose Wrong option "
#   end
# end
# #students
# shaje = Student.new("Shajie", "shah", "abc", "shah", "123", "no")
# noman = Student.new("Noman", "Jamil", "def", "nomi", "321", "yes")

# #courses
# #shaje
# english = Course.new("123", "English", "st.stephen", "123", shaje)
# math = Course.new("321", "Math", "st.stephen", "321", shaje)
# stat = Course.new("456", "Stat", "st.stephen", "456", shaje)
# computer = Course.new("654", "Computer", "st.stephen", "654", shaje)

# #noman
# urdu = Course.new("789", "Urdu", "st.stephen", "123", noman)
# isl = Course.new("987", "Islamiyat", "st.stephen", "123", noman)
# sst = Course.new("85", "Social Studies", "st.stephen", "123", noman)
# sci = Course.new("58", "Sciences", "st.stephen", "123", noman)

# p shaje.course_names
# p noman.course_names
