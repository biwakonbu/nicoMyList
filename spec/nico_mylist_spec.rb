$LOAD_PATH << File.expand_path('../../bin', __FILE__)

require 'nico_mylist'
include NicoNicoVideo

describe MyList do
  describe '#get' do
    context 'GET HTTP www.nicovideo.jp' do
      it 'status code 200' do
        MyList.new('25274804').get.status[0].should eq '200'
      end
    end
  end

  context 'GET HTTP www.nicovideo.jp/mylist/*' do
    #    it 'status code return 200' do
    #      @res.status[0].should eq '200'
    #  end
  end
end
