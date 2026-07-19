# contributing

thanks for considering contributing to signalis! your help is appreciated.

## questions

if you have a question, there are two places you can reach me:

- [github issues](https://github.com/luau-ecs/signalis)

- [the roblox oss server](https://discord.com/invite/5kjv64pa3d)

## setup

for vscode users, open the `signalis.code-workspace` code workspace. afterwards, signalis' tools can be set up locally
by installing [rokit](https://github.com/rojo-rbx/rokit) and running the following command in the project's root
directory:

```bash
rokit install
```

see [tools](#tools) for more info.

## bugs & feature requests

if something isn't right (unprecedented warnings, errors, etc.), please check if your issue has already been reported
before opening a [github issue](https://github.com/luau-ecs/signalis/issues). after an issue has been made,
you're welcome to open a [pr](https://github.com/luau-ecs/signalis/pulls) for bugfixes or feature requests.

## pr standards

- modifiable

	all prs should allow edits by maintainers. prs that do not follow this rule will be closed.

- ai pull requests

	as of right now, pull requests where there is no clear evidence of human involvement in the programming & request
	process may be closed without warning.

- explained

	please explain what you are doing and why.

### if code changes are made

the code should typecheck, and be formatted with [stylua](https://github.com/johnnymorganz/stylua). an analysis/lint
pass as well as stylua --check will be run automatically on prs.

if it is a bugfix with significant work associated,
[please create an issue first](https://github.com/luau-ecs/signalis/issues/new?template=bug-report.yml)
and link it in your pr. if it is a feature request,
[please create a discussion first](https://github.com/luau-ecs/signalis/discussions/new?category=enhancements)

## performance enhancements

performance enhancements are always welcome as an
[discussion](https://github.com/luau-ecs/signalis/discussions/new?category=enhancements)
and / or
[pull request](https://github.com/luau-ecs/signalis/pulls).
you will be expected to answer these questions as evidence the optimization is worthwhile:

- motivation. why are we doing this, what benefits does it bring?
- what is being optimized? what parts of the library does it affect?
- are there realistic scenarios being pessimized currently?
- is it an algorithmic (asymptotic) improvement?
- what are the drawbacks to optimizing this?
- (for pull requests) how does it perform in benchmarks?

## conduct / security

all contributors or participants are expected to follow our [contribution conduct](https://luau.nnull.co/umn/contributing/conduct).

if you believe an issue may be exploitable, please visit our [security](https://luau.nnull.co/umn/contributing/security) page.

## tools

signalis requires a minimal set of external tools to make contributing smooth:

[luau lsp](https://github.com/johnnymorganz/luau-lsp) for luau autocomplete & editor typechecking

[rokit](https://github.com/rojo-rbx/rokit) if needed for installing and using the folloiwng cli tools:

- [lune](https://github.com/lune-org/lune) (for running a test environment)

- [stylua](https://github.com/johnnymorganz/stylua) (for styling luau code)

- [rojo](https://github.com/rojo-rbx/rojo) (for building to .rbxm)

## licensing

by contributing changes to this repository, you license your contribution under the mit license, and you agree that you
have the right to license your contribution under those terms.
