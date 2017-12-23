module Fame.NetProcess where
  
import System.Process  ( StdStream(..)
                       , createProcess 
                       , CreateProcess(..)
                       , proc
                       )
import System.IO (hGetContents, hClose)

type Query = String
type Time  = String
type Request = String

getRequest :: Query -> Time -> IO (Request)
getRequest q t = do
  (_, Just hout, _, _) <- createProcess $
                          (proc "node" ["getData.js"
                                       ,t
                                       ,q
                                       ]
                          ) { cwd     = Nothing
                            , std_out = CreatePipe }
  out <- hGetContents hout
  return out

getQuery :: String -> IO (Query)
getQuery s = do
  (_, Just hout, _, _) <- createProcess $
                          (proc "node" ["getInput.js"
                                       ,s
                                       ]
                          ) { cwd     = Nothing
                            , std_out = CreatePipe }
  out <- hGetContents hout
  return out
