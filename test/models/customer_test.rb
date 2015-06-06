require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
    test 'Fail Creation empty' do
        assert_raise do
            Customer.create({})
        end
    end

    test 'Fail creation missing field' do
        false
    end

    test "Fail creation password doesn't match" do
        false
    end

    test "Success creation" do

    end
end
