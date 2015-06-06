require 'test_helper'

class LocationTest < ActiveSupport::TestCase
    test 'Empty fail' do
        assert_raise ActiveRecord::StatementInvalid  do
            Location.create({})
        end
    end

    test 'Deplicate test' do
        Location.create(name: 'test 1')
        assert_raise ActiveRecord::RecordNotUnique do
            Location.create(name: 'test 1')
        end
    end

    test 'basic create' do
        Location.find_or_create_by(name: 'test 1')
        assert_equal(Location.count, 1)
    end

    test 'collision create' do
        Location.find_or_create_by(name: 'test 1')
        assert_equal(Location.count, 1)
        Location.find_or_create_by(name: 'test 1')
        assert_equal(Location.count, 1)
        Location.find_or_create_by(name: 'test 2')
        assert_equal(Location.count, 2)
    end
end
