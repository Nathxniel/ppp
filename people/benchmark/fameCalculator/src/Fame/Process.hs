module Fame.Process where

import Fame.NetProcess
import Fame.Show

type TimeInWeeks = String
-- type Help = Bool
type Input = [String]

-- this is the way to do it..
-- figure out the arguments to pass to mainProcess
-- and create a function to pass them to mainProcess
{-
processInput :: Input -> IO ()
processInput i = mainProcess v t h o
  where (v, t, h, o) = findArguments i

findArguments :: Input -> (Verbosity, TimeInWeeks, Help, Input)
findArguments (('\"':i):is) = (1, "0", False, i:is)
findArguments ("-h"  :_   ) =
findArguments ("-q"  :is  ) 
findArguments ("-v"  :is  ) 
findArguments ("-vv" :is  ) 
findArguments ("-vvv":is  ) 
findArguments (('-':_):_  ) 
findArguments (is         ) 
-}  

-- but for now we have this
processStandard :: Input -> IO ()
processStandard i = mainProcess 1 "0" i

processQuiet :: Input -> IO ()
processQuiet i = mainProcess 0 "0" i

processVerbose :: Verbosity -> Input -> IO ()
processVerbose v i = mainProcess v "0" i

processTimed :: TimeInWeeks -> Input -> IO ()
processTimed t i = mainProcess 1 t i

-- input processing function
-- todo: add a few cases for "help" options
mainProcess :: Verbosity   ->
               TimeInWeeks ->
--             Help        ->
               Input       ->
               IO ()
mainProcess v t is = do
  let input = sanitise (unwords is)
  -- convert input into "/m/" code using "getInput.js"
  queryOut <- getQuery input
  let query = processQueryOutput queryOut input
  putStrLn query -- debug (todo: remove)
  --change below to {getRequest query "0"}
  requestOut <- getRequest query t
  let [x, gh] = processRequestOutput requestOut
  showFame v x gh

processQueryOutput :: String -> String -> String
processQueryOutput out def =
  case out of
    '\"': '/' : 'm' : '/' : rest -> ("/m/" ++ process rest)
    (s:ss) -> processQueryOutput ss def
    []     -> def
  where process = takeWhile (/='\"')

processRequestOutput :: String -> [Int]
processRequestOutput out =
  case out of
    '\"': 'a' : 'v' : 'e' : 'r' : 'a' : 'g' : 'e' : 's' : '\"': ':' : rest -> process rest
    (s:ss)     -> processRequestOutput ss
    []         -> error "did not find averages\n(perhaps no internet connection?)"
  where
    process = (read :: String -> [Int]) . sanitise

sanitise :: String -> String
-- helper function for input processing functions  
-- also sanitises user input (todo)
sanitise = filter (flip notElem "\"|(){}")
