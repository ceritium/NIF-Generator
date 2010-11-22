require 'rake'
require 'rake/testtask'

task :default => :'test:units'

desc "Run tests"
Rake::TestTask.new('test') do |t|
	t.pattern = 'test_*.rb'
	t.verbose = true
	t.warning = false
end
