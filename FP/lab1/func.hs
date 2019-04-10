module Func where

    import Data.List

    func = do 
    let a=["V","B","N","J","H"] !! 3
    let b=["Y","U","I","H","(JK)","(8)","78"] !! 3
    let c=["df","F","K","L","(O09)"] !! 3
    let new_arr = a:(b:(c:[]))
    print new_arr
