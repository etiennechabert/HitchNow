require 'test_helper'

class GirlHtmlParserTest < ActiveSupport::TestCase
    def get_file_content(file_name='base_girl_test.html')
        f = File.open("test/fixtures/girls_html/#{file_name}")
        r = Nokogiri::HTML(f)
        f.close
        r
    end

    def base_girl_expected
        {
            online: true,
            age: 22,
            location: 'Courbevoie, France',
            id: 110884558,
            eyes: 'marrons',
            hairs: 'châtains, mi-longs, raides',
            physics: '160 cm, 55 kg, normale',
            style: 'classique, geekette',
            origins: 'européennes',
            hobbies: ' découvrir, lire, sortir',
            profession: 'étudiante en alternance',
            alcohol: 'de temps en temps',
            smoke: 'tolère la fumée',
            alimentation: 'mange de tout',
            foodLikes: 'japonais, italien, chinois',
            paricularities: 'non renseigné'
        }
    end

    test 'base girl parsing' do
        assert_equal GirlHtmlParser.analyse(get_file_content), base_girl_expected
    end
end