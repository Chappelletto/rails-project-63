.PHONY: install

default: lint


install:
	bundle install
lint: install
	bundle exec rubocop
test: install
	bundle exec rspec
