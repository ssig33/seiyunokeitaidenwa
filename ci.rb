require 'fileutils'
system "bundle --path=vendor/bundle"
FileUtils.rm "db/test.sqlite3" if File.exist? "db/test.sqlite3"
exit system "bundle exec rake db:migrate spec"
