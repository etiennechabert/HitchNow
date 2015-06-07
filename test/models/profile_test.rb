require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
    test 'Empty fail' do
        assert_raise ActiveRecord::StatementInvalid  do
            Profile.create({})
        end
    end

    test 'Test creation from base girl page' do

    end

    test 'Test creation from' do

    end
end
