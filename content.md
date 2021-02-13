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

[![chart comparing CI speeds](https://raw.githubusercontent.com/pre-commit-ci-demo/demo/master/img/2020-12-15_noop.svg)](https://github.com/pre-commit-ci-demo/demo#results)

**caching:** tool caching is baked in and shared across all users.  this means
that the more users there are of pre-commit.ci, the more likely you will get
faster builds!

![pre-commit.ci build output](img/build.png)

**automatic updates:** pre-commit.ci will periodically [autoupdate] your
configuration ensuring that your hook versions are kept up to date.  this
autoupdate is currently scheduled weekly at approximately 18:00 UTC Monday.

here is [an example autoupdate pull request].

![pre-commit.ci auto updating a repository](img/autoupdate.png)

[autoupdate]: https://pre-commit.com/#pre-commit-autoupdate
[an example autoupdate pull request]: https://github.com/asottile/pyupgrade/pull/365

**re-running a pull request**: you can trigger a re-run on a pull request by
closing and re-opening.

**skipping push runs**: skip a run by putting `[skip ci]`, `[ci skip]`,
`[skip pre-commit.ci]`, or `[pre-commit.ci skip]` in the commit message.

### configuration

pre-commit.ci is configured in `.pre-commit-config.yaml` in the `ci:` section.

```table
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
    =c= (optional, default: `false`) whether to recursive check out submodules
```

## following the development

- development is streamed on [twitch]
- follow the [mailing list] for high level updates

[twitch]: https://twitch.tv/anthonywritescode
[mailing list]: https://groups.google.com/forum/#!forum/pre-commit-ci/join

## sponsoring

if you'd like to support the development there are two ways to sponsor:

- [github sponsors]
- [open collective]

[github sponsors]: https://github.com/sponsors/asottile
[open collective]: https://opencollective.com/pre-commit
