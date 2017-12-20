module DateUtils
   def date_convert(d)
       "#{d[8..9]}/#{d[5..6]}/#{d[0..3]}"
    end 
end