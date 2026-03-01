.PHONY: install

default: lint


install:
	bundle install
lint: install
	bundle exec standardrb
tests:
	rake test
