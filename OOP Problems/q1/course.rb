class Course
  attr_accessor :course_name, :course_code, :offering_school, :capacity, :instructor
  @@all = []

  def initialize(course_code, course_name, offering_school, capacity, instructor)
    @course_code = course_code
    @course_name = course_name
    @offering_school = offering_school
    @capacity = capacity
    @instructor = instructor
    @@all << self
  end

  def save_course
    ifile = File.open("data/coursedata")
    data = ifile.readlines
    ifile.close
    data.insert(1, "Course Code: ", @course_code, " ", "Course Name: ", @course_name, "  ", "Offering School: ", @offering_school, " ", "Capacity: ", @capacity, " ", "\n")
    File.write("data/coursedata", data.join, mode: "w")
    puts "Course Added Sucessfully"
  end

  def self.show_course
    File.foreach("data/coursedata") { |line| puts line }
  end
  def self.all
    @@all
  end
end
