.PHONY: install default lint test

default: lint

install:
	bundle install
lint: install
	bundle exec rubocop
test:
	rake test
console:
	bin/console