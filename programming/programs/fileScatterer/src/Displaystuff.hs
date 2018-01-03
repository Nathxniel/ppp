module Displaystuff where

import Data.Maybe
import Data.Strings (strPadBoth)

import qualified System.Console.Terminal.Size as Terminal

getWidth = Terminal.width . (maybe (error "Terminal error") id)

welcome :: IO ()
welcome = do
  width <- getWidth <$> Terminal.size
  let hwidth  = width `div` 2;
      bar     = replicate hwidth '#';
      midbar  = strPadBoth ' ' width bar;
      text    = "file scatterer";
      text'   = strPadBoth ' ' (hwidth - 4) text;
      text''  = strPadBoth '#' hwidth text';
      midtext = strPadBoth ' ' width text''
  putStrLn . unlines $ [midbar, midtext, midbar]
