module Loop where

import Utils

import System.IO ( hFlush, stdout, writeFile )
import System.Directory ( getCurrentDirectory )

calcLoopState :: Bool -> Depth -> IO (Bool, Depth)
calcLoopState b d = pure (b, d)

-- loop body
loopBody :: Depth -> IO (Bool, Depth)
loopBody d = do
  wd <- getCurrentDirectory
  putStr (wd ++ "> ")
  hFlush stdout
  input <- getLine
  case input of
    "quit"   -> procQuit
    ":q"     -> procQuit
    "help"   -> procHelp
    ":h"     -> procHelp
    "back"   -> procBack
    ":b"     -> procBack
    "ls"     -> procList
    ":l"     -> procList
    ":quit"  -> moveTo "quit"
    ":help"  -> moveTo "help"
    ":back"  -> moveTo "b"
    ":ls"    -> moveTo "ls"
    ":touch" -> moveTo "touch"
    -- :t/touch to make empty files with name [filename]
    't':'o':'u':'c':'h':' ':filename -> procTc filename
    ':':'t':' ':            filename -> procTc filename
    []       -> procHelp
    _        -> moveTo input
    where
      procQuit = return (False, d)
      procHelp = help     >> return (True, d)
      procBack = goBack d >>= calcLoopState True
      procList = ls d     >>  return (True, d)
      procTc h = writeFile h ":)"    >>  return (True, d)
      moveTo x = createAndMoveTo d x >>= calcLoopState True
