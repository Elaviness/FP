import Data.List

f lst1 lst2 = do
    let second_el = lst2 !! 1
    let lstnum = ['1','2','3','4','5','6','7','8','9','0']
    let buff = elem second_el lstnum
    if buff then head lst1:last lst1: head lst2:last lst2:[]
    else head lst2:last lst2:head lst1:last lst1:[]
