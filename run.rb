
require_relative 'index_scrape.rb'
require_relative 'student-page-data.rb'
require_relative 'scrape_student_cli.rb'

array = create_students

Program.new(array).run