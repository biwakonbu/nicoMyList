# -*- coding: utf-8 -*-

require 'open-uri'
require 'json'

module NicoNicoVideo
  BASE_URL = "http://www.nicovideo.jp"

  class MyList
    def initialize(id="")
      @res = open(BASE_URL + "/mylist/" + id)
    end

    attr_reader :res
  end

  def each_video
    json = JSON.parser.new(parse_list)
    json.parse.each do |video|
      yield video
    end
  end

  private
  def parse_list
    @res.each_line do |line|
      return $1 if /Mylist.preload.*?(\[{.*}\])/ =~ line
    end
  end
end
