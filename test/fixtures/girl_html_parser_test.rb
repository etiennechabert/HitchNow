require 'test_helper'

class GirlHtmlParserTest < ActiveSupport::TestCase

    def base_girl_expected
        {
            online: true,
            age: 22,
            picture: './girl0_files/069bf6ce3068e96906d.jpg',
            location: {
                city: 'Courbevoie',
                country: 'France'
            },
            id: 110884558,
            eyes: 'marrons',
            profession: 'étudiante en alternance',
            hairs: %w(châtains mi-longs raides),
            alcohol: 'de temps en temps',
            weight: 55,
            height: 160,
            apparence: 'normale',
            smoke: 'tolère la fumée',
            styles: %w(classique geekette),
            alimentation: 'mange de tout',
            origins: 'européennes',
            food_likes: %w(japonais italien chinois),
            hobbies: %w(découvrir lire sortir),
            particularities: ['tatouages', 'taches de rousseurs'],
            popularity: 89,
            mails: 53,
            charms: 1208,
            visits: 4855,
            buckets: 12,
            total: 51885
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
        girl_html_parser = GirlHtmlParser.new(girl_file_content)
        base_girl = girl_html_parser.analyse
        last_connection = base_girl.extract!(:last_connection)
        assert_equal base_girl.sort, base_girl_expected.sort
        assert_in_delta last_connection[:last_connection].to_i, 0.seconds.ago.to_i, 60
    end

    test 'base girl other girls' do
        girl_html_parser = GirlHtmlParser.new(girl_file_content)
        assert_equal girl_html_parser.profile_others_girls, base_girl_other_girls
    end

    test 'not existing girl' do
        girl_html_parser = GirlHtmlParser.new(girl_file_content('girl_didn_t_exist.html'))

        assert_raise GirlHtmlParser::GirlNotExisting do
            girl_html_parser.analyse
        end
    end

    test '52 minutes_ago' do
        girl_html_parser = GirlHtmlParser.new(girl_file_content('52_minutes_ago.html'))

        assert_in_delta girl_html_parser.analyse[:last_connection].to_i, 52.minutes.ago.to_i, 60
        assert_not girl_html_parser.analyse[:online]
    end

    test '17 hours ago' do
        girl_html_parser = GirlHtmlParser.new(girl_file_content('17_hours_ago.html'))

        assert_in_delta girl_html_parser.analyse[:last_connection].to_i, 17.hours.ago.to_i, 60
        assert_not girl_html_parser.analyse[:online]
    end

    test 'one day ago' do
        girl_html_parser = GirlHtmlParser.new(girl_file_content('one_day_ago.html'))

        assert_in_delta girl_html_parser.analyse[:last_connection].to_i, 1.days.ago.to_i, 60
        assert_not girl_html_parser.analyse[:online]
    end

    test '11 days ago' do
        girl_html_parser = GirlHtmlParser.new(girl_file_content('11_days_ago.html'))

        assert_in_delta girl_html_parser.analyse[:last_connection].to_i, 11.days.ago.to_i, 60
        assert_not girl_html_parser.analyse[:online]
    end

    test '4 months ago' do
        girl_html_parser = GirlHtmlParser.new(girl_file_content('4_months_ago.html'))

        assert_in_delta girl_html_parser.analyse[:last_connection].to_i, 4.months.ago.to_i, 60
        assert_not girl_html_parser.analyse[:online]
    end
end