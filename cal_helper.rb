module CalHelper

 def op(x)
   # Check string consist of "+-*/" at first position
   # Then return as default operator
   permit_operator = "+-*/"
   regex = /[#{permit_operator.gsub(/./){|char| "\\#{char}"}}]/

   ax = x.split(',')
   ax1 = ax[0].chr
   if ax1 =~ regex
     return ax1
   else
     return ""
   end

 end     

end
