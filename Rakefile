require 'rake'
require 'rake/testtask'

task :default => :'test:units'

desc "Run unit tests"
Rake::TestTask.new('test:units') do |t|
	t.pattern = 'test/*.rb'
	t.verbose = true
	t.warning = true
end
