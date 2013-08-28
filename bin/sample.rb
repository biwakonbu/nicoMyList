$LOAD_PATH << File.expand_path('../../lib', __FILE__)

require 'pp'
require 'nico_mylist'

include NicoNicoVideo

list = MyList.new('25274804')
list.each_video do |video|
  pp video
end
