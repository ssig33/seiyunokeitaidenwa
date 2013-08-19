if !ENV['NAME'].blank?
  Message = JSON.parse(open("#{Rails.root}/config/message.json").read)[ENV['NAME']]
elsif
  Message = JSON.parse(open("#{Rails.root}/config/message.json").read)['default']
end
