require 'nokogiri'  # => true
require 'open-uri'  # => true
require 'pry'       # => true

class Student
  attr_reader :name

  def initialize(url)
    @url = url
    @html = open(@url).read  # ~> OpenURI::HTTPError: 404 Not Found
    @student_data = Nokogiri::HTML(@html)
    @name = @student_data.search("h4.ib_main_header").text

  end


end



html = open("http://web0715.students.flatironschool.com/students/adam_moelis.html").read  # ~> OpenURI::HTTPError: 404 Not Found
student_data = Nokogiri::HTML(html)
data_hash = {}

data_hash[:social_media_array] = student_data.search("div.social-icons a").map {|link| link['href']} # twitter, linkedin, github, and the fourth one

data_hash[:name] = student_data.search("h4.ib_main_header").text

data_hash[:bio] = student_data.search("div.services p").first.text.strip

data_hash[:education] = student_data.search("div.services ul li").text

#student_work_adam = student_data.search("div.services h4").text

data_hash[:work] = student_data.search("div.services p")[1].text.strip # COME BACK TO TRY AND SELECT MORE THAN JUST ONE WORK EXPERIENCE

data_hash[:tag_line] = student_data.search("div.textwidget h3").text


adam = Student.new("http://web0715.students.flatironschool.com/students/adam_moelis.html")
puts adam.name


# ~> OpenURI::HTTPError
# ~> 404 Not Found
# ~>
# ~> /Users/AdamMoelis/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/open-uri.rb:358:in `open_http'
# ~> /Users/AdamMoelis/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/open-uri.rb:736:in `buffer_open'
# ~> /Users/AdamMoelis/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/open-uri.rb:211:in `block in open_loop'
# ~> /Users/AdamMoelis/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/open-uri.rb:209:in `catch'
# ~> /Users/AdamMoelis/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/open-uri.rb:209:in `open_loop'
# ~> /Users/AdamMoelis/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/open-uri.rb:150:in `open_uri'
# ~> /Users/AdamMoelis/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/open-uri.rb:716:in `open'
# ~> /Users/AdamMoelis/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/open-uri.rb:34:in `open'
# ~> /Users/AdamMoelis/Documents/Flatiron/week-2/day4/scraping-the-students-page-web-0715/student-page-data.rb:5:in `<main>'
