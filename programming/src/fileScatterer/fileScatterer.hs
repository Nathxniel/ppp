-- todo: haddock

import System.Directory
import Control.Applicative

-- main
main :: IO ()
main = do
  -- todo: add "welcome message"
  -- todo: add "help"
  ls
  mainLoop

-- main loop
mainLoop :: IO ()
mainLoop = do
  loop <- loopBody
  if loop
    then mainLoop
    else putStrLn "exiting.."
  
-- loop body
loopBody :: IO Bool
loopBody = do
  wd <- getCurrentDirectory
  putStr (wd ++ "> ")
  input <- getLine
  case input of
    "quit" -> return False
    ":q"   -> return False
    -- todo: add help ("help" and ":Q")
    _      -> createAndMoveTo input >> return True

-- list current directory
ls :: IO ()
ls = do
  wd <- getCurrentDirectory
  (unwords <$> listDirectory wd) >>= putStrLn

-- mkdir <path> && cd <path>
createAndMoveTo :: FilePath -> IO ()
createAndMoveTo file = do
  createDirectoryIfMissing False file
  putStrLn ("created " ++ file)
  setCurrentDirectory file
