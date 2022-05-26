module CSS.PseudoElements exposing (custom, before, after)

{-| A CSS pseudo-element is a keyword added to a selector that lets you style a
specific part of the selected element(s).

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements>


# Pseudo-elements

@docs custom, before, after

-}

import CSS.Internal exposing (Class(..), Property)


{-| -}
custom : String -> List Property -> Class -> Class
custom pseudoElementName properties (Class details) =
    Class
        { details
            | pseudoElements =
                ( pseudoElementName, properties )
                    :: details.pseudoElements
        }


{-| In CSS, ::before creates a pseudo-element that is the first child of the
selected element.
-}
before : List Property -> Class -> Class
before =
    custom "before"


{-| In CSS, ::after creates a pseudo-element that is the last child of the
selected element.
-}
after : List Property -> Class -> Class
after =
    custom "after"
