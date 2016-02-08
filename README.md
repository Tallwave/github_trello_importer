# GitHub Trello Importer

<!-- [![Circle CI](https://circleci.com/gh/Tallwave/github_issue_exporter.svg?style=shield&circle-token=:circle-token)](https://circleci.com/gh/Tallwave/github_issue_exporter) [![Code Climate](https://codeclimate.com/github/Tallwave/github_issue_exporter/badges/gpa.svg)](https://codeclimate.com/github/Tallwave/github_issue_exporter) -->

Trello is a good tool for quick data entry of user stories or issues, but it kinda sucks as a bug tracker. Fortunately it's easy to export cards from Trello in JSON, and GitHub's API makes it rather simple to create Issues from that.

## Installation

GitHub Trello Importer is built with Ruby and needs Ruby 2.0 or higher. Install it with RubyGems.

```
gem install github_trello_importer
```

Some environments may require `sudo` permissions.

```
sudo gem install github_trello_importer
```

## Usage
```
import-trello /path/to/file.json swilliams test-repo some-key
```
4 Arguments:

1. The path to the JSON file exported by Trello.
2. The GitHub organization (or user)
3. The repository name
4. Your API [token](https://github.com/blog/1509-personal-api-tokens).


## Contributing

 * Fork
 * Make it better
 * Create a Pull Request
