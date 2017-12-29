module Main where

import System.Environment (getArgs)

import Fame.Process
import Fame.NetProcess
import Fame.Calculations
import Fame.Show

main :: IO ()
main = do
  args <- getArgs
  case args of
    ('\"':i):is     -> processStandard (i:is)
    "-h"  :_        -> showUsage 1
    "-q"  :is       -> processQuiet is
    "-v"  :is       -> processVerbose 2 is
    "-vv" :is       -> processVerbose 3 is
    "-vvv":is       -> processVerbose 4 is
    "-t"  :ts:is    -> processTimed ts "0" is
    "-tt" :ts:te:is -> processTimed ts te is
--  "-ttt":is       ->
    ('-':_):_       -> showUsage 0
    []              -> showUsage 0
    is              -> processStandard is
