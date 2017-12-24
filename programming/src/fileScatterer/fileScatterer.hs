import System.Directory
import Control.Applicative
import System.IO

welcome :: IO ()
welcome = 
  putStrLn . unlines $
  ["####################"
  ,"#  file scatterer  #"
  ,"####################"
  ]

help :: IO ()
help = 
  putStrLn . unlines $
  ["help:"
  ,"  :q/quit = exit"
  ,"   help   = help"
  ,"  anything else creates dir of that name"
  ]

-- main
main :: IO ()
main = do
  welcome
  help
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
  hFlush stdout
  input <- getLine
  case input of
    "quit" -> return False
    ":q"   -> return False
    "help" -> help                  >> return True
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
