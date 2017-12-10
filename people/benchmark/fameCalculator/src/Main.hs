module Main where

import System.Environment (getArgs)

import Fame.Calculations
import Fame.Welcome
import Fame.Show

main :: IO ()
main = do
  args <- getArgs
  welcome
  case args of
    "-h":_         -> showUsage 1
    i:gh:[]        -> showFame 0 i gh
    "-v"  :i:gh:[] -> showFame 1 i gh
    "-vv" :i:gh:[] -> showFame 2 i gh
    "-vvv":i:gh:[] -> showFame 3 i gh
    _              -> showUsage 0
