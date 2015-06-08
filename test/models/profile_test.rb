require 'test_helper'

class ProfileTest < ActiveSupport::TestCase

    def raw_data_relation(element)
        element.map {|e| e.value}
    end

    test 'Empty fail' do
        Profile.create({})
        assert_equal Profile.count, 0
    end

    test 'creation without id' do
        attr = FactoryGirl.attributes_for(:profile)
        attr.extract!(:id)
        Profile.create(attr)
        assert_equal Profile.count, 0
    end

    test 'Test creation from base girl page' do
        profile = Profile.create(girl_parser.analyse)
        assert_equal(Profile.count, 1)
        assert_equal(raw_data_relation(profile.hairs), ["châtains", "mi-longs", "raides"])
        assert_equal(raw_data_relation(profile.hobbies), ["découvrir", "lire", "sortir"])
        assert_equal(raw_data_relation(profile.food_likes), ["japonais", "italien", "chinois"])
        assert_equal(raw_data_relation(profile.styles), ["classique", "geekette"])
        assert_equal(raw_data_relation(profile.particularities), ["tatouages", "taches de rousseurs"])
    end
end
