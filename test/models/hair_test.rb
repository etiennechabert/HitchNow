require 'test_helper'

class HairTest < ActiveSupport::TestCase
    test 'Empty fail' do
        assert_raise ActiveRecord::StatementInvalid  do
            Hair.create({})
        end
    end

    test 'Deplicate test' do
        Hair.create(value: 'test 1')
        assert_raise ActiveRecord::RecordNotUnique do
            Hair.create(value: 'test 1')
        end
    end

    test 'basic create' do
        Hair.find_or_create_by(value: 'test 1')
        assert_equal(Hair.count, 1)
    end

    test 'collision create' do
        Hair.find_or_create_by(value: 'test 1')
        assert_equal(Hair.count, 1)
        Hair.find_or_create_by(value: 'test 1')
        assert_equal(Hair.count, 1)
        Hair.find_or_create_by(value: 'test 2')
        assert_equal(Hair.count, 2)
    end
end
