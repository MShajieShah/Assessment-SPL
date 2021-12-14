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
# # Thought Process and Approach in this problem should be well documented
require_relative "libs/user.rb"
require_relative "libs/student.rb"
require_relative "libs/instructor.rb"
require_relative "libs/course.rb"
require_relative "libs/assignment.rb"
require_relative "libs/marks.rb"
require_relative "libs/resource.rb"

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
  student_username = (gets.chomp).downcase
  if student_username[/\s/] != nil
    puts "Name not having a space"
    student_username = (gets.chomp).downcase
  end
  puts "Enter Student Roll No"
  std_rollno = gets.chomp
  puts "Enter Student Status"
  puts "(status can be freshman, sophomore, junior and senior)"
  std_status = gets.chomp
  return std_fname, std_lname, std_pass, student_username, std_rollno, std_status
end

#instructor input
def instructor_input
  puts "Enter First Name: "
  inst_fname = (gets.chomp).downcase
  puts "Enter Last Name: "
  inst_lname = (gets.chomp).downcase
  puts "Enter Password: "
  inst_pass = gets.chomp
  if inst_pass[/^(?=.*[a-zA-Z])(?=.*[0-9])/] == nil
    puts "Invalid Password"
    puts "Enter Again Password "
    inst_pass = gets.chomp
    if inst_pass[/^(?=.*[a-zA-Z])(?=.*[0-9])/] == nil
      puts "Again wrong input."
      puts "System is about to exit"
      exit
    end
  end
  puts "Enter User Name: "
  instructor_username = (gets.chomp).downcase
  if instructor_username[/\s/] != nil
    puts "Name not having a space"
    instructor_username = (gets.chomp).downcase
  end
  puts "Enter Instructor Designation"
  inst_designation = gets.chomp
  puts "Enter Instructor Qualification"
  inst_qualification = gets.chomp
  return inst_fname, inst_lname, inst_pass, instructor_username, inst_designation, inst_qualification
end

#course input
def course_input
  puts "Enter code: "
  course_code = (gets.chomp).downcase
  puts "Enter Course Name: "
  course_name = gets.chomp
  puts "Enter Offering School : "
  offering_school = gets.chomp
  puts "Enter Capacity: "
  capacity = gets.chomp

  return course_code, course_name, offering_school, capacity
end

#assignment input
def assignment_input
  puts "Enter Assignment Course Code"
  assign_course_code = (gets.chomp).downcase
  puts "Enter Assignment Title: "
  assign_title = gets.chomp

  return assign_course_code, assign_title
end

#marks input
def mark_input
  puts "Enter Assignment Name"
  assign_name = (gets.chomp).downcase
  puts "Enter Student User Name: "
  student_name = gets.chomp
  puts "Enter Marks"
  assign_marks = gets.chomp
  return assign_name, student_name, assign_marks
end

#resources_input
def resource_input
  puts "Enter Assignment Name"
  assign_subject = (gets.chomp).downcase
  puts "Enter Resource: "
  resource_name = gets.chomp
  return assign_subject, resource_name
end

