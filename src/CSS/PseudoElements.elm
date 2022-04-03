module CSS.PseudoElements exposing (custom, before, after)

{-|


# Pseudo-elements

@docs custom, before, after

-}

import CSS.Internal exposing (CSS(..))


custom : String -> (CSS -> CSS) -> CSS -> CSS
custom pseudoElementName value (CSS details) =
    CSS { details | pseudoElements = ( pseudoElementName, value ) :: details.pseudoElements }


before : (CSS -> CSS) -> CSS -> CSS
before =
    custom "before"


after : (CSS -> CSS) -> CSS -> CSS
after =
    custom "after"
