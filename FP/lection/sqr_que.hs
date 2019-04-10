module Func3 where
    --sqrfunc :: Float -> Float -> Float 
    sqrfunc a b c  
        |(b*b-4.0*a*c) >= 0 = show ((-b+sqrt(b*b-4.0*a*c))/(2.0*a)) ++ ";" ++ show((-b-sqrt(b*b-4.0*a*c))/(2.0*a))
        |(b*b-4.0*a*c) < 0 =  print "Корней нет"
        
        
        