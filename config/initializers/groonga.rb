Dir::mkdir ::Rails.root+"db/groonga" unless File.exist? ::Rails.root+"db/groonga"
#if File.exist? "#{::Rails.root}/db/groonga/search"
#  Groonga::Database.open "#{::Rails.root}/db/groonga/search"
#else
#  Groonga::Database.create path: "#{::Rails.root}/db/groonga/search"
#end
