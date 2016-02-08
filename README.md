# GitHub Issue Exporter

[![Circle CI](https://circleci.com/gh/Tallwave/github_issue_exporter.svg?style=shield&circle-token=:circle-token)](https://circleci.com/gh/Tallwave/github_issue_exporter) [![Code Climate](https://codeclimate.com/github/Tallwave/github_issue_exporter/badges/gpa.svg)](https://codeclimate.com/github/Tallwave/github_issue_exporter)

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
There are two executables, `export-github-issues` and `import-github-issues`. Both reneed at least three things to run, the owner of the repository, the repository name, and an access token that has the authority to download the Issues. You can generate this token from [here](https://github.com/settings/tokens), and clicking on "Generate new token". Here's a [blog post with some more of the details involved](http://blog.swilliams.me/words/2015/04/01/two-factor-authentication-for-github/).

### export-github-issues

The Exporter has a couple of options.

`--multiple-files` By default Issue Exporter downloads and stores all the issues into a single JSON file. Setting the `multiple-files` flag will create a separate file for each Issue.

`--output` Set the directory to store the issues in. By default it is the current directory.

`--closed` By default, only Open issues are exported. Adding this flag will include Closed ones as well.

The issues will be exported into either a single `issues.json` file or multiple `issue-[NUMBER].json` files.

### Example

```
export-github-issues tallwave github_issue_exporter [TOKEN]

export-github-issues --closed tallwave github_issue_exporter [TOKEN]

export-github-issues --multiple-files --output ~/issues tallwave github_issue_exporter [TOKEN]
```

### import-github-issues
You can import issues a couple of different ways. First is to provide the name of each JSON file created by the exporter.

```
import-github-issues issues.json more-issues.json tallwave github_issue_exporter [TOKEN]
```

Or you can use the `--directory` flag and load all the JSON files in the specified directory.

```
import-github-issues --directory ~/issues tallwave github_issue_exporter [TOKEN]
```

## Roadmap


## Contributing

 * Fork
 * Make it better
 * Create a Pull Request
