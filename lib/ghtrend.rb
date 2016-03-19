require "ghtrend/version"
require 'net/http'
require 'oga'

module Ghtrend
  def self.trend
    doc = Oga.parse_html(Net::HTTP.get URI.parse('https://github.com/trending'))
    doc.css('li.repo-list-item').map do |repo|
      {
        name: repo_name(repo),
        url: URI.join('https://github.com/', repo_path(repo)).to_s,
        description: repo_description(repo),
        meta: repo_meta(repo),
      }
    end
  end

  private

  def self.repo_name(node)
    node.css('.repo-list-name > a').map { |e| trim(e.text) }.join
  end

  def self.repo_path(node)
    node.at_css('.repo-list-name > a').get('href')
  end

  def self.repo_description(node)
    node.css('.repo-list-description').map { |e| trim(e.text) }.join(' ')
  end

  def self.repo_meta(node)
    node.css('.repo-list-meta').text.split('•').map { |s| trim(s) }.slice(0, 2).join(', ')
  end

  def self.trim(s)
    s.gsub(/\n[ ]*/, '').chomp
  end
end
