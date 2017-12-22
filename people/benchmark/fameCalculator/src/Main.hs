module Main where

import System.Environment (getArgs)

import Fame.Process
import Fame.NetProcess
import Fame.Calculations
import Fame.Show

main :: IO ()
  --todo: add time flag
main = do
  args <- getArgs
  case args of
    ('\"':i):is -> processStandard (i:is)
    "-h"  :_    -> showUsage 1
    "-q"  :is   -> processQuiet is
    "-v"  :is   -> processVerbose 2 is
    "-vv" :is   -> processVerbose 3 is
    "-vvv":is   -> processVerbose 4 is
    ('-':_):_   -> showUsage 0
    is          -> processStandard is
