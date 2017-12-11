module Fame.Show (showFame, showUsage, Verbosity) where

import Control.Monad (when)

import Fame.Calculations

type Verbosity = Int

-- show functions 
--
showFame :: Verbosity -> Int -> Int -> IO ()
showFame v i gh = sf v i gh

sf :: Verbosity -> Int -> Int -> IO ()
-- helper function for showFame
sf v i gh = do
  when (v /= 0) $ putStrLn "fetching data...\n"
  let score = fame i gh;
      cat = getCategory score;
      printCat = putStrLn ('\"':cat ++ " List\" celebrity")
  case v of
    0 -> printCat
    1 -> printCat
    2 -> printCat >> showScore score
    3 -> printCat >> showScore score >> showCategories
    4 -> printCat >> showScore score >> showCategories >> showInfo
  where
    showScore x = putStr "dBHa score: " >> print x
    
showCategories :: IO ()
-- displays categories
showCategories = 
  putStrLn . unlines $
  ["categories:"
  ,"A+ list =  15 dBHa < x"
  ,"A  list =  5 dBHa  < x < 15dBHa"
  ,"B  list =  -5 dBHa < x < 5 dBHa"
  ,"C  list = -15 dBHa < x < -5 dBHa"
  ,"D  list = -25 dBHa < x < -15 dBHa"
  ,"E  list = -35 dBHa < x < -25 dBHa"
  ,"F  list = -45 dBHa < x < -35 dBHa"
  ,"G  list = -55 dBHa < x < -45 dBHa"
  ,"H  list =            x < -55 dBHa"
  ]

showInfo :: IO ()
-- displays additional program information
showInfo = 
  putStrLn . unlines $
  ["score is calculated based on relative fame to George Harrison (guitarist)"
  ,"reference: \"Measuring Fame Quantitatively\"- Schulman, E."
  ]  

usage :: IO ()
-- usage window
usage =
  putStrLn . unlines $
  ["usage:"
  ,"  $ fame (options) args"
  ,"  options:"
  ,"  -q quiet, just display fame rating"
  ,"  -v show fame number"
  ,"  -vv show fame category explanation"
  ,"  -vvv show how it works"
  ,"  -h shows usage and program information (arguments are ignored)"
  ,"  args: \"name\" | name"
  ]

showUsage :: Verbosity -> IO ()
showUsage 0 = usage
showUsage 1 = do
  putStrLn "fame calculator: calculates fame category of given name"
  showInfo
  usage
