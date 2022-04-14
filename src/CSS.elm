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


{-| Represents the CSS stucture.
-}
type alias CSS =
    Internal.CSS



-- Methods


{-| Start a new class definition.
-}
css : String -> CSS
css =
    Internal.css


{-| Start a new descendant class definition.
-}
descendantClass : String -> (CSS -> CSS) -> CSS -> CSS
descendantClass descendantClassName value (Internal.CSS details) =
    Internal.CSS
        { details
            | descendantClasses =
                ( descendantClassName, value ) :: details.descendantClasses
        }
