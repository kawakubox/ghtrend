require "ghtrend/version"
require 'net/http'
require 'oga'

module Ghtrend
  def self.trend
    doc = Oga.parse_html(Net::HTTP.get URI.parse('https://github.com/trending'))
    doc.css('li.repo-list-item').map do |repo|
      {}
    end
  end
end
