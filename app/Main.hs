module Main (main) where

import Lib
import Text.HTML.Scalpel (fetchTags)
import Text.HTML.TagSoup (Tag)

site = "https://clutchmov.com/"

main :: IO ()
main = do
  tags <- fetchTags site :: IO [Tag String]
  print tags
