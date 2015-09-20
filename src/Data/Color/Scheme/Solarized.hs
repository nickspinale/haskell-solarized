module Data.Color.Scheme.Solarized
    ( Value(..)
    , base03    
    , base02    
    , base01    
    , base00    
    , base0     
    , base1     
    , base2     
    , base3     
    , yellow    
    , orange    
    , red       
    , magenta   
    , violet    
    , blue      
    , cyan      
    , green     
    ) where

import Data.Colour
import Data.Colour.SRGB
import Data.Word
import Data.Word.Word24
import Data.Word.Word24.Utils
import System.Console.ANSI

data Value = Value { trueColor :: RGB Word8
                   , tCo_16 :: Color16
                   , tCo_8 :: Color
                   , xterm256 :: Word8
                   , xterm256_approx :: RGB Word8
                   , lab :: ()
                   }

data Color16 = Color16 ColorIntensity Color

instance Enum Color16 where

    toEnum i = let (div, mod) = divMod i 8
                 in Color16 (toEnum div) (toEnum mod)

    fromEnum (Color16 i c) = fromEnum i * 8 + fromEnum c


curry3 :: ((a, b, c) -> d) -> a -> b -> c -> d
curry3 f a b c = f (a, b, c)

uncurry3 :: (a -> b -> c -> d) -> (a, b, c) -> d
uncurry3 f (a, b, c) = f a b c

fromHex :: Word24 -> RGB Word8
fromHex = uncurry3 RGB . toOctets

base03    = Value (fromHex 0x002b36) (toEnum  8) (toEnum 4) 234 (fromHex 0x1c1c1c)
base02    = Value (fromHex 0x073642) (toEnum  0) (toEnum 4) 235 (fromHex 0x262626)
base01    = Value (fromHex 0x586e75) (toEnum 10) (toEnum 7) 240 (fromHex 0x585858)
base00    = Value (fromHex 0x657b83) (toEnum 11) (toEnum 7) 241 (fromHex 0x626262)
base0     = Value (fromHex 0x839496) (toEnum 12) (toEnum 6) 244 (fromHex 0x808080)
base1     = Value (fromHex 0x93a1a1) (toEnum 14) (toEnum 4) 245 (fromHex 0x8a8a8a)
base2     = Value (fromHex 0xeee8d5) (toEnum  7) (toEnum 7) 254 (fromHex 0xe4e4e4)
base3     = Value (fromHex 0xfdf6e3) (toEnum 15) (toEnum 7) 230 (fromHex 0xffffd7)
yellow    = Value (fromHex 0xb58900) (toEnum  3) (toEnum 3) 136 (fromHex 0xaf8700)
orange    = Value (fromHex 0xcb4b16) (toEnum  9) (toEnum 3) 166 (fromHex 0xd75f00)
red       = Value (fromHex 0xdc322f) (toEnum  1) (toEnum 1) 160 (fromHex 0xd70000)
magenta   = Value (fromHex 0xd33682) (toEnum  5) (toEnum 5) 125 (fromHex 0xaf005f)
violet    = Value (fromHex 0x6c71c4) (toEnum 13) (toEnum 5)  61 (fromHex 0x5f5faf)
blue      = Value (fromHex 0x268bd2) (toEnum  4) (toEnum 4)  33 (fromHex 0x0087ff)
cyan      = Value (fromHex 0x2aa198) (toEnum  6) (toEnum 6)  37 (fromHex 0x00afaf)
green     = Value (fromHex 0x859900) (toEnum  2) (toEnum 2)  64 (fromHex 0x5f8700)

-- OFFICIAL VALUES

-- base03    #002b36  8/4 brblack  234 #1c1c1c 15 -12 -12   0  43  54 193 100  21
-- base02    #073642  0/4 black    235 #262626 20 -12 -12   7  54  66 192  90  26
-- base01    #586e75 10/7 brgreen  240 #585858 45 -07 -07  88 110 117 194  25  46
-- base00    #657b83 11/7 bryellow 241 #626262 50 -07 -07 101 123 131 195  23  51
-- base0     #839496 12/6 brblue   244 #808080 60 -06 -03 131 148 150 186  13  59
-- base1     #93a1a1 14/4 brcyan   245 #8a8a8a 65 -05 -02 147 161 161 180   9  63
-- base2     #eee8d5  7/7 white    254 #e4e4e4 92 -00  10 238 232 213  44  11  93
-- base3     #fdf6e3 15/7 brwhite  230 #ffffd7 97  00  10 253 246 227  44  10  99
-- yellow    #b58900  3/3 yellow   136 #af8700 60  10  65 181 137   0  45 100  71
-- orange    #cb4b16  9/3 brred    166 #d75f00 50  50  55 203  75  22  18  89  80
-- red       #dc322f  1/1 red      160 #d70000 50  65  45 220  50  47   1  79  86
-- magenta   #d33682  5/5 magenta  125 #af005f 50  65 -05 211  54 130 331  74  83
-- violet    #6c71c4 13/5 brmagenta 61 #5f5faf 50  15 -45 108 113 196 237  45  77
-- blue      #268bd2  4/4 blue      33 #0087ff 55 -10 -45  38 139 210 205  82  82
-- cyan      #2aa198  6/6 cyan      37 #00afaf 60 -35 -05  42 161 152 175  74  63
-- green     #859900  2/2 green     64 #5f8700 60 -20  65 133 153   0  68 100  60
