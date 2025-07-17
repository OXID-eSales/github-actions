# Overview

This repository contains re-usable GitHub workflows and actions for the OXID-eSales repositories.

## Workflows

- [universal_workflow_light](docs/workflows/universal_workflow_light.md): This configurable workflow relies
on test and install scripts provided in the respective repositories.

## Actions

- Auxiliary actions
  - [begin_report](docs/actions/begin_report.md) initializes the report artifact with the used testplan and report headers.
    Its output is required for [generate_report](docs/actions/generate_report.md).
  - [append_report](docs/actions/append_report.md) adds job status information, debug and cleanup information to the report for a job.
    Its output is required for [generate_report](docs/actions/generate_report.md).
  - [generate_report](docs/actions/generate_report.md) generates a report on the summary page and handles Slack notifications
  - [build_docker](docs/actions/build_docker.md) is used in the [docker repository](https://github.com/OXID-eSales/docker/tree/master/.github/workflows) workflows to build the docker images
  - [clean_cache](docs/actions/clean_cache.md) is used at the end of a successful workflow to clean up the cached objects
  - [composer_merge](docs/actions/composer_merge.md) merges a JSON string with composer.json.
  - [consolidate_artifacts](docs/actions/consolidate_artifacts.md) consolidates multiple artifacts into one.
  - [start_shop](docs/actions/start_shop.md) fetches a shop from cache and starts it.
  - [stop_shop](docs/actions/stop_shop.md) stops a running shop
- Setup actions
  - [prepare_shop](docs/actions/prepare_shop.md) prepares the shop and creates a cache for it.
- Test actions
  - [run_test_script](docs/actions/run_test_script.md) runs a script defined in a composer.json or in a
    shell script in tests/Scripts.
  - [sonarcloud](docs/actions/sonarcloud.md) runs sonarcloud over the given installation
