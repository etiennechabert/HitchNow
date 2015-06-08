ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def girl_file_content(file_name='base_girl_test.html')
      f = File.open("test/fixtures/girls_html/#{file_name}")
      r = Nokogiri::HTML(f)
      f.close
      r
  end

  def girl_parser(file_name='base_girl_test.html')
    GirlHtmlParser.new(girl_file_content(file_name))
  end


  # Add more helper methods to be used by all tests here...
end
