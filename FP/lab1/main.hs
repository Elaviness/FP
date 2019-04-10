module Main where

    import Data.List
    
    main = do

    let a=["V","B","N","J","H"]
    let b=["Y","U","I","H","(JK)","(8)","78"]
    let c=["df","F","K","L","(O09)"]
    let new_arr =  (head a: (head b: (head c:[])))
