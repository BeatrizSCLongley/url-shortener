require 'rails_helper'

RSpec.describe Url, type: :model do
  subject do
    described_class.new(long_url: 'https://css-tricks.com/snippets/css/a-guide-to-flexbox/',
                        short_url: 'css/flexbox',
                        click: 0)
  end

  it 'is not valid without a long_url' do
    subject.long_url = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid if long_url is an empty string' do
    url = Url.new(long_url: ' ').save
    expect(url).to eq(false)
  end

  it 'is not valid if short_url is not unique' do
    Url.create(long_url: 'example.com', short_url: 'example')
    url_two = Url.new(long_url: 'example.com', short_url: 'example').save
    expect(url_two).to eq(false)
  end

  describe 'Associations' do
    it { should belong_to(:user) }
  end
end
