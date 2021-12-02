require_relative "user.rb"

class Instructor
  attr_accessor :designation, :qualification

  def initialize(inst_fname, inst_lname, inst_pass, inst_uname, inst_designation, inst_qualification)
    @user_firstname = inst_fname
    @user_lastname = inst_lname
    @user_pass = inst_pass
    @user_uname = inst_uname
    @designation = designation
    @qualification = qualification
  end

  def marks
  end
end
