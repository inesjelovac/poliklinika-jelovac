require 'jekyll'
require 'rspec'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :should
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :should
  end
end

# Configure Jekyll
Jekyll.logger.log_level = :error
Jekyll.logger.adjust_verbosity(quiet: true)

# Set up test environment
TEST_DIR = File.expand_path("../", __FILE__)
SITE_DIR = File.expand_path("../../", __FILE__)

def source_dir
  SITE_DIR
end

def dest_dir
  File.join(TEST_DIR, "_site")
end

def site_configuration
  Jekyll.configuration({
    "source" => source_dir,
    "destination" => dest_dir,
    "languages" => ["en", "hr"],
    "default_lang" => "en",
    "quiet" => true,
    "testing" => true
  })
end 