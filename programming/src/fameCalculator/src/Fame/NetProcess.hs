module Fame.NetProcess where
  
import System.Process  ( StdStream(..)
                       , createProcess 
                       , CreateProcess(..)
                       , proc
                       )
import System.Directory ( getUserDocumentsDirectory )
import System.IO (hGetContents, hClose)

type Query = String
type Time  = String
type Request = String

getRequest :: Query -> Time -> Time -> IO (Request)
getRequest q ts te = do
  home <- getUserDocumentsDirectory
  (_, Just hout, _, _) <- createProcess $
                          (proc "node" ["getData.js"
                                       ,ts
                                       ,te
                                       ,q
                                       ]
                          ) { cwd     = Just (home ++ "/.fame/")
                            , std_out = CreatePipe }
  out <- hGetContents hout
  return out

getQuery :: String -> IO (Query)
getQuery s = do
  home <- getUserDocumentsDirectory
  (_, Just hout, _, _) <- createProcess $
                          (proc "node" ["getInput.js"
                                       ,s
                                       ]
                          ) { cwd     = Just (home ++ "/.fame/")
                            , std_out = CreatePipe }
  out <- hGetContents hout
  return out
