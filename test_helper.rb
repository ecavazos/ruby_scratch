
def clean(class_name)
  klass = Kernel.const_get(class_name.to_s.capitalize) rescue NameError; return

  klass.instance_methods(false) do |m|
    klass.class_eval { undef m }
  end
end
