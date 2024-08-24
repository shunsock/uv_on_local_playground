.PHONY: start prepare

start:
	uv run python src/app/app.py

prepare:
	# linting syntax & formatting
	uvx ruff@latest check --fix .
	# type checking for application
	uvx mypy@latest ./src/app --strict
	# formatting import order
	uvx ruff@latest check --select I --fix .
	# run tests
	uv run pytest src/tests