module Loop where

import Utils

import System.IO ( hFlush, stdout )
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
    "quit"  -> return (False, d)
    ":q"    -> return (False, d)
    "help"  -> help >> return (True, d)
    ":h"    -> help >> return (True, d)
    "back"  -> goBack d >>= calcLoopState True
    ":b"    -> goBack d >>= calcLoopState True
    "ls"    -> ls d >> return (True, d)
    ":l"    -> ls d >> return (True, d)
    -- todo: add :t/touch to make empty files with names
    ":quit" -> createAndMoveTo d "quit" >>= calcLoopState True
    ":help" -> createAndMoveTo d "help" >>= calcLoopState True
    ":back" -> createAndMoveTo d "b" >>= calcLoopState True
    ":ls"   -> createAndMoveTo d "ls"  >>= calcLoopState True
    []      -> help >> return (True, d)
    _       -> createAndMoveTo d input >>= calcLoopState True

