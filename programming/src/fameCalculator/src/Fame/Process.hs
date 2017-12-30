module Fame.Process where

import Fame.NetProcess
import Fame.Show

import Control.Monad (when)

type Input = [String]

-- theres probably a better way to do this
-- (abstraction)
processStandard :: Input -> IO ()
processStandard i = mainProcess 1 "0" "0" i

processQuiet :: Input -> IO ()
processQuiet i = mainProcess 0 "0" "0" i

processVerbose :: Verbosity -> Input -> IO ()
processVerbose v i = mainProcess v "0" "0" i

processTimed :: Time -> Time -> Input -> IO ()
processTimed ts te i = if ts' <= te'
                         then showUsage 0
                         else mainProcess 2 (show ts') (show te') i
  where years = (*) 31556952000 -- milliseconds in a year
        ts'   = years ((read :: Time -> Int) ts)
        te'   = years ((read :: Time -> Int) te)

-- input processing function
mainProcess :: Verbosity ->
               Time      ->
               Time      ->
               Input     ->
               IO ()
mainProcess v ts te is = do
  let input = sanitise (unwords is)
  queryOut <- getQuery input
  let query = processQueryOutput queryOut input
  requestOut <- getRequest query ts te
  let [x, gh] = processRequestOutput requestOut
  showFame v x gh
  when (ts/="0") $ showTimeInfo ts te

-- convert to IO to display category
processQueryOutput :: String -> String -> String
-- default is used in case m-code cannot be found
processQueryOutput out deflt =
  case out of
    '\"': '/' : 'm' : '/' : rest -> ("/m/" ++ process rest)
    (s:ss) -> processQueryOutput ss deflt
    []     -> deflt
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
-- also sanitises user input
sanitise = filter (flip notElem "\"|(){}=\\/$%#*&?<>`~")
