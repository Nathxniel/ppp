import System.Directory
import Control.Applicative

_test :: FilePath
_test = "./test"

_file :: FilePath -> FilePath
_file = (++) _test  

main :: IO ()
main = do
  createDirectoryIfMissing False _test
  setCurrentDirectory _test
  ls
  mainLoop

mainLoop :: IO ()
mainLoop = do
  loop <- loopBody
  if loop
    then mainLoop
    else putStrLn "exiting.."
  
loopBody :: IO Bool
loopBody = do
  wd <- getCurrentDirectory
  putStr (wd ++ "> ")
  input <- getLine
  case input of
    "quit" -> return False
    ":q"   -> return False
    _      -> createAndMoveTo input >> return True

ls :: IO ()
ls = do
  wd <- getCurrentDirectory
  (unwords <$> listDirectory wd) >>= putStrLn

createAndMoveTo :: FilePath -> IO ()
createAndMoveTo file = do
  createDirectoryIfMissing False file
  putStrLn ("created " ++ file)
  setCurrentDirectory file
