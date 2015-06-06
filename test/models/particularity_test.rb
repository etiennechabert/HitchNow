require 'test_helper'

class ParticularityTest < ActiveSupport::TestCase
    test 'Empty fail' do
        assert_raise ActiveRecord::StatementInvalid  do
            Particularity.create({})
        end
    end

    test 'Deplicate test' do
        Particularity.create(value: 'test 1')
        assert_raise ActiveRecord::RecordNotUnique do
            Particularity.create(value: 'test 1')
        end
    end

    test 'basic create' do
        Particularity.find_or_create_by(value: 'test 1')
        assert_equal(Particularity.count, 1)
    end

    test 'collision create' do
        Particularity.find_or_create_by(value: 'test 1')
        assert_equal(Particularity.count, 1)
        Particularity.find_or_create_by(value: 'test 1')
        assert_equal(Particularity.count, 1)
        Particularity.find_or_create_by(value: 'test 2')
        assert_equal(Particularity.count, 2)
    end
end
