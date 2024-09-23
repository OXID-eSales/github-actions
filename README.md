# Overview

This repository contains re-usable GitHub workflows and actions for the OXID-eSales repositories.

## Workflows

- **Discontinued in v5:** [call-universal_test_workflow](docs/workflows/call-universal_test_workflow.md): Configurable workflow to test shop, modules and other components.
- [universal_workflow_light](docs/workflows/universal_workflow_light.md): This configurable workflow relies
on test and install scripts provided in the respective repositories.

## Actions

- Auxiliary actions
  - [begin_report](docs/actions/begin_report.md) initializes the report artifact with the used testplan and report headers.
    It's output is required for [generate_report](docs/actions/generate_report.md).
  - [append_report](docs/actions/append_report.md) adds job status informations, debug and cleanup informations to the report for a job.
    It's output is required for [generate_report](docs/actions/generate_report.md).
  - [generate_report](docs/actions/generate_report.md) generates a report on the summary page and handles slack notifications
  - [build_docker](docs/actions/build_docker.md) is used in the [docker repository](https://github.com/OXID-eSales/docker/tree/master/.github/workflows) workflows to build the docker images
  - [clean_cache](docs/actions/clean_cache.md) is used at the end of a successful workflow to cleanup the cached objects
  - [composer_merge](docs/actions/composer_merge.md) merges a json string with composer.json.
  - [consolidate_artifacts](docs/actions/consolidate_artifacts.md) consolidates multiple artifacts into one.
  - [start_shop](docs/actions/start_shop.md) fetches a shop from cache and starts it.
  - [stop_shop](docs/actions/stop_shop.md) stops a running shop
  - **Discontinued in v5:** [cleanup_workspace](docs/actions/cleanup_workspace.md) empties the workdir, optionally kills all docker containers and prunes docker. It was never needed as we start with a clean slate for every run.
  - **Discontinued in v5:** [slack_status](docs/actions/slack_status.md) sends a status message to a slack webhook. This is no longer needed as the slack status message is generated inside generate_report.
- Setup actions
  - [prepare_shop](docs/actions/prepare_shop.md) prepares the shop and creates a cache for it.
  - **Discontinued in v5:** [install_shop](docs/actions/install_shop.md) installs a shop with a given PHP/MySQL combination and caches the installed shop. This has been replaced by using an installation script provided by the (shop) repository.
  - **Discontinued in v5:** [install_module](docs/actions/install_module.md) installs a module or component into the dev-packages folder and uses composer to link it to vendor. This is replaced by the composer.transform functionality using composer to install everything at once.
- Test actions
  - [run_test_script](docs/actions/run_test_script.md) runs a script defined in a composer.json or in a
    shell script in tests/Scripts.
  - [sonarcloud](docs/actions/sonarcloud.md) runs sonarcloud over the given installation
  - **Discontinued in v5:** [phpunit](docs/actions/phpunit.md) executes phpunit tests in a running container. This has been replaced by using the run_test_script action executing a test script either provided in composer.json or the tests/scripts folder of the repository.
  - **Discontinued in v5:** [codeception](docs/actions/codeception.md) executes codeception tests in a running container and uploads the logs and outputs as artifacts. This has been replaced by using the run_test_script action executing a test script either provided in composer.json or the tests/scripts folder of the repository.
  - **Discontinued in v5:** [runtests](docs/actions/phpunit.md) executes runtests script in a running container. This has been replaced by using the run_test_script action executing a test script either provided in composer.json or the tests/scripts folder of the repository.
  - **Discontinued in v5:** [phpcs](docs/actions/phpcs.md) runs phpcs over the given installation. This has been replaced by using the run_test_script action executing a test script either provided in composer.json or the tests/scripts folder of the repository.
  - **Discontinued in v5:** [phpmd](docs/actions/phpmd.md) runs phpmd over the given installation. This has been replaced by using the run_test_script action executing a test script either provided in composer.json or the tests/scripts folder of the repository.
  - **Discontinued in v5:** [phpstan](docs/actions/phpstan.md) runs phpstan over the given installation. This has been replaced by using the run_test_script action executing a test script either provided in composer.json or the tests/scripts folder of the repository.
  - **Discontinued in v5:** [styles](docs/actions/styles.md) runs phpcs, phpstan and phpmd reports. This has been replaced by using the run_test_script action executing a test script either provided in composer.json or the tests/scripts folder of the repository.
