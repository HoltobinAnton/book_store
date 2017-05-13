
describe AvatarUploader do
include CarrierWave::Test::Matchers

  let(:picture) { create(:picture) }
  let(:uploader) { AvatarUploader.new(picture, :avatar) }
  let(:path) { File.join(Rails.root, 'spec/support/images/test.jpeg') }

  before do
    AvatarUploader.enable_processing = true
    uploader.store!(File.open(path))
  end

  after do
    AvatarUploader.enable_processing = false
    uploader.remove!
  end

  context 'versions' do
    it "scales down a landscape image to be exactly 247 by 380 pixels" do
      expect(uploader.medium).to have_dimensions(247, 380)
    end

    it "scales down a landscape image to be exactly 259 by 399 pixels" do
      expect(uploader.thumb).to have_dimensions(259, 399)
    end

    it "scales down a landscape image to be exactly 112 by 172 pixels" do
      expect(uploader.small).to have_dimensions(112, 172)
    end

  end

  context 'the small version' do
    it "scales down a landscape image to fit within 115 by 172 pixels" do
      expect(uploader.small).to be_no_larger_than(115, 172)
    end
  end

  it "has the correct format" do
    expect(uploader).not_to be_format('jpg')
    expect(uploader).to be_format('jpeg')
  end
end