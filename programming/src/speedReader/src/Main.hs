module Main where

import System.Environment (getArgs)
import System.IO (hGetContents, stdin)

import SpeedReader.Utils
import SpeedReader.File

main :: IO ()
  -- takes in a text or pdf file
  -- finds all the words
  -- shows the words on screen at given speed
main = do
  args <- getArgs
  case args of
    "-h":_            -> usage
    [wpm, file]       -> do
                           ws <- processFile file
                           speedRead (read' wpm) ws 
    [wpm, file, f, l] -> do
                           ws <- processPDF file f l
                           speedRead (read' wpm) ws 
    [wpm]             -> catInput >>= speedRead (read' wpm)
    _                 -> usage
    where read'    = read :: String -> Float
          catInput = words <$> hGetContents stdin

usage :: IO ()
usage =
  putStrLn . unlines $
  ["usage:"
  ,"  $ speedRead wpm file"
  ,"  $ speedRead wpm pdf_file firstpage lastpage"
  ,"  $ cat file | speedRead wpm"
  ,""
  ,"  file can be pdf or text"
  ,"  \"wpm\" is \"words per minute\""
  ,"  $ speedRead -h shows this usage"
  ]
