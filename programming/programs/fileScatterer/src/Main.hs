module Main where

import Displaystuff
import Utils
import Loop

-- main
main :: IO ()
main = do
  welcome
  help
  mainLoop 0

-- main loop
mainLoop :: Depth -> IO ()
mainLoop d = do
  (loop, d') <- loopBody d
  if loop
    then mainLoop d'
    else putStrLn "exiting.."
