module Displaystuff where

import Data.Maybe
import Data.Strings (strPadBoth)

import qualified System.Console.Terminal.Size as Terminal

getWidth = Terminal.width . (maybe (error "Terminal error") id)

simpleHello :: Int -> String -> IO ()
simpleHello width stat = do
  let hwidth  = width `div` 2;
      bar     = replicate hwidth '#';
      midbar  = strPadBoth ' ' width bar;
  putStrLn midbar
  printmid width stat
  putStrLn midbar

printmid :: Int -> String -> IO ()
printmid width stat = do
  let hwidth  = width `div` 2;
      text    = stat
      text'   = strPadBoth ' ' (hwidth - 4) text;
      text''  = strPadBoth '#' hwidth text';
      midtext = strPadBoth ' ' width text''
  putStrLn midtext

welcome :: IO ()
welcome = do
  width <- getWidth <$> Terminal.size
  let say = printmid width
  if width < 102
  then do
    simpleHello width "file scatterer"
  else do
    mapM_ say $
      ["###################################################################################################"
      ,"#        [c.ccccc.[c.[cc   .[cccccc                                                               #"
      ,"#        [c.     .[c.[cc   .[cc                                                                   #"
      ,"#        [c.     .[c.[cc   .[cc                                                                   #"
      ,"#        [c.cccc .[c.[cc   .[ccccc                                                                #"
      ,"#        [c.     .[c.[cc   .[cc                                                                   #"
      ,"#        [c.     .[c.[cc   .[cc                                                                   #"
      ,"#        [c.     .[c.[ccccc.[cccccc                                                               #"
      ,"#                                                                                                 #"
      ,"#          [cc cc  ...[cc     ..[c..cccc[ccc.[ccc[cccc.[ccccc.[ccccccc  .[cccccc.[ccccccc         #"
      ,"#        [cc    [..[cc   [c  ..[c cc   .[cc     .[cc  .[cc   .[cc    [cc.[cc    .[cc    [cc       #"
      ,"#         [cc    .[cc       ..[c  [cc  .[cc     .[cc  .[cc   .[cc    [cc.[cc    .[cc    [cc       #"
      ,"#           [cc  .[cc      ..[cc   [cc .[cc     .[cc  .[ccccc.[c [cc    .[cccccc.[c [cc           #"
      ,"#              [c.[cc     ..[cccccc [cc.[cc     .[cc  .[cc   .[cc  [cc  .[cc    .[cc  [cc         #"
      ,"#        [cc    [..[cc   [c[cc       [c.[cc     .[cc  .[cc   .[cc    [cc.[cc    .[cc    [cc       #"
      ,"#          [cc cc ...[cccc cc         [.[cc     .[cc  .[ccccc.[cc      [.[cccccc.[cc      [cc     #"
      ,"###################################################################################################"
      ]

