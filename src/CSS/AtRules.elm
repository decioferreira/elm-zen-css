module CSS.AtRules exposing (custom, media)

{-|


# At-rules

@docs custom, media

-}

import CSS.Internal exposing (CSS(..))


custom : String -> String -> (CSS -> CSS) -> CSS -> CSS
custom identifier rule value (CSS details) =
    CSS { details | atRules = ( identifier, rule, value ) :: details.atRules }


media : String -> (CSS -> CSS) -> CSS -> CSS
media =
    custom "media"
