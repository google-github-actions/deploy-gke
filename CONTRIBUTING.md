# Contributing to Google GitHub Actions

We will review and may accept contributions to all repositories in
[google-github-actions][org]. Below are some guidelines to maximize your
contribution.

**Please note:** This project is not an officially supported Google product. It
is not covered by a Google Cloud support contract. To report bugs or request
features in the Google Cloud product, please [contact Google Cloud
support](https://cloud.google.com/support).


## Contributor License Agreement

Contributions to this project must be accompanied by a Google Contributor
License Agreement (CLA). You (or your employer) retain the copyright to your
contribution, but the CLA gives us permission to use and redistribute your
contributions as part of the project.

Visit the [Google Developers CLA Portal](https://cla.developers.google.com/) to
sign the agreement. You generally only need to sign the CLA once for all Google
projects.

**If you do not sign the Google CLA, we are unable to merge your contribution.**


## Code of Conduct

All contributions must follow our [Code of Conduct][coc]. We will reject
contributions which violate the Code of Conduct, regardless of their technical
merit.


## Development Model

We develop using Git's branching model. To propose a contribution:

1.  [Fork][fork] the repository.

1.  [Clone][clone] the repository, or use the in-browser editor to make your
    changes.

1.  [Open a Pull Request][pr] to propose your changes.

1.  Review an test output and linters, and address the issues. Because of how
    GitHub injects secrets into CI/CD, your _integration_ tests may fail. This
    is expected and our team will invoke the integration tests with our
    credentials. Other test types must pass.

1.  Our team will review the contribution. If it meets the project's goals and
    standards, we will likely accept the contribution.

    **For significant contributions or expanding scope, please open an issue
    first to ensure your contribution is in line with the project's goals.**


[org]: https://github.com/google-github-actions
[coc]: https://github.com/google-github-actions/.github/blob/main/CODE_OF_CONDUCT.md
[clone]: https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository
[fork]: https://docs.github.com/en/get-started/quickstart/fork-a-repo
[pr]: https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request
