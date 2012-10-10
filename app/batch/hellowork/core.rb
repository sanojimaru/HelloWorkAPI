# -*- coding: utf-8 -*-
require 'mechanize'
require 'csv'

module Hellowork
  class Core
    cattr_accessor :start_page_url, :request_interval

    def initialize(params={})
      config = params.merge({
        start_page_url: 'https://www.hellowork.go.jp/servicef/130020.do?action=initDisp&screenId=130020',
        request_interval: 0.5,
      })

      self.start_page_url = config[:start_page_url]
      self.request_interval = config[:request_interval]
    end

    def run(limit=-1)
      index_page_limit = limit > -1 ? (limit.to_f / 20).ceil : limit

      IndexPage.pages(index_page_limit) do |index_page|
        index_page.detail_pages do |detail_page|
          Rails.logger.debug "Create job from detail page, URL is #{detail_page.page.uri}"
          Job.create! detail_page.attributes.merge(url: detail_page.page.uri.to_s)
        end
      end
    end
  end
end
