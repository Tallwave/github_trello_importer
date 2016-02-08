require 'spec_helper'

describe 'URL Building' do
  it 'builds a URL with the closed flag when present' do
    url = TrelloImporter.make_url 'herp', 'derp', 'TOKEN', { include_closed_issues: true }
    expect(url).to eq "https://api.github.com/repos/herp/derp/issues?access_token=TOKEN&state=all"
  end

  it 'builds a URL without the closed flag when it is false' do
    url = TrelloImporter.make_url 'herp', 'derp', 'TOKEN', { include_closed_issues: false }
    expect(url).to eq "https://api.github.com/repos/herp/derp/issues?access_token=TOKEN"
  end

  it 'builds a URL without the closed flag when it\'s missing' do
    url = TrelloImporter.make_url 'herp', 'derp', 'TOKEN'
    expect(url).to eq "https://api.github.com/repos/herp/derp/issues?access_token=TOKEN"
  end
end
