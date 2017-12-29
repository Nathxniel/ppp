module Fame.Process where

import Fame.NetProcess
import Fame.Show

type Years = String
-- type Help = Bool
type Input = [String]

-- theres probably a better way to do this
-- (abstraction)
processStandard :: Input -> IO ()
processStandard i = mainProcess 1 "0" "0" i

processQuiet :: Input -> IO ()
processQuiet i = mainProcess 0 "0" "0" i

processVerbose :: Verbosity -> Input -> IO ()
processVerbose v i = mainProcess v "0" "0" i

processTimed :: Years -> Years -> Input -> IO ()
processTimed ts te i = mainProcess 1 ts' te' i
  where years = (*) 31556952000 -- milliseconds in a year
        ts' = show $ years ((read :: Years -> Int) ts)
        te' = show $ years ((read :: Years -> Int) te)

-- input processing function
mainProcess :: Verbosity   ->
               Years       ->
               Years       ->
               Input       ->
               IO ()
mainProcess v ts te is = do
  let input = sanitise (unwords is)
  queryOut <- getQuery input
  let query = processQueryOutput queryOut input
  requestOut <- getRequest query ts te
  let [x, gh] = processRequestOutput requestOut
  showFame v x gh

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
