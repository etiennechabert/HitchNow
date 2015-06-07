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
            age: '22 ans',
            city: 'Courbevoie',
            country: 'France',
            id: 'ID.110884558',
            eyes: 'marrons',
            profession: 'étudiante en alternance',
            hairs: 'châtains, mi-longs, raides',
            alcohol: 'de temps en temps',
            physics: '160 cm, 55 kg, normale',
            smoke: 'tolère la fumée',
            style: 'classique, geekette',
            alimentation: 'mange de tout',
            origins: 'européennes',
            foodLikes: 'japonais, italien, chinois',
            hobbies: 'découvrir, lire, sortir',
            particularities: 'non renseigné',
            popularity: '89%',
            mails: '53',
            charms: '1 208',
            visits: '4 855',
            buckets: '12',
            total: '51 885'
        }
    end

    def base_girl_profile_in_brief
        {
            :online=>true,
            :age=> '22 ans',
            :city=> 'Courbevoie',
            :country=> 'France',
            :id=> 'ID.110884558'
        }
    end

    def base_girl_profile_data
        {
            :eyes=> 'marrons',
            :profession=> 'étudiante en alternance',
            :hairs=> 'châtains, mi-longs, raides',
            :alcohol=> 'de temps en temps',
            :physics=> '160 cm, 55 kg, normale',
            :smoke=> 'tolère la fumée',
            :style=> 'classique, geekette',
            :alimentation=> 'mange de tout',
            :origins=> 'européennes',
            :foodLikes=> 'japonais, italien, chinois',
            :hobbies=> 'découvrir, lire, sortir',
            :particularities=> 'non renseigné'
        }
    end

    def base_girl_scores
        {
            :popularity=>"89%",
            :mails=>"53",
            :charms=>"1 208",
            :visits=>"4 855",
            :buckets=>"12",
            :total=>"51 885"
        }
    end

    test 'wrong argument' do
        assert_raise RuntimeError do
            GirlHtmlParser.new({})
        end
    end

    test 'base girl parsing' do
        girl_html_parser = GirlHtmlParser.new(get_file_content)
        assert_equal girl_html_parser.analyse, base_girl_expected
    end

    test 'base girl parsing profile in brief' do
        girl_html_parser = GirlHtmlParser.new(get_file_content)
        assert_equal girl_html_parser.analyse_profile_in_brief, base_girl_profile_in_brief
    end

    test 'base girl parsing data' do
        girl_html_parser = GirlHtmlParser.new(get_file_content)
        assert_equal girl_html_parser.analyse_profile_details, base_girl_profile_data
    end

    test 'base girl parsing score' do
        girl_html_parser = GirlHtmlParser.new(get_file_content)
        assert_equal girl_html_parser.analyse_profile_scores, base_girl_scores
    end

end