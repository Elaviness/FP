import Data.Char

main = do
file <- readFile "text.txt"
writeFile "textOUT.txt" (map toUpper file)