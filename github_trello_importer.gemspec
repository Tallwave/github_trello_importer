$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/lib')

require 'importer'

Gem::Specification.new do |s|
  s.name                  = 'github_trello_importer'
  s.version               = TrelloImporter::VERSION
  s.required_ruby_version = '>= 2.0'
  s.summary               = 'Tools to import GitHub Issues from Trello'
  s.description           = <<-HERE
    Take JSON from Trello and create GitHub issues.
  HERE
  s.license               = 'MIT'
  s.author                = 'Scott Williams'
  s.email                 = 'scott.williams@tallwave.com'
  s.homepage              = 'https://github.com/Tallwave/github_trello_importer'
  s.files                 = Dir['{bin,lib}/**/*'] + ['github_trello_importer.gemspec']
  s.executables           = ['import-trello']
  s.extra_rdoc_files      = ['LICENSE', 'README.md']
  s.require_paths         = ['lib']
end
