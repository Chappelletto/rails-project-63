# frozen_string_literal: true

require "simplecov"
SimpleCov.start

require "simplecov-cobertura"
SimpleCov.formatter = SimpleCov::Formatter::CoberturaFormatter

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "hexlet_code"

require "minitest/autorun"
require "minitest-power_assert"

User = Struct.new(:name, :job, :gender, keyword_init: true)

module Minitest
  class Test
    def read_fixture(name)
      fixture_path = File.expand_path("#{__dir__}/fixtures/#{name}.html")

      File.read(fixture_path).strip
    end
  end
end
