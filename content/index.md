## features

**supported hosting platforms:** currently only [GitHub](https://github.com)
is supported, more to come in the future!

**configuration:** zero configuration setup -- nothing is needed beyond the
`.pre-commit-config.yaml` file you already have!

**auto fixing pull requests:** if tools make changes to files during a pull
request, pre-commit.ci will automatically fix the pull request.

pre-commit.ci will run on all pull request commits, but will not push for
commits made by bots.

![pre-commit.ci auto fixing a pull request](img/autofix.png)

**speed:** much faster than comparable, free CI systems

[![chart comparing CI speeds](https://raw.githubusercontent.com/pre-commit-ci-demo/demo/main/img/2020-12-15_noop.svg)](https://github.com/pre-commit-ci-demo/demo#results)

**caching:** tool caching is baked in and shared across all users.  this means
that the more users there are of pre-commit.ci, the more likely you will get
faster builds!

![pre-commit.ci build output](img/build.png)

**automatic updates:** pre-commit.ci will periodically [autoupdate] your
configuration ensuring that your hook versions are kept up to date.  this
autoupdate is currently scheduled weekly at approximately 16:00 UTC Monday.

here is [an example autoupdate pull request].

![pre-commit.ci auto updating a repository](img/autoupdate.png)

[autoupdate]: https://pre-commit.com/#pre-commit-autoupdate
[an example autoupdate pull request]: https://github.com/asottile/pyupgrade/pull/365

**re-running a pull request**: you can trigger a re-run on a pull request by
commenting `pre-commit.ci run` (must appear on a line by itself).

**skipping push runs**: skip a run by putting `[skip ci]`, `[ci skip]`,
`[skip pre-commit.ci]`, or `[pre-commit.ci skip]` in the commit message.

### configuration

pre-commit.ci is configured in `.pre-commit-config.yaml` in the `ci:` section.

**note**: `ci:` configuration is entirely optional and will assume the defaults
below.

```table
=r=
    =c= [`autofix_commit_msg`](_#configuration-autofix_commit_msg)
    =c= (optional, default: `'[pre-commit.ci] auto fixes [...]'`)
        custom commit message for PR autofixes.
=r=
    =c= [`autofix_prs`](_#configuration-autofix_prs)
    =c= (optional, default: `true`) whether to autofix pull requests.  when
        disabled, comment "pre-commit.ci autofix" on a pull request to
        manually trigger auto-fixing.
=r=
    =c= [`autoupdate_branch`](_#configuration-autoupdate_branch)
    =c= (optional: default `''`) branch to send autoupdate PRs to.

        by default, pre-commit.ci will update the default branch of the
        repository.

        this configuration option and other autoupdate settings will be
        read from the `.pre-commit-config.yaml` in the default branch of
        the repository.
=r=
    =c= [`autoupdate_commit_msg`](_#configuration-autoupdate_commit_msg)
    =c= (optional, default: `'[pre-commit.ci] pre-commit autoupdate'`)
        custom commit message for autoupdate PRs.
=r=
    =c= [`autoupdate_schedule`](_#configuration-autoupdate_schedule)
    =c= (optional, default: `'weekly'`) control when the autoupdate runs,
        possible values: `'weekly'`, `'monthly'`, `'quarterly'`.
=r=
    =c= [`skip`](_#configuration-skip)
    =c= (optional, default: `[]`) a list of hook ids to skip only in
        pre-commit.ci

        for example:


        ```yaml
        ci:
            skip: [pylint]

        repos:
        -   repo: local
            hooks:
            -   id: pylint
                # ...
        ```

        this is equivalent to running [`SKIP=pylint pre-commit ...`](https://pre-commit.com/#temporarily-disabling-hooks)

=r=
    =c= [`submodules`](_#configuration-submodules)
    =c= (optional, default: `false`) whether to recursively check out submodules
```

a full config with all the defaults:

```yaml
ci:
    autofix_commit_msg: |
        [pre-commit.ci] auto fixes from pre-commit.com hooks

        for more information, see https://pre-commit.ci
    autofix_prs: true
    autoupdate_branch: ''
    autoupdate_commit_msg: '[pre-commit.ci] pre-commit autoupdate'
    autoupdate_schedule: weekly
    skip: []
    submodules: false
```

## pricing

pre-commit.ci will always be **free for open source repositories**.

for private and organization repository support see the [GitHub Marketplace].

for enterprise or on-prem solutions, contact [info@pre-commit.ci].

[GitHub Marketplace]: https://github.com/marketplace/pre-commit-ci
[info@pre-commit.ci]: mailto:info@pre-commit.ci

## following the development

- development is streamed on [twitch]
- follow the [mailing list] for high level updates

[twitch]: https://twitch.tv/anthonywritescode
[mailing list]: https://groups.google.com/g/pre-commit-ci

## sponsoring

if you'd like to support the development there are two ways to sponsor:

- [github sponsors]
- [open collective]

[github sponsors]: https://github.com/sponsors/asottile
[open collective]: https://opencollective.com/pre-commit
