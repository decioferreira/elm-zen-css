module CSS.PseudoElements exposing (custom, before, after)

{-| A CSS pseudo-element is a keyword added to a selector that lets you style a
specific part of the selected element(s).

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements>


# Pseudo-elements

@docs custom, before, after

-}

import CSS.Internal exposing (CSS(..))


{-| -}
custom : String -> (CSS -> CSS) -> CSS -> CSS
custom pseudoElementName value (CSS details) =
    CSS { details | pseudoElements = ( pseudoElementName, value ) :: details.pseudoElements }


{-| In CSS, ::before creates a pseudo-element that is the first child of the
selected element.
-}
before : (CSS -> CSS) -> CSS -> CSS
before =
    custom "before"


{-| In CSS, ::after creates a pseudo-element that is the last child of the
selected element.
-}
after : (CSS -> CSS) -> CSS -> CSS
after =
    custom "after"
