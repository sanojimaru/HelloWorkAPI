module Hellowork
  class IndexPage
    class << self
      def pages(limit=-1, &block)
        mechanize = Mechanize.new do |agent|
          agent.max_history = 1
          agent.get URI.parse(Core.start_page_url)

          agent.page.form_with(:name => 'mainForm') do |form|
            form.field_with(:name => 'kiboSangyo').option_with(:value => 'P').select
            #form.checkbox_with(:name => 'shinchakuKyujin').check
            form.click_button form.button_with(:name => 'commonSearch')
          end

          page_no = 0
          until limit > -1 && page_no >= limit
            block.call IndexPage.new(agent.page)

            form = agent.page.form_with(:name => 'multiForm2')
            next_button = form.button_with(:name => 'fwListNaviBtnNext') if form

            unless next_button
              Rails.logger.error "IndexPage next button is not available, URL: #{agent.page.uri}"
              break
            end

            form.click_button next_button

            sleep Core.request_interval
            page_no += 1
          end
        end
      end
    end

    attr_accessor :page

    def initialize(page)
      @page = page
    end

    def detail_pages(&block)
      @page.parser.css('#container .d-sole table a[name=link]').map do |atag|
        uri = @page.uri.merge(URI.parse(atag.attribute('href')))

        block.call DetailPage.new(Mechanize.new.get(uri))
        sleep Core.request_interval
      end
    end
  end
end
