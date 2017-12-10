module Fame.Calculations (fame, getCategory) where

-- calculation functions for fame calculator
--
fame :: Double -> Double -> Double
-- calculates fame dBHA
fame i gh =
  10 * log (i / gh)
  
getCategory :: Double -> String
-- maps fame dBHA to fame category
getCategory x
  | x > 15                 = "A+"
  | 5 < x && x < 15        = "A"
  | (-5) < x && x < 5      = "B"
  | (-15) < x && x < (-5)  = "C"
  | (-25) < x && x < (-15) = "D"
  | (-35) < x && x < (-25) = "E"
  | (-45) < x && x < (-35) = "F"
  | (-55) < x && x < (-45) = "G"
  | x < (-55)              = "H"
