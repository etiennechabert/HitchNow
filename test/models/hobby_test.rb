require 'test_helper'

class HobbyTest < ActiveSupport::TestCase
    test 'Empty fail' do
        assert_raise ActiveRecord::StatementInvalid  do
            Hobby.create({})
        end
    end

    test 'Deplicate test' do
        Hobby.create(value: 'test 1')
        assert_raise ActiveRecord::RecordNotUnique do
            Hobby.create(value: 'test 1')
        end
    end

    test 'basic create' do
        Hobby.find_or_create_by(value: 'test 1')
        assert_equal(Hobby.count, 1)
    end

    test 'collision create' do
        Hobby.find_or_create_by(value: 'test 1')
        assert_equal(Hobby.count, 1)
        Hobby.find_or_create_by(value: 'test 1')
        assert_equal(Hobby.count, 1)
        Hobby.find_or_create_by(value: 'test 2')
        assert_equal(Hobby.count, 2)
    end
end
