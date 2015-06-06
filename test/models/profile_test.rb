require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
    test 'Empty fail' do
        assert_raise ActiveRecord::StatementInvalid  do
            Profile.create({})
        end
    end
end
