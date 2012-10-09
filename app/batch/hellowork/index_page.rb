module Hellowork
  class IndexPage
    class << self
      def pages(start_page_url, limit=-1)
        pages = []
        mechanize = Mechanize.new do |agent|
          agent.max_history = 1
          agent.get URI.parse(start_page_url)

          agent.page.form_with(:name => 'mainForm') do |form|
            #form.field_with(:name => 'kiboSangyo').option_with(:value => 'P').select
            form.checkbox_with(:name => 'shinchakuKyujin').check
            form.click_button form.button_with(:name => 'commonSearch')
          end

          while agent.page
            break if limit > -1 && pages.size >= limit
            pages << self.new(agent.page)

            form = agent.page.form_with(:name => 'multiForm2')
            break unless form

            next_button = form.button_with(:name => 'fwListNaviBtnNext')
            break unless next_button

            form.click_button next_button
            sleep Core.request_interval
          end
        end

        pages
      end
    end

    def initialize(page)
      @page = page
    end

    def detail_pages
      @detail_pages ||= @page.parser.css('#container .d-sole table a[name=link]').map do |atag|
        DetailPage.new(Mechanize.new.get(@page.uri.merge(URI.parse(atag.attribute('href')))))
      end
    end
  end
end
