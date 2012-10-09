# -*- coding: utf-8 -*-
require 'mechanize'
require 'csv'

module Hellowork
  class Core
    cattr_accessor :start_page_url, :request_interval

    def initialize(params={})
      config = params.merge({
        start_page_url: 'https://www.hellowork.go.jp/servicef/130020.do?action=initDisp&screenId=130020',
        request_interval: 0.2,
      })

      self.start_page_url = config[:start_page_url]
      self.request_interval = config[:request_interval]
    end

    def run(limit=-1)
      index_page_limit = (limit.to_f / 20).ceil
      puts Hellowork::IndexPage.pages(self.start_page_url, index_page_limit).map(&:detail_pages).flatten.map(&:attributes)
    end
  end
end

#module Hellowork
  #class Core

    #def initialize(params=nil)
      #@hellowork_url = 'https://www.hellowork.go.jp/servicef/130020.do?action=initDisp&screenId=130020'
      #@request_interval = 0.2
      #@recruit_urls = []
      #@recruits = []

      #@mechanize = Mechanize.new do |agent|
        #agent.max_history = 1
        #agent.get URI.parse(@hellowork_url)
      #end
    #end

    #def search
      #puts 'Searching...'

      #@mechanize.page.form_with(:name => 'mainForm') do |form|
        #form.field_with(:name => 'kiboSangyo').option_with(:value => 'P').select
        #form.checkbox_with(:name => 'shinchakuKyujin').check
        #form.click_button form.button_with(:name => 'commonSearch')

        #while parse_page
          #sleep @request_interval
        #end
      #end

      #@recruit_urls.each do |url|
        #@mechanize.get url do |page|
          #@recruits << page.parser.css('#container .d-table table tr th').map{|n| n.content.strip } if @recruits.size == 0
          #row = page.parser.css('#container .d-table table tr td').map{|n| n.content.strip }
          #row << url.to_s
          #@recruits << row
        #end
      #end

      #output_csv
      #puts 'Finish!!'
    #end

    #def output_csv(file='output.csv')
      #CSV.open(file, 'w') do |writer|
        #@recruits.each do |row|
          #writer << row.map{|n| n.encode('CP932', 'UTF-8', :undef => :replace) }
        #end
      #end
    #end

    #private
    #def parse_page
      #@mechanize.page.parser.css('#container .d-sole tr').each_with_index do |tr,i|
        #next if i == 0
        #content = tr.css('td').map{|n| n.content.strip }.join(',')
        #puts content
        #@recruit_urls << tr.css('a[name=link]').attribute('href') if content == nil || content =~ /歯科/
      #end

      #form = @mechanize.page.form_with(:name => 'multiForm2')
      #next_button = form.button_with(:name => 'fwListNaviBtnNext')

      #if next_button
        #form.click_button next_button
        #true
      #else
        #false
      #end
    #end
  #end
#endend
