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





