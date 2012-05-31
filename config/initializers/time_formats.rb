Time::DATE_FORMATS[:pretty] = lambda { |time| time.strftime("%a, %b %e  %l:%M:%S") + time.strftime("%p").downcase }
