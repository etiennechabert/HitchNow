require 'test_helper'

class StyleTest < ActiveSupport::TestCase
    test 'Empty fail' do
        assert_raise ActiveRecord::StatementInvalid  do
            Style.create({})
        end
    end

    test 'Deplicate test' do
        Style.create(value: 'test 1')
        assert_raise ActiveRecord::RecordNotUnique do
            Style.create(value: 'test 1')
        end
    end

    test 'basic create' do
        Style.find_or_create_by(value: 'test 1')
        assert_equal(Style.count, 1)
    end

    test 'collision create' do
        Style.find_or_create_by(value: 'test 1')
        assert_equal(Style.count, 1)
        Style.find_or_create_by(value: 'test 1')
        assert_equal(Style.count, 1)
        Style.find_or_create_by(value: 'test 2')
        assert_equal(Style.count, 2)
    end
end
