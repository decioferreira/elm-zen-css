module CSS exposing
    ( CSS
    , css, descendantClass
    )

{-|


# Definition

@docs CSS


# Methods

@docs css, descendantClass

-}

import CSS.Internal as Internal



-- Definition


type alias CSS =
    Internal.CSS



-- Methods


css : String -> CSS
css =
    Internal.css


descendantClass : String -> (CSS -> CSS) -> CSS -> CSS
descendantClass descendantClassName value (Internal.CSS details) =
    Internal.CSS
        { details
            | descendantClasses =
                ( descendantClassName, value ) :: details.descendantClasses
        }
