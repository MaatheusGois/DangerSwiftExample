fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

### test_package

```sh
[bundle exec] fastlane test_package
```

Runs tests for a specific package



#### Options

 * **`package_name`**: The name of the package to test

 * **`package_path`**: The path to the package



### test_project

```sh
[bundle exec] fastlane test_project
```

Runs tests for an external project



#### Options

 * **`scheme`**: The project's scheme

 * **`project_path`**: The path to the project

 * **`project_name`**: The name of the project

 * **`destination`**: ..

### test_pr_linter

```sh
[bundle exec] fastlane test_pr_linter
```

Tests the WeTransferPRLinter Swift Package

### release_from_tag

```sh
[bundle exec] fastlane release_from_tag
```

Create a release from a tag triggered CI run

### unhide_spm_package_dev_dependencies

```sh
[bundle exec] fastlane unhide_spm_package_dev_dependencies
```

Unhide dev dependencies for danger

### changed_files_in_pr

```sh
[bundle exec] fastlane changed_files_in_pr
```

Get all changed files in the current PR

Requires that the enviroment contains a Danger GitHub API token `DANGER_GITHUB_API_TOKEN`



#### Options

 * **`pr_id`**: The identifier of the PR that contains the changes.



### pr_changes_contains_path

```sh
[bundle exec] fastlane pr_changes_contains_path
```

Check whether any of the changes happened in the given path



#### Options

 * **`path`**: The path in which to check for changed files



### prepare_for_ci

```sh
[bundle exec] fastlane prepare_for_ci
```

Executes a bash script that prepares for a CI run.



#### Options

 * **`script`**: The path to the bash script that prepares for a CI run. (`PREPARE_CI_SCRIPT`)



### git_repository_name

```sh
[bundle exec] fastlane git_repository_name
```

Returns the repository name. E.g: WeTransfer/Mocker

### latest_github_release

```sh
[bundle exec] fastlane latest_github_release
```

Get latest release from Github. Draft releases and prereleases are not returned by this endpoint. See: https://developer.github.com/v3/repos/releases/#get-the-latest-release

### slack_message

```sh
[bundle exec] fastlane slack_message
```

Posts a message about the status of a build to Slack

It is required to create an incoming Webhook for Slack and set this as an environment variable `SLACK_URL`



#### Options

 * **`message**`: The message to post to Slack

 * **`tag_name**`: The name of the tag associated with the build

 * **`release_url`**: The url to a GH release.



### run_danger_locally

```sh
[bundle exec] fastlane run_danger_locally
```

Runs danger locally for the given PR ID.

### test

```sh
[bundle exec] fastlane test
```

Run the tests and prepare for Danger

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
