--Описать функцию, которая в заданном списке заменяет все элементы-списки значениями
-- сумм входящих в них числовых элементов с учетом вложенных подсписков.
import Data.List 
import Data.Monoid

f lst = map sum lst
