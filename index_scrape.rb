require 'open-uri'  # => true
require 'nokogiri'  # => true

def index_scrape

  page = "http://localhost:8000/"

  html = open(page)
  index = Nokogiri::HTML(html)

  individual = index.css("ul li.home-blog-post")

  index_pages = []

  individual.each do |student_profile|
    index_pages <<  page + student_profile.css("div.blog-thumb a").attribute("href").value
  end

  index_pages
end

