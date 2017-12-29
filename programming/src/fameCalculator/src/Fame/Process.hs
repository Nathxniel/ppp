module Fame.Process where

import Fame.NetProcess
import Fame.Show

type Years = String
-- type Help = Bool
type Input = [String]

-- theres probably a better way to do this
-- (abstraction)
processStandard :: Input -> IO ()
processStandard i = mainProcess 1 "0" i

processQuiet :: Input -> IO ()
processQuiet i = mainProcess 0 "0" i

processVerbose :: Verbosity -> Input -> IO ()
processVerbose v i = mainProcess v "0" i

processTimed :: Years -> Input -> IO ()
processTimed t i = mainProcess 1 t i

-- input processing function
mainProcess :: Verbosity   ->
               Years ->
               Input       ->
               IO ()
mainProcess v t is = do
  let input = sanitise (unwords is)
  -- convert input into "/m/" code using "getInput.js"
  queryOut <- getQuery input
  let query = processQueryOutput queryOut input
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
-- also sanitises user input
sanitise = filter (flip notElem "\"|(){}=\\/$%#*&?<>`~")
