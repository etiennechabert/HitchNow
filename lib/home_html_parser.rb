class HomeHtmlParser
    # @param [Nokogiri::HTML::Document] content
    def initialize(html)
        raise('WTF OBJECT ? Give me nokorigi or FU you') if html.class != Nokogiri::HTML::Document
        @html = html
    end

    def analyse
        result = []
        @html.css('.person > a').each do |element|
            next if element.attr('href').blank?
            tmp = element.attr('href').split('/')
            next if tmp.length != 5
            result.push tmp[4].split('?')[0]
        end
        result
    end

end
