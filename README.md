# Overview
This repository contains re-usable GitHub workflows and actions for the OXID-eSales repositories.

## Workflows
- [call-test_matrix](docs/workflows/call-test_matrix.md): Full test matrix for oxidshop_ce and oxidshop_ee.

## Actions
- Auxiliary actions
    - [cleanup_workspace](docs/actions/cleanup_workspace.md) empties the workdir, optionally kills all docker containers and prunes docker.
    - [composer_configure](docs/actions/composer_configure.md) configures a list of repositories and runs composer require for them.
    - [composer_require](docs/actions/composer_require.md) runs composer require for a list of themes etc.
    - DEPRECATED [install_themes](docs/actions/install_themes.md) installs one or more themes using the composer inside the PHP container. Use [composer_require](docs/actions/composer_require.md) instead. 
    - [slack_status](docs/actions/slack_status.md) sends a status message to a slack webhook.
    . [install_module](docs/actions/install_mdodule.md) installs a shop module.
- Setup actions
    - [prepare_shop](docs/actions/prepare_shop.md) prepares the shop and creates a cache for it.
    - [start_shop](docs/actions/start_shop.md) fetches a shop from cache and starts it.
    - [install_shop](docs/actions/install_shop.md) installs a shop with a given pvp/MySQL combination and caches the installed shop.
- Test actions
    - [phpunit](docs/actions/phpunit.md) executes phpunit tests in a running container.
    - [codeception](docs/actions/codeception.md) executes codeception tests in a running container and uploads the logs and outputs as artifacts.
    - [runtests](docs/actions/phpunit.md) executes runtests script in a running container.
- Analysis actions
    - [phpcs](docs/actions/phpcs.md) runs phpcs over the given installation
    - [sonarcloud](docs/actions/sonarcloud.md) runs sonarcloud over the given installation
