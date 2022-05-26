module CSS.PseudoClasses exposing (custom, hover)

{-| A CSS pseudo-class is a keyword added to a selector that specifies a special
state of the selected element(s).

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes>


# Pseudo-classes

@docs custom, hover

-}

import CSS.Internal exposing (Class(..), Property)


{-| -}
custom : String -> List Property -> Class -> Class
custom pseudoClassName value (Class details) =
    Class
        { details
            | pseudoClasses =
                ( pseudoClassName, value )
                    :: details.pseudoClasses
        }


{-| The :hover CSS pseudo-class matches when the user interacts with an element
with a pointing device, but does not necessarily activate it.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/:hover>

-}
hover : List Property -> Class -> Class
hover =
    custom "hover"
