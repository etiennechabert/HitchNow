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

    def base_girl_other_girls
        ["110884558", "1386465", "1684217", "11035749", "15079039", "15079039", "111491807", "111491863", "111492129", "111490751", "111491851", "111491601", "111491947", "111490926", "111491233", "111491324", "111490842", "111474760", "14651091", "14334144", "16861316", "111022918", "111257077", "18319339", "19772910", "19834290", "16199732", "110048581", "110315596", "15445733", "18515164", "111228472", "111474162", "15878608", "17351342", "17501591", "110593677", "111127296", "111482506", "17413578", "17480756", "18763281", "11093442", "18984176", "111501970", "16102788", "13361282", "16306297", "110652000", "111472168", "131635", "110714633", "110743832", "110846400", "110866971", "111309484", "14569019", "18316252", "11795708", "14752131", "17724422", "18792563", "110450432", "110929021", "111177758", "111304524", "18342891", "111474760", "14651091", "14334144", "16861316", "111022918", "111257077", "18319339", "19772910", "19834290", "16199732"]
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

    test 'base girl other girls' do
        girl_html_parser = GirlHtmlParser.new(get_file_content)
        assert_equal girl_html_parser.profile_others_girls, base_girl_other_girls
    end

end