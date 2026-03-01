.PHONY: install

default: lint


install:
	bundle install
lint: install
	bundle exec rubocop
tests:
	rake test
