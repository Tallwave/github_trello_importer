require 'spec_helper'

describe 'Integrations:' do
  let (:owner) { "swilliams" }
  let (:repo) { "test-repo" }
  let (:token) { "abcdef" }

  describe 'file output' do
    let (:output_filename) {
      File.expand_path('../../lib/issue-exporter/issues.json', __FILE__)
    }

    let (:mock_data) {
      mock_file = File.expand_path('../fixtures/issues.json', __FILE__)
      File.read mock_file
    }

    before(:each) do
      if File.exists? output_filename
        File.delete output_filename
      end
    end

    after(:each) do
      if File.exists? output_filename
        File.delete output_filename
      end
    end

    it 'puts it all in one file by default' do
      exporter = IssueExporting::Exporter.new(owner, repo, token)
      stub_request(:any, "https://api.github.com/repos/swilliams/test-repo/issues?access_token=abcdef").to_return(body: mock_data)
      exporter.export()
      expect(File.exists? output_filename).to eq true
      expect(File.read(output_filename)).to eq mock_data
    end

    it 'allows custom output file' do
      custom_path = File.expand_path('../tmp', __FILE__)
      outputter = IssueExporting::FileOutputter.new(path: custom_path)
      outputter.write('test')
      tmp_filename = "#{custom_path}/issues.json"
      expect(File.exists? tmp_filename).to eq true
      File.delete tmp_filename
    end

    it 'writes multiple files when the flag is set' do
      options = { multiple_files: true }
      exporter = IssueExporting::Exporter.new(owner, repo, token, options)
      stub_request(:any, "https://api.github.com/repos/swilliams/test-repo/issues?access_token=abcdef").to_return(body: mock_data)
      exporter.export()
      dir = File.expand_path("../", output_filename)
      Dir.chdir dir
      file_count = Dir.glob("*.json").count
      expect(file_count).to eq 2
    end
  end

end
