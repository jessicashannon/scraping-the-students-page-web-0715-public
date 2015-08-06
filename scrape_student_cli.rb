# Greets user, presents them with options & explanations

# List students (numbered)
# When they choose a name, displays student's properties (numbered)
# WHen user chooses property, displays value
# At any time they can type "menu" to return to main menu or "exit" to leave

require_relative 'student-page-data.rb'
require_relative 'index_scrape.rb'

class Program
  attr_accessor :currentmenu

  def initialize(students)
    @menu = "main"
    @previousmenu = nil
    @student = nil
    @students = students
  end

  def run
    welcome
    main_menu
  end

  def welcome
    puts "Welcome to the Foo Tang Clan student page!"
    puts "You can return to the main menu at any time by typing 'menu'. To exit, type 'exit'."
    puts "To navigate, type the name or number of the option you want to select."
    #
  end

  def get_user_input
    @input = gets.downcase.chomp
    check_for_exit
  end

  def main_menu
    @currentmenu = "main"
    puts "===== MAIN MENU ======"
    @students.each.with_index(1) do |student, index|
      puts "#{index}. #{student.name}"
    end
    puts "Please pick a student."
    get_user_input
    respond_to_menu
  end

  def check_for_exit
    exit_options = ["exit", "quit", "q", "no"]
    if exit_options.include?(@input)
        abort("Goodbye!")
    end
  end

  def respond_to_menu
    if @currentmenu == "main"

          if valid_input
            @student = valid_input
            student_menu
          else
            puts "I did not understand your input."
            puts "Please pick a student."
            get_user_input
            respond_to_menu
          end
    elsif @currentmenu == "student" 
        student_menu_selection
      puts "Type 'more' to continue seeing info about #{@student.name},"
      puts "or type 'main' to return to the main menu."
      student_menu_choice
    end
  end

def valid_input
   valid_input = @students.find.with_index(1) do |student_object, index|
    @input == student_object.name.downcase || @input == index.to_s 
  end
end

  def student_menu_choice
      get_user_input
      if @input == 'more'
        student_menu
      elsif @input == 'main'
        main_menu
      elsif (1..7).include?(@input.to_i)
         student_menu_selection
      else
        puts "I can't understand that. Please type 'more' or 'main'"
        student_menu_choice
      end
  end

  def student_menu_selection
    case @input
      when "Bio", "1"
        puts @student.bio
      when "Tagline", "2"
        puts @student.tag_line
      when "Education", "3"
        puts @student.education
      when "Work", "4"
        puts @student.work
      when "Twitter", "5"
        puts @student.twitter
      when "Github", "6"
        puts @student.github
      when "LinkedIn", "7"
        puts @student.linkedin
    end
    puts "Type 'more' to continue seeing info about #{@student.name},"
    puts "or type 'main' to return to the main menu."
    student_menu_choice
  end

  def student_menu
    @currentmenu = "student"
    puts "==== STUDENT MENU ====="
    puts @student.name
    ["Bio", "Tagline", "Education", "Work",  "Twitter", "Github", "LinkedIn"].each.with_index(1) do |option, index|
        puts "#{index}. #{option}"
    end
    puts "Please pick an option."
    get_user_input
    respond_to_menu
  end

end

# array_of_student_object = []

# array.find { |student| student.name == parameter || array.index(student) == param} 


# Program