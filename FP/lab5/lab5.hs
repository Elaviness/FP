{-# LANGUAGE FlexibleInstances #-}
import Data.List
 
subsets :: [a] -> [[a]]
subsets [] = [[]]
subsets (x:xs) = (map (x:) y) ++ y
                where y = subsets xs
--суммы без сдачи           
amountsI :: [Int] -> [Int]
amountsI [] = []
amountsI xs = nub(map sum (subsets xs))
--все суммы продавца и покупателя 
withChange' :: [Int] -> [Int] -> [Int]
withChange' [] _ = [0]
withChange' _ [] = [0]
withChange' (x:xs) ys = nub(filter (>0) (map (x-) ys ++ withChange' xs ys))
--все суммы покупателя со сдачей
withChangeI :: [Int] -> [Int] -> [Int]
withChangeI [] _ = [0]
withChangeI _ [] = [0]
withChangeI x y = quicksort( nub(withChange' (amounts x) (amounts y) \\ amounts x))
 
quicksort ::[Int] -> [Int]
quicksort [] = []
quicksort (x:xs) = quicksort (filter (<x) xs) ++ [x] ++ quicksort (filter (>=x) xs)
-----------------------------------------------------------------------------
--для мультимножеств
--сумма мультимножества
sumMult::[(Int,Int)]-> Int
sumMult [] = 0
sumMult ((x,k):xs)=x*k + sumMult xs
 
amountsM::[[(Int,Int)]]->[Int]
amountsM [] = []
amountsM s = quicksort(nub(map (sumMult) s ))
--все суммы покупателя (со сдачей и без)
withChangeM1 :: [(Int,Int)] -> [(Int,Int)] -> [Int]
withChangeM1 [] _ = [0]
withChangeM1 _ [] = [0]
withChangeM1 x y = quicksort(nub(withChange' (amountsM(subBags x)) (amountsM(subBags y))))
--суммы покупателя, которые можно заплатить со сдачей
withChangeM::[(Int,Int)]->[(Int,Int)]->[Int]
withChangeM [] _ = [0]
withChangeM _ [] = [0]
withChangeM x y = withChangeM1 x y \\ amountsM(subBags x)

class Elem a where
    amounts :: [a]->[Int]
    withChange :: [a]->[a]->[Int]
 
instance Elem Int where
    amounts x = amountsI x
    withChange x y = withChangeI x y
    
instance Elem (Int, Int) where
    amounts x = amountsM x
    withChange x y = withChangeM x y
