require 'fileutils'
FileUtils.rm "db/test.sqlite3" if File.exist? "db/test.sqlite3"
exit false unless system "RAILS_ENV=test bundle exec rake db:migrate"
#exit false unless system "RAILS_ENV=test bundle exec rake spec"
