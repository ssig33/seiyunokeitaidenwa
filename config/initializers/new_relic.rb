if defined? Unicorn
  begin
    ::NewRelic::Agent.manual_start()
    ::NewRelic::Agent.after_fork(:force_reconnect => true)
  rescue
  end
end

