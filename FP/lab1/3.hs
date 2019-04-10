
import Control.Monad
import Data.Array 
import Data.List
main = do

    putStrLn "Введите первый массив:"

    st1 <- getLine 

    putStrLn "Введите второй массив:"

    st2 <- getLine 

    let buff = st2 !! 1
    let buf = buff elem ['1','2','3','4','5','6','7','8','9','0']
    print buf  
   -- if (buff elem ['1','2','3','4','5','6','7','8','9','0'])
   --     then print 1
   -- else print 2
    --if (st2 !! 2 elem ['1','2','3','4','5','6','7','8','9','0'])
      --  then print $ ((head st1) ++ (tail st1) ++ (head st2) ++ (tail st2))
        --else print $ ((head st2) ++ (tail st2) ++ (head st1) ++  (tail st1))
