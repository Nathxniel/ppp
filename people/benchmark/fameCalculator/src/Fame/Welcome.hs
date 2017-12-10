module Fame.Welcome (welcome) where

-- program display windows
--
welcome :: IO ()
-- welcome window
welcome =
  putStrLn . init . unlines $
  ["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  ,"~~~ fame calculator"
  ,"~~~"
  ]
