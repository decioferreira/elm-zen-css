module CSS.Properties.Background.Clip exposing
    ( borderBox, paddingBox, contentBox, text
    , multiple
    , inherit, initial, revert, revertLayer, unset
    , BackgroundClip(..), backgroundClipToString
    )

{-| The `background-clip` CSS property sets whether an element's background extends underneath its
border box, padding box, or content box.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/background-clip>


# Keyword values

@docs borderBox, paddingBox, contentBox, text


# Multiple values

@docs multiple


# Global values

@docs inherit, initial, revert, revertLayer, unset


# Types

@docs BackgroundClip, backgroundClipToString

-}

import CSS.Internal exposing (Property)
import CSS.Properties as Properties
import List.Nonempty exposing (Nonempty)


property : String -> Property
property =
    Properties.custom "background-clip"


{-| -}
type BackgroundClip
    = BorderBox
    | PaddingBox
    | ContentBox
    | Text


{-| -}
backgroundClipToString : BackgroundClip -> String
backgroundClipToString backgroundClip =
    case backgroundClip of
        BorderBox ->
            "border-box"

        PaddingBox ->
            "padding-box"

        ContentBox ->
            "content-box"

        Text ->
            "text"



-- KEYWORD VALUES


{-| The background extends to the outside edge of the border (but underneath the border in
z-ordering).
-}
borderBox : Property
borderBox =
    multiple (List.Nonempty.singleton BorderBox)


{-| The background extends to the outside edge of the padding. No background is drawn beneath the
border.
-}
paddingBox : Property
paddingBox =
    multiple (List.Nonempty.singleton PaddingBox)


{-| The background is painted within (clipped to) the content box.
-}
contentBox : Property
contentBox =
    multiple (List.Nonempty.singleton ContentBox)


{-| The background is painted within (clipped to) the foreground text.
-}
text : Property
text =
    multiple (List.Nonempty.singleton Text)



-- MULTIPLE VALUES


{-| -}
multiple : Nonempty BackgroundClip -> Property
multiple =
    List.Nonempty.toList
        >> List.map backgroundClipToString
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
