require 'open-uri'  # => true
require 'nokogiri'  # => true

def index_scrape

  page = "http://web0715.students.flatironschool.com/"

  html = open(page)
  index = Nokogiri::HTML(html)

  individual = index.css("ul li.home-blog-post")

  index_pages = []
  page_intro = "http://web0715.students.flatironschool.com/"

  individual.each do |student_profile|
    index_pages <<  page_intro + student_profile.css("div.blog-thumb a").attribute("href").value
  end

  index_pages
end

#
