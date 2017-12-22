module Main where

import System.Environment (getArgs)
import System.IO (hGetContents, stdin)

import SpeedReader.Utils
import SpeedReader.File

main :: IO ()
  -- todo
  --  takes in a text (and maybe pdf) file
  --  finds all the words (words)
  --  speedReads that list
main = do
  args <- getArgs
  case args of
    [wpm, file] -> speedRead (read' wpm) (processFile file) 
    [wpm]       -> catInput >>= speedRead (read' wpm)
    _           -> usage
    where read'    = read :: String -> Float
          catInput = processInput <$> hGetContents stdin

usage :: IO ()
usage =
  putStrLn . unlines $
  ["usage:"
  ,"  $ speedRead wpm file"
  ,"  $ cat file | speedRead wpm"
  ,""
  ,"  file can be pdf or text"
  ,"  \"wpm\" is \"words per minute\""
  ]
