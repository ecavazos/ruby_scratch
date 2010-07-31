require 'rake/testtask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Run all tests.'
Rake::TestTask.new(:test) do |t|
  t.pattern = '*_test.rb'
end

