require 'minitest/spec'

MiniTest::Unit.autorun

def clean(const)
  const = const.to_sym.capitalize
  if self.class.const_defined?(const)
    self.class.send(:remove_const, const)
  end
end
