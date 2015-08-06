require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative 'index_scrape.rb'

class Student
  attr_reader :name, :twitter, :linkedin, :github, :fourth_one, :bio, :education, :work, :tag_line

  def initialize(url)
    @url = url
    @html = open(@url).read
    @student_data = Nokogiri::HTML(@html)
    @name = @student_data.search("h4.ib_main_header").text
    @twitter = @student_data.search("div.social-icons a").map {|link| link['href']}[0]
    @linkedin= @student_data.search("div.social-icons a").map {|link| link['href']}[1]
    @github = @student_data.search("div.social-icons a").map {|link| link['href']}[2]
    @fourth_one = @student_data.search("div.social-icons a").map {|link| link['href']}[3]
    @bio = @student_data.search("div.services p").first.text.strip
    @education = @student_data.search("div.services ul li").text
    @work = @student_data.search("div.services p")[1].text.strip
    @tag_line = @student_data.search("div.textwidget h3").text
  end
end

def clean_url_array
  clean_url_array = []
  index_scrape.each do |url|
    begin 
      open(url)
    rescue
     
    else
      clean_url_array << url
    end
  end
  clean_url_array

end

 def create_students
    
    student_array = clean_url_array.map do |url|
      student_array = Student.new(url)
    end
end



# def generate_names 
#   name_array = []
#   clean_array.each do |url|
#     html = open(url).read
#     index_data = Nokogiri::HTML(html)
#     name = index_data.search("h4.ib_main_header").text.downcase.gsub(" ","_")
#     name_array << name 
#   end
#   name_array
# end









# data_hash[:social_media_array] = student_data.search("div.social-icons a").map {|link| link['href']} # twitter, linkedin, github, and the fourth one

# data_hash[:name] = student_data.search("h4.ib_main_header").text

# data_hash[:bio] = student_data.search("div.services p").first.text.strip

# data_hash[:education] = student_data.search("div.services ul li").text

# #student_work_adam = student_data.search("div.services h4").text

# data_hash[:work] = student_data.search("div.services p")[1].text.strip # COME BACK TO TRY AND SELECT MORE THAN JUST ONE WORK EXPERIENCE

# data_hash[:tag_line] = student_data.search("div.textwidget h3").text




