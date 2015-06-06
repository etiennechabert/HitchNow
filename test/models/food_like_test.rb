require 'test_helper'

class FoodLikeTest < ActiveSupport::TestCase
    test 'Empty fail' do
        assert_raise ActiveRecord::StatementInvalid  do
            FoodLike.create({})
        end
    end

    test 'Deplicate test' do
        FoodLike.create(value: 'test 1')
        assert_raise ActiveRecord::RecordNotUnique do
            FoodLike.create(value: 'test 1')
        end
    end

    test 'basic create' do
        FoodLike.find_or_create_by(value: 'test 1')
        assert_equal(FoodLike.count, 1)
    end

    test 'collision create' do
        FoodLike.find_or_create_by(value: 'test 1')
        assert_equal(FoodLike.count, 1)
        FoodLike.find_or_create_by(value: 'test 1')
        assert_equal(FoodLike.count, 1)
        FoodLike.find_or_create_by(value: 'test 2')
        assert_equal(FoodLike.count, 2)
    end
end
