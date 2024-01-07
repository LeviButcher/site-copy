{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import qualified Data.ByteString.Lazy.Char8 as L8
import Data.Maybe (fromMaybe)
import Lib (downloadPage, saveFile)
import Network.HTTP.Simple
import Network.URI (parseAbsoluteURI, parseRelativeReference, parseURI, parseURIReference, pathSegments, uriPath)
import Text.HTML.Scalpel (fetchTags)
import Text.HTML.TagSoup (Tag)

site :: URL
site = "https://clutchmov.com"

saveDir :: FilePath
saveDir = "site"

-- tags <- fetchTags site :: IO [Tag String]

type URL = String

type Dir = String

getFilePath :: Dir -> URL -> String
getFilePath dir url = dir <> "/" <> rPath <> ".html"
  where
    possibleURI = case parseURI url of
      Just x -> if not . null . pathSegments $ x then Just x else Nothing
      Nothing -> Nothing
    rPath = maybe "index" uriPath possibleURI

main :: IO ()
main = do
  body <- downloadPage site
  let fPath = getFilePath saveDir site
  print fPath
  saveFile body fPath
  --
  print "end"
