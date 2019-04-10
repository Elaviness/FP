--Типовые переменные
head ["м","т","у","с","и"]
fst (51,15)

--Классы типов 
(==) 3 5  (==) 4 4

-- Класс Eq
15 == 4  "a"=="a"
15/=5    "a"/="a"
"абра" == "кадабра"   "абра" /= "кадабра"

--Класс Ord
"ФЭУ" < "ОТФ-2"
15 `compare` 15
14 `compare` 15
16 `compare` 15

--Класс Show
show 0.5 show "Хаскель"

--Класс Read
read "18" + 32
read "4.2" - 4.2

read "25" :: Int
read "25" :: Float

--Класс Enum
['d'..'h']
[1..13] [1..-1]
succ 'n' succ 'z'

--Класс Bounded
minBound :: Int     maxBound:: Int


maxBound :: (Bool, Int, Double)
maxBound :: (Bool, Int, Char)

--Класс Num
25::Int
35::Float
45::Double

--Класс Floating
sin 45    cos 45
tan 47    atan 49

--Класс Integral
fromIntegral (length [1,4]) + 3.2

--Функция replicate
replicate 8 0

--Функция take
take 2 []   take 3 ["A","B","C","D","E"]

--Функция reverse
reverse [1..10]

--Функция repeat
repeat 19
take 8 (repeat 19)

--Функция zip
zip [1,2,3] ['a','b']
zip [1,2,3] ['a','b','c']

--Функция elem
elem "8" ["1","2","1", "12", "/"]
elem "8" ["8","12","1"]