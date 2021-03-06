# Gem: ripl-short_errors
# By:  Jan Lelis

# Description:
#  Only show the first backtrace entry when errors are displayed. The complete backtrace can be shown by the _! method.

# Please note:
#  Needs to be required before ripl-color_error

require 'ripl'

module Ripl::ShortErrors
  VERSION = '0.1.0'

  attr_reader :last_error

  def format_error(err)
    "#{err.class}: #{err.message.chomp}" +
      ( err.backtrace.first =~ %r|/lib/ripl/shell.rb| ? '' : " [#{err.backtrace.first}]" )
  end

  def print_eval_error(err)
    @last_error = err
    super
  end

  module Commands
    def _!
      puts Ripl.shell.last_error.backtrace.join("\n    ")
    end
  end
end

Ripl::Shell.send :include, Ripl::ShortErrors
Ripl::Commands.send :include, Ripl::ShortErrors::Commands

# J-_-L
