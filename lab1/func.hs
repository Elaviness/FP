module Function where

    import Data.List
    f :: (([a]->[b])->[c])->[d]
    f a b c = a (!!) 3 : b(!!) 3 : c(!!) 3 :[]
    putStrLn(f)
