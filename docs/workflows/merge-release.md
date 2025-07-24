# merge_release

This workflow is triggered by merging a pull request. It performs the following steps:

- Checks if the pull request title matches the format: 
**“Update github-actions to <major>.<minor>.<patch>”**
- Extracts the new version number from the pull request title.
- Creates a new tag: `v<major>.<minor>.<patch>`.
- Updates the `v<major>.<minor>` tag to point to the new release.
- Updates the `v<major>` tag to point to the new release.
- Uses the `ncipollo/release-action@v1` to create a GitHub release.
