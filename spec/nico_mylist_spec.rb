$LOAD_PATH << File.expand_path('../../bin', __FILE__)

require 'nico_mylist'
include NicoNicoVideo

describe MyList do
  let(:mylist) { MyList.new('25274804') }

  describe '#new' do
    context 'GET HTTP www.nicovideo.jp' do
      it 'status code 200' do
        mylist.res.status[0].should eq '200'
      end
    end
  end

  describe '#each_video' do
    it 'should be hash' do
      mylist.each_video {|v| v.class.should eq Hash}
    end
  end

  describe '#parse_list' do
    subject { mylist.send(:parse_list) }
    it 'should be lists to String class' do
      should match(/^\[{.*}\]/)
    end
  end
end








