
{-# LANGUAGE FlexibleInstances #-}

import Data.List
import Control.Monad.State


subsets :: [a] -> [[a]]
subsets [] = [[]]
subsets (x:xs) = (map (x:) y) ++ y
                where y = subsets xs


--суммы без сдачи           
amountsI :: [Integer] -> [Integer]
amountsI [] = []
amountsI xs = nub(map sum (subsets xs))


--все суммы продавца и покупателя 
withChange' :: [Integer] -> [Integer] -> [Integer]
withChange' [] _ = [0]
withChange' _ [] = [0]
withChange' (x:xs) ys = nub(filter (>0) (map (x-) ys ++ withChange' xs ys))


--все суммы покупателя со сдачей
--withChangeI :: [Integer] -> [Integer] -> [Integer]
--withChangeI [] _ = [0]
--withChangeI _ [] = [0]
--withChangeI x y = sort( nub(withChange' (amounts x) (amounts y) \\ amounts x))

check_without::[Integer]-> Integer -> Bool
check_without [] cost = False
check_without (x:xs) cost
        |x == cost = True
        |x /= cost = check_without xs cost



change_pok :: [Integer] -> Integer ->Integer -> Integer
change_pok [] _ _ =  0
change_pok (x:xs) cost sum 
        |sum + x < cost = change_pok xs cost (x+sum)
        |sum + x > cost = sum + x


change :: [Integer] -> Integer -> Integer -> Integer
change [] _ sum = sum
change _ 0 sum = sum
change arr sum_for_change sum = 
        if (sum_for_change >= 10) then change(reverse(tail (reverse arr))) (sum_for_change - (head (reverse arr))) (sum + (head (reverse arr)))
        else do
            if (sum_for_change - head arr < 0) then change 
                else
                    change (tail arr) (sum_for_change - head arr) (sum + head arr)




start :: IO()
start = do
    putStrLn "________"
    putStrLn ""
    putStrLn "Давай начнем сначала!"
    putStrLn ""
    main


main = do
    putStrLn "Введите номиналы монет продавца в виде списка:"
    pro  <- getLine
    let proarr = sort(read pro :: [Integer])
    putStrLn "Введите номиналы монет покупателя в виде списка:"
    pok  <- getLine
    let pokarr = sort(read pok :: [Integer])
    putStrLn "Введите стоимость покупки"
    cost <- getLine
    funcmain (proarr) (pokarr) (read cost)


funcmain :: [Integer] -> [Integer] -> Integer -> IO()
funcmain proarr pokarr cost = do
    let 
        sum_without = tail $ sort $ amountsI pokarr               --сумма без сдачи
    if (check_without sum_without cost) then do
        putStrLn ""
        putStrLn "Мои поздравления! Покупка сегодня без сдачи!!!"
        start
    else do
        
        let sum_for_change = change_pok pokarr cost 0           --ближайшее целое 
        if (sum_for_change == 0) then do
            putStrLn "Я, конечно, не эксперт, но, по-моему, тебе не хватает денег("
            start
            else do
                let change_coin = change proarr (sum_for_change - cost) 0 
                    ans = "Давай " ++ (show sum_for_change)  ++ "р., а сдача будет " ++  (show change_coin) ++ "р." 
                putStrLn ans 
                start
               -- print $ change_coin
        --print $ show $ withChange proarr pokarr
    






-- [1,1,2,2,2,5,5]  
-- 3
-- 