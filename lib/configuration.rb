# Turns deprecation warnings into errors, in order to surface
# the full backtrace of the call site. This can be useful when
# you need more context to address a deprecation than the
# single-line call site normally provided.
#
# @example
#
   RSpec.configure do |rspec|
     rspec.raise_errors_for_deprecations!
   end
def raise_errors_for_deprecations!
    self.deprecation_stream = Formatters::DeprecationFormatter::RaiseErrorStream.new
end