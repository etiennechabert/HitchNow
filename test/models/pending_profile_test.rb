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

    test 'collection creation collision with profile' do
        Profile.create(FactoryGirl.attributes_for(:profile, id: 42))
        PendingProfile.create(id: 42)
        PendingProfile.create_collection([42])
        assert_equal PendingProfile.count, 0
        PendingProfile.create_collection([21, 42])
        assert_equal PendingProfile.count, 1
    end

    test 'collection creation from base girl page' do
        parser = girl_parser
        PendingProfile.create_collection(parser.profile_others_girls)
        assert_equal(PendingProfile.count, parser.profile_others_girls.uniq.count)
        PendingProfile.create_collection(parser.profile_others_girls)
        assert_equal(PendingProfile.count, parser.profile_others_girls.uniq.count)
    end

    test 'pending profile is destroy after profile creation' do
        parser = girl_parser
        PendingProfile.create_collection(parser.profile_others_girls)
        pending = PendingProfile.first
        FactoryGirl.create(:profile, id: pending.id)
        assert_not PendingProfile.find_by_id pending.id
    end

    test 'link_generation' do
        link = PendingProfile.create({id: 42})
        assert_equal 'https://www.adopteunmec.com/profile/42', link.generate_link
    end
end
