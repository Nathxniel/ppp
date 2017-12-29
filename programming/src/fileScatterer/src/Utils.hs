module Utils where

import Displaystuff

import System.IO
import System.Directory
import System.Process  ( StdStream(..)
                       , createProcess 
                       , CreateProcess(..)
                       , proc
                       )

import Control.Applicative
import Control.Monad ( when )

import Data.List ( intersperse )

-- how deep are we in
type Depth = Int

-- show help
help :: IO ()
help =
  putStrLn . unlines $
  ["how to use"
  ,"  :q/quit = exit"
  ,"  :h/help = help"
  ,"  :b/b    = go up directory"
  ,"  :l/ls   = show all directories"
  ,"  anything else creates dir of that name"
  ,"  (to create a dir with name \"ls\" type :ls)"
  ]

-- list directories as a tree
ls :: Depth -> IO ()
ls d = do
  (_, Just hout, _, _) <- createProcess $
    (proc "tree" ["-a"
                 ]
    ) { cwd     = Just root
      , std_out = CreatePipe }
  out <- hGetContents hout
  putStrLn out
  where
    root = case d of
             0 -> "."
             1 -> "."
             n -> if d < 0 then "."
                  else concat $ intersperse "/" $ replicate (n-1) ".."

goBack :: Depth -> IO Depth
goBack d = do
  when (d <= 0) $ putStrLn "WARNING: leaving parent dir"
  setCurrentDirectory ".."
  pure (d - 1)

-- mkdir <path> && cd <path>
createAndMoveTo :: Depth -> FilePath -> IO Depth
createAndMoveTo d file = do
  when (d < 0) $ putStrLn "WARNING: leaving parent dir"
  createDirectoryIfMissing False file
  putStrLn ("created/moved to " ++ file)
  setCurrentDirectory file
  pure (d + 1)
