require 'test_helper'

class PendingProfileTest < ActiveSupport::TestCase
    test 'basic creation' do
        assert PendingProfile.create({id: 42})
    end

    test 'basic collision' do
        PendingProfile.create({id: 42})
        assert_raise ActiveRecord::RecordNotUnique do
            PendingProfile.create({id: 42})
        end
    end

    test 'collection creation' do
        PendingProfile.create_collection([21, 42])
        assert_equal 2, PendingProfile.count
    end

    test 'collection creation collision' do
        PendingProfile.create_collection([21, 42])
        assert_equal 2, PendingProfile.count
        PendingProfile.create_collection([21, 42])
        assert_equal 2, PendingProfile.count
        PendingProfile.create_collection([21, 42, 84])
        assert_equal 3, PendingProfile.count
    end

    test 'link_generation' do
        link = PendingProfile.create({id: 42})
        assert_equal 'https://www.adopteunmec.com/profile/42', link.generate_link
    end
end
