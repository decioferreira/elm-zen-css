module CSS.Properties.Background.Origin exposing
    ( borderBox, paddingBox, contentBox
    , multiple
    , inherit, initial, revert, revertLayer, unset
    , Origin(..), originToString
    )

{-| The `background-origin` CSS property sets the background's origin: from the border start, inside
the border, or inside the padding.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/background-origin>


# Keyword values

@docs borderBox, paddingBox, contentBox


# Multiple values

@docs multiple


# Global values

@docs inherit, initial, revert, revertLayer, unset


# Types

@docs Origin, originToString

-}

import CSS.Internal exposing (Property)
import CSS.Properties as Properties
import List.Nonempty exposing (Nonempty)


property : String -> Property
property =
    Properties.custom "background-origin"


{-| -}
type Origin
    = BorderBox
    | PaddingBox
    | ContentBox


{-| -}
originToString : Origin -> String
originToString origin =
    case origin of
        BorderBox ->
            "border-box"

        PaddingBox ->
            "padding-box"

        ContentBox ->
            "content-box"



-- KEYWORD VALUES


{-| The background is positioned relative to the border box.
-}
borderBox : Property
borderBox =
    multiple (List.Nonempty.singleton BorderBox)


{-| The background is positioned relative to the padding box.
-}
paddingBox : Property
paddingBox =
    multiple (List.Nonempty.singleton PaddingBox)


{-| The background is positioned relative to the content box.
-}
contentBox : Property
contentBox =
    multiple (List.Nonempty.singleton ContentBox)



-- MULTIPLE VALUES


{-| -}
multiple : Nonempty Origin -> Property
multiple =
    List.Nonempty.toList
        >> List.map originToString
        >> String.join ", "
        >> property



-- GLOBAL


{-| The inherit CSS keyword causes the element to take the computed value of the
property from its parent element.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/inherit>

-}
inherit : Property
inherit =
    property "inherit"


{-| The initial CSS keyword applies the initial (or default) value of a property
to an element.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/initial>

-}
initial : Property
initial =
    property "initial"


{-| The revert CSS keyword reverts the cascaded value of the property from its
current value to the value the property would have had if no changes had been
made by the current style origin to the current element.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/revert>

-}
revert : Property
revert =
    property "revert"


{-| The revert-layer CSS keyword rolls back the value of a property in a cascade
layer to the value of the property in a CSS rule matching the element in a
previous cascade layer.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/revert-layer>

-}
revertLayer : Property
revertLayer =
    property "revert-layer"


{-| The unset CSS keyword resets a property to its inherited value if the
property naturally inherits from its parent, and to its initial value if not.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/unset>

-}
unset : Property
unset =
    property "unset"
