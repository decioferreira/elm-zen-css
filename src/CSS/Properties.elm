module CSS.Properties exposing (custom)

{-|


# Properties

@docs custom

-}

import CSS.Internal exposing (Property)


{-| -}
custom : String -> String -> Property
custom =
    Tuple.pair