main_menu_flag = true
while main_menu_flag
  system("clear")
  puts "-------------------------------------"
  puts "|                                   |"
  puts "|   Learning Management System      |"
  puts "|                                   |"
  puts "-------------------------------------"
  puts "       1. Sign In As Student"
  puts "       2. Sign In As Instructor"
  puts "       3. Sign Up"
  puts "       4. Exit"
  option = gets.chomp
  if option == "1"
    puts "Enter User Name"
    entry_name = (gets.chomp).downcase
    puts "Enter a valid Password"
    pass = gets.chomp
    mem = File.readlines("data/studentdata").select { |word| word.include?(entry_name) }
    std_pass = Student.pass_check(mem)
    if std_pass == pass
      if mem == []
        puts "Record Not Found"
        exit
      else
        student_username = Student.user_name(mem)  #fetching
        student_menu_flag = true
        while student_menu_flag
          system("clear")
          Student.getprofile(entry_name)
          puts "         Student Menu  "
          puts "     1.View Marks"
          puts "     2.View Resource"
          puts "     3.View Roaster"
          puts "     4.View Assignment"
          puts "     5.Exit"
          choice = gets.chomp
          if choice == "1"
            Marks.show_marks(student_username)
            puts "Enter any key to continue"
            inp = gets.chomp
          elsif choice == "2"
            puts "Enter Assignment Name"
            course_code = gets.chomp
            Student.show_resource(course_code)
            puts "Enter any key to continue"
            inp = gets.chomp
          elsif choice == "3"
            Student.show_course(student_username)
            puts "Enter any key to continue"
            inp = gets.chomp
          elsif choice == "4"
            puts "Enter Course code"
            course_code = gets.chomp
            Assignment.show_assign(course_code)
            puts "Enter any key to continue"
            inp = gets.chomp
          elsif choice == "5"
            student_menu_flag = false
          end
        end
      end
    else
      puts "Wrong Password"
      puts "Enter any key to exit"
      inp = gets.chomp
    end
  elsif option == "2"
    puts "Enter User Name"
    entry_name = (gets.chomp).downcase
    puts "Enter a valid Password"
    pass = gets.chomp
    mem = File.readlines("data/instructordata").select { |word| word.include?(entry_name) }
    inst_pass = Instructor.pass_check(mem)
    instructor_username = Instructor.inst_user_name(mem)
    if inst_pass == pass
      if instructor_username == entry_name
        instructor_menu_flag = true
        while instructor_menu_flag
          system("clear")
          Instructor.getprofile(entry_name)
          puts "         Instructor Menu  "
          puts "     1.Add Course"
          puts "     2.Add Marks"
          puts "     3.Add Resources"
          puts "     4.Add Assignment"
          puts "     5.Exit"
          choice = gets.chomp
          if choice == "1"
            course_menu_flag = true
            while course_menu_flag
              system("clear")
              puts "         Course Menu  "
              puts "     1.Add Course"
              puts "     2.Show Course List"
              puts "     3.Return"
              pick = gets.chomp
              if pick == "1"
                courses = course_input
                course = Course.new(courses[0], courses[1], courses[2], courses[3], instructor_username)
                course.save_course
                puts "Enter any key to continue"
                inp = gets.chomp
              elsif pick == "2"
                puts Course.find_by(entry_name)
                puts "Enter any key to continue"
                inp = gets.chomp
              elsif pick == "3"
                course_menu_flag = false
              else
                puts "HALT...!!! You Choose Wrong option "
              end
            end
          elsif choice == "2"
            marks = mark_input
            mark = Marks.new(marks[0], marks[1], marks[2])
            mark.save_assign_marks
          elsif choice == "3"
            resources = resource_input
            resour = Resource.new(resources[0], resources[1])
            resour.save_resources
          elsif choice == "4"
            assignments = assignment_input
            assign = Assignment.new(assignments[0], assignments[1], instructor_username)
            assign.save_assign
          elsif choice == "5"
            instructor_menu_flag = false
          end
        end
      else
        puts "Record Not Found"
        puts "Enter any key to continue"
        inp = gets.chomp
      end
    else
      puts "Worng Password"
      puts "Enter any key to continue"
      inp = gets.chomp
    end
  elsif option == "3"
    signup_menu_flag = true
    while signup_menu_flag
      system("clear")
      puts "-------------------------------------"
      puts "|                                   |"
      puts "|   Learning Management System      |"
      puts "|                                   |"
      puts "-------------------------------------"
      puts "       1. Sign Up As Student"
      puts "       2. Sign Up As Instructor"
      puts "       3.Return"
      pick = gets.chomp
      if pick == "1"
        students = student_input
        mem = File.readlines("data/studentdata").select { |word| word.include?(students[3]) }
        if mem == []
          std = Student.new(students[0], students[1], students[2], students[3], students[4], students[5])
          std.save_std
        else
          system("clear")
          p "User Name already exist"
          p "User Name should be unique"
          puts "Enter any key to continue"
          inp = gets.chomp
          exit!
        end
      elsif pick == "2"
        instructors = instructor_input
        mem = File.readlines("data/instructordata").select { |word| word.include?(instructors[3]) }
        if mem == []
          inst = Instructor.new(instructors[0], instructors[1], instructors[2], instructors[3], instructors[4], instructors[5])
          system("clear")
          inst.save_inst
        else
          system("clear")
          p "User Name already exist"
          p "User Name should be unique"
          puts "Enter any key to continue"
          inp = gets.chomp
          exit!
        end
      elsif pick == "3"
        signup_menu_flag = false
      else
        system("clear")
        puts "HALT....!!!! You choose the wrong Option"
        puts "Restart again"
      end
    end
  elsif option == "4"
    main_menu_flag = false
  else
    system("clear")
    puts "HALT....!!!! You choose the wrong Option"
    puts "Restart again"
  end
end
