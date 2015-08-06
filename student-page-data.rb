require 'nokogiri'  # => true
require 'open-uri'  # => true
require 'pry'       # => true
require_relative 'index_scrape.rb'

class Student
  attr_reader :name, :twitter, :linkedin, :github, :fourth_one

  def initialize(url)
    @url = url
    @html = open(@url).read  # ~> OpenURI::HTTPError: 404 Not Found
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


    def create_students(array)
      array.each do |url|
         name = generate_name(url)  
         name = Student.new(url)
         binding.pry
      end
    end




    def clean_array
      cleaned_array = []
      index_scrape.each do |url|
        begin 
          open(url)
        rescue
         
        else
          cleaned_array << url
        end
      end
      cleaned_array

    end





    


    def generate_names 
      name_array = []
      index_scrape.each do |url|
        html = open(url).read
        index_data = Nokogiri::HTML(html)
        name = index_data.search("h4.ib_main_header").text.downcase.gsub(" ","_")
        name_array << name 
      end
      name_array

    end

# puts generate_names(['http://web0715.students.flatironschool.com/students/nancy_hawa.html', 'http://web0715.students.flatironschool.com/students/adam_moelis.html'])

clean_array







# data_hash[:social_media_array] = student_data.search("div.social-icons a").map {|link| link['href']} # twitter, linkedin, github, and the fourth one

# data_hash[:name] = student_data.search("h4.ib_main_header").text

# data_hash[:bio] = student_data.search("div.services p").first.text.strip

# data_hash[:education] = student_data.search("div.services ul li").text

# #student_work_adam = student_data.search("div.services h4").text

# data_hash[:work] = student_data.search("div.services p")[1].text.strip # COME BACK TO TRY AND SELECT MORE THAN JUST ONE WORK EXPERIENCE

# data_hash[:tag_line] = student_data.search("div.textwidget h3").text


# adam = Student.new("http://web0715.students.flatironschool.com/students/adam_moelis.html")
# puts adam.twitter
# puts adam.linkedin
# puts adam.github
# puts adam.fourth_one


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
