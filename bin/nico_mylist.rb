# -*- coding: utf-8 -*-

require 'open-uri'
require 'json'
require 'pp'

module NicoNicoVideo
  BASE_URL = "http://www.nicovideo.jp/"

  class MyList
    def initialize(id="")
      @id = id
    end

    def get
      open(BASE_URL + "mylist/" + @id)
    end
  end
end

#include NicoNicoVideo

#list = NicoNicoVideo::MyList.new("25274804")

def parse_mylist(html)
  html.each_line do |line|
    return $1 if /Mylist.preload.*?(\[{.*}\])/ =~ line
  end
end
=begin
uri = open("http://www.nicovideo.jp/mylist/25274804") do |html|
  json = JSON.parser.new(parse_mylist(html))
  json.parse().each do |item|
    pp item["item_data"]
  end
end

=end
