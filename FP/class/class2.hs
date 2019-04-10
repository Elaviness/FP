import Data.Char
transform :: String -> String
transform str = map toUpper str

main = do
file <- readFile "text.txt"
let str_lst = lines file
let up_lst = map transform str_lst
writeFile "textOUT.txt" (unlines up_lst)