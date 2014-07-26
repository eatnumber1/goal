{-# LANGUAGE FlexibleInstances #-}


class Stringy a where
    toString :: a -> String
    (+++)    :: String -> a -> String

instance Stringy () where
    toString ()  = "o"
    (+++) x ()   = x ++ (toString ())

instance Stringy String where
    toString    = id
    (+++) x y   = x ++ (toString y)


class Goaly a where
    g :: (Stringy b) => b -> a

instance Goaly String where
    g x = "g" ++ toString x

instance (Goaly a, Stringy b) => Goaly (b -> a) where
    g x = g . ((toString x) +++)

{-

*Main> g("al") :: String
"gal"
*Main> g()("al") :: String
"goal"
*Main> g()()("al") :: String
"gooal"
*Main> g()()()("al") :: String
"goooal"

-}
