module CSS.Properties exposing (custom)

{-|


# Properties

@docs custom

-}

import CSS.Internal exposing (CSS(..))


{-| -}
custom : String -> String -> CSS -> CSS
custom propertyName value (CSS details) =
    CSS { details | properties = ( propertyName, value ) :: details.properties }
