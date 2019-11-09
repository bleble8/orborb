# Orb Orb for CircleCI

Orb Orb is an orb for orb authors, specifcally this author.

## Features

### Orb expansion & unit testing with BATS

### Contributor friendly
Orb Orb will publish dev versions of the orb on open PRs, and publish the version coordinates back to the PR.  This allows contributors and maintainers to test changes manually or use the patched pre-prod version if desired.

### Semantic Versioning Aware
Orb Orb will make sure that every merge that results in a publish is properly rev'd as a Major, Minor or Patch level change. The publiush step promotes a previously tested Dev version.

### bors Ready
This author thinks bors is boss, https://medium.com/@edwardawebb/a-tale-of-trust-secrets-and-the-forked-pr-d44a0450914c and so this orb works best with a bors try/merge workflow.
