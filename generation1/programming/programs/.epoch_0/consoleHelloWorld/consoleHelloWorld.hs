import System.Console.ANSI

main :: IO ()
main = sgrExample

sgrExample :: IO ()
sgrExample = do
    setSGR [SetColor Foreground Vivid Red]
    setSGR [SetColor Background Vivid Blue]
    putStrLn "Red-On-Blue"
    setSGR [Reset]
    putStrLn "White-On-Black"
