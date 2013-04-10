# This class is responsible for parsing all strings in a given text or file.
require 'nslocalize/export'
require 'nslocalize/parse'
require 'nslocalize/version'

module NSLocalize
  USER_AGENT = "nslocalize-gem/#{NSLocalize::VERSION} (#{RUBY_PLATFORM}) ruby/#{RUBY_VERSION}"

  def self.user_agent
    @@user_agent ||= USER_AGENT
  end

  def self.user_agent=(agent)
    @@user_agent = agent
  end
end
