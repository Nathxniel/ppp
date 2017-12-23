module SpeedReader.File where

import System.Process  ( StdStream(..)
                       , createProcess 
                       , CreateProcess(..)
                       , proc
                       )
import System.IO (hGetContents, hClose)

data FileType = PDF | TXT

getFileType :: FilePath -> FileType
getFileType fp =
  case extension of
    ['.','p','d','f'] -> PDF
    ['.','t','x','t'] -> TXT
    _                 -> error "file type not recognised"
    where (filename, extension) = break (=='.') fp

processFile :: FilePath -> IO [String]
-- takes filename and converts to [String]
-- uses pdftotext -nopgbrk -q
-- 
-- if file is text, just get it
processFile fp =
  case getFileType fp of
    PDF -> do
             (_, Just hout, _, _) <- createProcess $
               (proc "pdftotext" [fp
                                 ,"-nopgbrk"
                                 ,"-"
                                 ,"-q"
                                 ]
               ) { cwd     = Nothing
                 , std_out = CreatePipe }
             out <- hGetContents hout
             return (words out)
    TXT -> words <$> readFile fp
