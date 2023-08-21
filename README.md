# Overview
This repository contains re-usable GitHub workflows and actions for the OXID-eSales repositories.

## Workflows
- [call-test_matrix](docs/workflows/call-test_matrix.md): Full test matrix for oxidshop_ce and oxidshop_ee.

## Actions
- Auxiliary actions
    - [cleanup_workspace](docs/actions/cleanup_workspace.md) empties the workdir, optionally kills all docker containers and prunes docker.
    - [install_themes](docs/actions/install_themes.md) installs one or more themes using the composer inside the PHP container.
    . [install_module](docs/actions/install_mdodule.md) installs a shop module.
- Setup actions
    - [prepare_shop](docs/actions/prepare_shop.md): Prepares the shop and creates a cache for it.
    - [start_shop](docs/actions/start_shop.md): Fetches a shop from cache and starts it.
    - [install_shop](docs/actions/install_shop.md): Installs a shop with a given pvp/MySQL combination and caches the installed shop.
- Test actions
    - [phpunit](docs/actions/phpunit.md): Executes phpunit tests in a running container.
    - [codeception](docs/actions/codeception.md): Executes codeception tests in a running container and uploads the logs and outputs as artifacts.
    - [sonarcloud](docs/actions/sonarcloud.md): Runs sonarcloud over the given installation
