module Ripl::HiddenNil
  def print_result(result)
    super unless result.nil?
  end
end

Ripl::Shell.include Ripl::HiddenNil

# J-_-L
