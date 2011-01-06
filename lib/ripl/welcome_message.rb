module Ripl::WelcomeMessage
  @text = "Welcome to #{ File.split($0)[-1].upcase }. You are using #{ RUBY_DESCRIPTION }. Have fun ;)"

  class << self
    attr_accessor :text
    alias message text
  end

  def before_loop
    super

    if msg = Ripl::WelcomeMessage.text
      puts msg
    end
  end
end

Ripl::Shell.include Ripl::WelcomeMessage

# J-_-L
