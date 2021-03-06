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
      index_page_limit = limit > -1 ? (limit.to_f / 20).ceil : limit

      IndexPage.pages(index_page_limit) do |index_page|
        Rails.logger.info "Download index page, URL: #{index_page.page.uri}"
        index_page.detail_pages do |detail_page|
          Rails.logger.info "Create job from detail page, URL is #{detail_page.page.uri}"
          unless Job.exists?(url: detail_page.page.uri.to_s)
            Job.create! detail_page.attributes.merge(url: detail_page.page.uri.to_s)
          end
        end
      end
    end

    def output(output_filepath)
      output_filepath = Rails.root.join('public/output/test.csv') unless output_filepath
      CSV.open(output_filepath, 'w') do |writer|
        Job.limit(10).each{|job| writer << job.attributes.values}
      end
    end
  end
end
