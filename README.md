# uv_on_local_playground

This repository is a playground for running [uv](https://github.com/astral-sh/uv) on local. Also, you can use it as a template for your project.

## Getting Started

Before running the application, you need to install `uv` on your local machine.

```shell
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Also, you need to install the dependencies.

```shell
uv sync
```

Then, you can run the application.

```shell
make start
Hello, world!
```

## Development

`make prepare` to check application and test code.

```shell
# linting syntax & formatting
uvx ruff@latest check --fix .
# type checking for application
uvx mypy@latest ./src/app --strict
# formatting import order
uvx ruff@latest check --select I --fix .
# run tests
uv run pytest src/tests
```

`.github/workflows/prepare.yml` checks the application and test code on pull requests to main branch.

```yml
  - name: Run linter
    run: uvx ruff@latest check . --fix --exit-non-zero-on-fix --diff
    continue-on-error: true

  - name: Run liter for import order
    run: uvx ruff@latest check I . --fix --exit-non-zero-on-fix --diff
    continue-on-error: true

  - name: Run type checker
    run: uvx mypy@latest ./src/app --strict

  - name: Run tests
    run: uv run pytest src/tests
```

## License

Everything in this repository is licensed under the [MIT license](./LICENSE).
