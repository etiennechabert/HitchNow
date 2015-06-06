require 'test_helper'

class LocationTest < ActiveSupport::TestCase
    test 'Empty fail' do
        assert_raise ActiveRecord::StatementInvalid  do
            Location.create({})
        end
    end

    test 'Missing element' do
        assert_raise ActiveRecord::StatementInvalid do
            Location.create(city: 'test fail')
        end

        assert_raise ActiveRecord::StatementInvalid do
            Location.create(country: 'test fail')
        end
    end

    test 'Duplicate test' do
        Location.create(city: 'test 1', country: 'test 1')
        assert_raise ActiveRecord::RecordNotUnique do
            Location.create(city: 'test 1', country: 'test 1')
        end
    end

    test 'Fake duplicate test' do
        Location.create(city: 'test 1', country: 'test 1')
        Location.create(city: 'test 1', country: 'test 2')
        assert_equal(Location.count, 2)
    end

    test 'basic create' do
        Location.find_or_create_by(city: 'test 1', country: 'test 1')
        assert_equal(Location.count, 1)
    end

    test 'collision create' do
        Location.find_or_create_by(city: 'test 1', country: 'test 1')
        assert_equal(Location.count, 1)
        Location.find_or_create_by(city: 'test 1', country: 'test 1')
        assert_equal(Location.count, 1)
        Location.find_or_create_by(city: 'test 2', country: 'test 1')
        assert_equal(Location.count, 2)
    end
end
