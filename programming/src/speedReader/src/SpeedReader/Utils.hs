module SpeedReader.Utils where

import Data.Maybe (maybe)
import Data.Strings (strPadBoth)

import System.Console.ANSI
import System.IO

import Control.Concurrent (threadDelay)
import Control.Monad

import qualified System.Console.Terminal.Size as Terminal


speedRead :: Float -> [String] -> IO ()
-- takes wpm and list of strings as arguments
speedRead _ []     = return ()
speedRead _ [w]    = writeWord w
speedRead wpm (w:ws) = do
  writeWord w
  clearWord
  hFlush stdout
  wpmDelay wpm
  speedRead wpm ws 

wpmDelay :: Float -> IO ()
-- "words per minute delay"
-- for now makes big numerical calculation
-- parametrised by input
-- to get the correct sleep to match words per minute
--
-- todo: how do you make the program wait traditionally
wpmDelay wpm = 
  (liftM (\x -> foldr (+) 0 [1..x]) bigNo) >>= doNothing
  where bigNo              = pure (d * 5000000)
        d                  = (1 / wpm) * 60
        doNothing dontcare = if dontcare > 42069
                               then return ()
                               else return ()

clearWord :: IO ()
clearWord = do
  cursorUpLine 6

writeWord :: String -> IO ()
-- text format
writeWord w = do
  putStrLn "\n\n"
  printCentre w
  putStrLn "\n"
  
printCentre :: String -> IO ()
-- calculates the width of screen
-- creates string with width screen
-- and text in the middle
printCentre w = do
  width <- getWidth <$> Terminal.size
  putStrLn (strPadBoth ' ' width w)
  where
    getWidth = Terminal.width . (maybe (error "Terminal error") id)
    
