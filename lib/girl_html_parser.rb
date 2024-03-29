class GirlHtmlParser

    class GirlNotExisting < StandardError; end

    # @param [Nokogiri::HTML::Document] content
    def initialize(html)
        raise('WTF OBJECT ? Give me nokorigi or FU you') if html.class != Nokogiri::HTML::Document
        @html = html
    end

    def analyse
        analyse_errors
        tmp = analyse_tmp
        tmp.merge!(analyse_physics(tmp.extract!(:physics)))
        tmp.merge!(analyse_location(tmp.extract!(:city, :country)))
        tmp[:age] = tmp[:age].split(' ')[0].to_i
        tmp[:id] = tmp[:id].split('.')[1].to_i
        tmp[:hairs] = analyse_data_to_array tmp[:hairs]
        tmp[:food_likes] = analyse_data_to_array tmp[:food_likes]
        tmp[:hobbies] = analyse_data_to_array tmp[:hobbies]
        tmp[:particularities] = analyse_data_to_array tmp[:particularities]
        tmp[:styles] = analyse_data_to_array tmp[:styles]
        tmp[:popularity] = tmp[:popularity].split('%')[0].to_i
        tmp[:mails] = tmp[:mails].delete(' ').to_i
        tmp[:charms] = tmp[:charms].delete(' ').to_i
        tmp[:visits] = tmp[:visits].delete(' ').to_i
        tmp[:buckets] = tmp[:buckets].delete(' ').to_i
        tmp[:total] = tmp[:total].delete(' ').to_i
        tmp
    end

    def analyse_location(data)
        {
            location: {
                city: data[:city],
                country: data[:country]
            }
        }
    end

    def analyse_data_to_array(element)
        return [] if element == 'non renseigné'
        element.split(',').map {|e| e.strip}
    end

    def analyse_physics(physics)
        result = {
            weight: nil,
            height: nil,
            apparence: nil
        }
        physics[:physics].split(',').map{|e| e.strip.split(' ')}.each do |k, v|
            case v
                when 'cm'
                    result[:height] = k.to_i
                when 'kg'
                    result[:weight] = k.to_i
                when nil
                    result[:apparence] = k
            end
        end
        result
    end

    def analyse_tmp
        analyse_profile_in_brief.merge(analyse_profile_details).merge(analyse_profile_scores)
    end

    def analyse_errors
        raise GirlNotExisting if @html.css('.error_page_message').count > 0
    end

    def profile_others_girls
        result = []
        @html.css('.person a').each do |element|
            next if element.attr('href').blank?
            result.push element.attr('href').split('/')[4].split('?')[0]
        end
        result
    end

    def analyse_profile_picture
        {
            picture: @html.css('.image-wrapper img')[1].attr('src')
        }
    end

    # @return [Hash]
    def analyse_profile_in_brief
        element = @html.css('#profile-in-brief')
        result = {
            last_connection: element.css('.last-cnx').text.strip,
            age: element.css('.age').text.strip,
            city: element.css('.city').text.strip,
            country: element.css('.country').text.strip,
            id: element.css('#member-id').text.strip
        }.merge(analyse_profile_picture)
        if result[:last_connection] == 'En ligne'
            result[:last_connection] = 0.seconds.ago
            result[:online] = true
        else
            result[:last_connection] = analyse_last_connection element.css('.last-cnx .date').text.strip
            result[:online] = false
        end
        result
    end

    def analyse_last_connection(last_connection)
        last_connection_array = last_connection.split(' ')
        case last_connection_array[1].pluralize
            when 'minutes'
                last_connection_array[0].to_i.minutes.ago
            when 'heures'
                last_connection_array[0].to_i.hours.ago
            when 'jours'
                last_connection_array[0].to_i.days.ago
            when 'mois'
                last_connection_array[0].to_i.months.ago
        end
    end

    def analyse_profile_details_element(elements, element_nb)
        elements_css = elements.css('td')
        elements_css[element_nb].children[1].children.last.text.strip
    end

    def analyse_profile_details
        element = @html.css('#view_details .data')
            {
                eyes: analyse_profile_details_element(element.css('td'), 0),
                profession: analyse_profile_details_element(element.css('td'), 1),
                hairs: analyse_profile_details_element(element.css('td'), 2),
                alcohol: analyse_profile_details_element(element.css('td'), 3),
                physics: analyse_profile_details_element(element.css('td'), 4),
                smoke: analyse_profile_details_element(element.css('td'), 5),
                styles: analyse_profile_details_element(element.css('td'), 6),
                alimentation: analyse_profile_details_element(element.css('td'), 7),
                origins: analyse_profile_details_element(element.css('td'), 8),
                food_likes: analyse_profile_details_element(element.css('td'), 9),
                hobbies: analyse_profile_details_element(element.css('td'), 10),
                particularities: analyse_profile_details_element(element.css('td'), 11)
            }
    end

    ## HACK TO REPLACE 160 CHARS BY 32 CHARS (2 DIFFERENTS KINDS OF SPACE)
    def filter_space(string)
        string.each_char.with_index do |element, index|
            string[index] = ' ' if element.ord == 160
        end
        string
    end

    def analyse_profile_scores
        result = {}
        element = @html.css('#popularity')
        {
            popularity: element.css('.pop-rate').children[1].text.strip,
            mails: element.css('table tr')[0].css('td')[0].children[0].text.strip.split(' ')[0].strip,
            charms: element.css('table tr')[1].css('td')[0].children[0].text.strip.split(' ')[0].strip,
            visits: element.css('table tr')[2].css('td')[0].children[0].text.strip.split(' ')[0].strip,
            buckets: element.css('table tr')[3].css('td')[0].children[0].text.strip.split(' ')[0].strip,
            total: element.css('.total td').children[0].text.strip,
        }.each do |k, v|
            result[k] = filter_space(v)
        end
        result
    end
end