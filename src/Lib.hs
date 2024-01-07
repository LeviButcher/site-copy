module Lib
  ( saveFile,
    downloadPage,
  )
where

import qualified Data.ByteString.Lazy.Char8 as L8
import Network.HTTP.Simple
import System.Directory (createDirectoryIfMissing)
import System.FilePath (takeDirectory)

-- "./temp/sec/temp.txt"
-- "temp/sec/temp.txt"
saveFile :: FilePath -> String -> IO ()
saveFile cont path = do
  let dir = takeDirectory path
  createDirectoryIfMissing True dir
  writeFile path cont

downloadPage :: String -> IO String
downloadPage s = do
  initReq <- parseRequest s
  response <- httpLBS initReq
  let body = L8.unpack . getResponseBody $ response
  pure body
