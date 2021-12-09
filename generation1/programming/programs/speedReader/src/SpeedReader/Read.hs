module SpeedReader.Read (speedRead, bookmarkRead, audioRead) where

import Data.List (nub)

import SpeedReader.Utils
import SpeedReader.Bookmark
import SpeedReader.File

audioRead :: String -> IO ()
-- takes an unparsed input (from pdftotext)
-- returns a wav file
--
-- remove "" and \n from the pdftotext
audioRead xs = createAudiobookWAV $ sentence $ filter' xs
  where sentence (x:xs) = nub $ buffering [] (x:xs)
        buffering buffer ('.':xs) = (buffer ++ ".") : buffering [] xs
        buffering buffer (x:xs)   = buffering (buffer ++ [x]) xs
        buffering buffer []       = buffer : []
        --filter' = filter (flip notElem "\n\"-=~`¬")
        --sanitise input for problematic characters
        filter' ('\n':xs) = ' ' : filter' xs
        filter' ('\"':xs) = ' ' : filter' xs
        filter' ('~':xs)  = ' ' : filter' xs
        filter' ('-':xs)  = ' ' : filter' xs
        filter' ('=':xs)  = ' ' : filter' xs
        filter' (x:xs)    = x : filter' xs
        fitler' []        = []

speedRead :: Float -> [String] -> IO ()
-- takes wpm and list of strings as arguments
speedRead _ []       = return ()
speedRead _ [w]      = writeWord w
speedRead wpm (w:ws) = do
  writeWord w
  clearWord
  wpmDelay wpm
  speedRead wpm ws 

bookmarkRead :: Bookmark -> BookmarkName -> -- bookmark data and name
                Float    -> [String]     -> IO ()
-- similar to speedRead but writes save data to "bookmark files"
bookmarkRead n f wpm ws = bmr n f wpm (skip 0 ws) 
  where skip _ []     = []
        skip pos (x:xs)
          | pos >= n  = (x:xs)
          | otherwise = skip (pos+1) xs

-- helper function for bookmarkRead
bmr :: Bookmark -> BookmarkName ->
       Float    -> [String]     -> IO ()
bmr _ f _ []       = writeBookmark 0 f
bmr _ f _ [w]      = writeWord w >> writeBookmark 0 f
bmr n f wpm (w:ws) = do
  writeWord w
  writeBookmark n f
  clearWord
  wpmDelay wpm
  bmr (n+1) f wpm ws