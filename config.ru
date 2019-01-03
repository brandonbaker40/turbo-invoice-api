# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

# rubocop:disable Lint/AmbiguousRegexpLiteral
use Rack::Rewrite do
  rewrite /^(?!.*(api|\.)).*$/, '/index.html'
end
# rubocop:enable Lint/AmbiguousRegexpLiteral

require_relative 'config/environment'

run Rails.application
