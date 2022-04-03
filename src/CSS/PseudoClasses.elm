module CSS.PseudoClasses exposing (custom, hover)

{-|


# Pseudo-classes

@docs custom, hover

-}

import CSS.Internal exposing (CSS(..))


custom : String -> (CSS -> CSS) -> CSS -> CSS
custom pseudoClassName value (CSS details) =
    CSS { details | pseudoClasses = ( pseudoClassName, value ) :: details.pseudoClasses }


hover : (CSS -> CSS) -> CSS -> CSS
hover =
    custom "hover"
