module Main where

import System.Environment (getArgs)

import Fame.Calculations
import Fame.Show

parseInput :: String -> IO ()
--takes input string and calls "showFame" on correct args
parseInput i = undefined
  

main :: IO ()
main = do
  args <- getArgs
  case args of
    "-h":_         -> showUsage 1
    i:gh:[]        -> showFame 0 i gh
    "-v"  :i:gh:[] -> showFame 1 i gh
    "-vv" :i:gh:[] -> showFame 2 i gh
    "-vvv":i:gh:[] -> showFame 3 i gh
    _              -> showUsage 0
