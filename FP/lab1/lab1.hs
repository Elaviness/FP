f lst1 lst2 = do
    let tt = lst2 !! 2 elem ['1','2','3','4','5','6','7','8','9','0']
    print tt
   -- if  (lst2 !! 2) elem ['1','2','3','4','5','6','7','8','9','0'] then head lst1 ++  last lst1 ++ head lst2 ++ last lst2
   -- else head lst2 ++ last lst2 ++ head lst1 ++  last lst1