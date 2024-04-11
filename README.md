# Overview
This repository contains re-usable GitHub workflows and actions for the OXID-eSales repositories.

## Workflows
- [call-universal_test_workflow](docs/workflows/call-universal_test_workflow.md): Configurable workflow to test shop, modules and other components.

## Actions
- Auxiliary actions
    - [append_report](docs/actions/append_report.md) adds job status informations, debug and cleanup informations to the report for a job.
      It's output is required for [generate_report](docs/actions/generate_report.md).
    - [begin_report](docs/actions/begin_report.md) initializes the report artifact with the used testplan and report headers.
      It's output is required for [generate_report](docs/actions/generate_report.md).
    - [build_docker](docs/actions/build_docker.md) is used in the [docker repository](https://github.com/OXID-eSales/docker/tree/master/.github/workflows) workflows to build the docker images
    - [clean_cache](docs/actions/clean_cache.md) is used at the end of a successful workflow to cleanup the cached objects
    - [cleanup_workspace](docs/actions/cleanup_workspace.md) empties the workdir, optionally kills all docker containers and prunes docker.
    - [composer_merge](docs/actions/composer_merge.md) merges a json string with composer.json.
    - [consolidate_artifacts](docs/actions/consolidate_artifacts.md) consolidates multiple artifacts into one,
    - [generate_report](docs/actions/generate_report.md) generates a report on the summary page and handles slack notifications
    - [slack_status](docs/actions/slack_status.md) sends a status message to a slack webhook.
    - [start_shop](docs/actions/start_shop.md) fetches a shop from cache and starts it.
    - [stop_shop](docs/actions/stop_shop.md) stops a running shop
- Setup actions
    - [prepare_shop](docs/actions/prepare_shop.md) prepares the shop and creates a cache for it.
    - [install_shop](docs/actions/install_shop.md) installs a shop with a given PHP/MySQL combination and caches the installed shop.
    - [install_module](docs/actions/install_module.md) installs a module or component into the dev-packages folder and uses composer to link it to vendor

- Test actions
    - [phpunit](docs/actions/phpunit.md) executes phpunit tests in a running container.
    - [codeception](docs/actions/codeception.md) executes codeception tests in a running container and uploads the logs and outputs as artifacts.
    - [runtests](docs/actions/phpunit.md) executes runtests script in a running container.
    - [run_composer_script](docs/actions/run_composer_script.md) runs a script defined in a composer.json.
- Analysis actions
    - [phpcs](docs/actions/phpcs.md) runs phpcs over the given installation
    - [phpmd](docs/actions/phpmd.md) runs phpmd over the given installation
    - [phpstan](docs/actions/phpstan.md) runs phpcs over the given installation
    - [sonarcloud](docs/actions/sonarcloud.md) runs sonarcloud over the given installation
    - DEPRTECATED [styles](docs/actions/styles.md) runs phpcs, phpstan and phpmd reports
