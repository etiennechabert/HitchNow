class GirlHtmlParser
    # @param [Nokogiri::HTML::Document] content
    def initialize(html)
        raise('WTF OBJECT ? Give me nokorigi or FU you') if html.class != Nokogiri::HTML::Document
        @html = html
    end

    def analyse
        analyse_profile_in_brief.merge(analyse_profile_details).merge(analyse_profile_scores)
    end

    def profile_others_girls
        result = []
        @html.css('.person a').each do |element|
            next if element.attr('href').blank?
            result.push element.attr('href').split('/')[4].split('?')[0]
        end
        result
    end

    # @return [Hash]
    def analyse_profile_in_brief
        element = @html.css('#profile-in-brief')
        {
            online: element.css('.last-cnx').text.strip == 'En ligne',
            age: element.css('.age').text.strip,
            city: element.css('.city').text.strip,
            country: element.css('.country').text.strip,
            id: element.css('#member-id').text.strip
        }
    end

    def analyse_profile_details
        element = @html.css('#view_details .data')
        {
            eyes: element.css('td')[0].children[1].children[2].text.strip,
            profession: element.css('td')[1].children[1].children[2].text.strip,
            hairs: element.css('td')[2].children[1].children[2].text.strip,
            alcohol: element.css('td')[3].children[1].children[2].text.strip,
            physics: element.css('td')[4].children[1].children[2].text.strip,
            smoke: element.css('td')[5].children[1].children[2].text.strip,
            style: element.css('td')[6].children[1].children[2].text.strip,
            alimentation: element.css('td')[7].children[1].children[2].text.strip,
            origins: element.css('td')[8].children[1].children[2].text.strip,
            foodLikes: element.css('td')[9].children[1].children[2].text.strip,
            hobbies: element.css('td')[10].children[1].children[2].text.strip,
            particularities: element.css('td')[11].children[1].children[2].text.strip
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