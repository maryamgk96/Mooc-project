require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "check if the title is saved right" do
    course=Course.create(title: 'rails', user_id: '1')
    assert_equal course.title, 'ils'
    
  end
end
