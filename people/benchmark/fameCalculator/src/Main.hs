module Main where

import System.Environment (getArgs)
import System.Process  ( StdStream(..)
                       , createProcess 
                       , CreateProcess(..)
                       , proc
                       )
import System.IO (hGetContents, hClose)

import Fame.Calculations
import Fame.Show

-- input processing functions
parseInput :: Verbosity -> [String] -> IO ()
parseInput v is = do
  let input = sanitise (unwords is)
  (_, Just hout, _, _) <- createProcess $
                          (proc "node" ["getData.js"
                                       ,"0"
                                       ,input
                                       ]) { cwd = Nothing
                                          , std_out = CreatePipe }
  out <- hGetContents hout
  let [x, gh] = parseOutput out
  showFame v x gh
  hClose hout

parseOutput :: String -> [Int]
parseOutput out =
  case out of
    '\"': 'a' : 'v' : 'e' : 'r' : 'a' : 'g' : 'e' : 's' : '\"': ':' : rest -> process rest
    (s:ss)     -> parseOutput ss
    []         -> error "did not find averages\n(perhaps no internet connection?)"
  where
    process = (read :: String -> [Int]) . sanitise

sanitise :: String -> String
-- helper function for input processing functions  
-- also sanitises user input (todo)
sanitise = filter (flip notElem "\"|(){}")

main :: IO ()
main = do
  --todo: add time flag
  args <- getArgs
  case args of
    ('\"':i):is       -> parseInput 1 (i:is)
    "-h"  :_          -> showUsage 1
    "-q"  :is         -> parseInput 0 is
    "-v"  :is         -> parseInput 2 is
    "-vv" :is         -> parseInput 3 is
    "-vvv":is         -> parseInput 4 is
    ('-':_):_         -> showUsage 0
    is                -> parseInput 1 is
