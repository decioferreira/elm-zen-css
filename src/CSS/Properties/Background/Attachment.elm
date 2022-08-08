module CSS.Properties.Background.Attachment exposing
    ( scroll, fixed, local
    , multiple
    , inherit, initial, revert, revertLayer, unset
    , Attachment(..), toString
    )

{-| The background-attachment CSS property sets whether a background image's position is fixed
within the viewport, or scrolls with its containing block.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/background-attachment>


# Keyword values

@docs scroll, fixed, local


# Multiple background images

@docs multiple


# Global values

@docs inherit, initial, revert, revertLayer, unset


# Types

@docs Attachment, toString

-}

import CSS.Internal exposing (Property)
import CSS.Properties as Properties
import List.Nonempty exposing (Nonempty)


property : String -> Property
property =
    Properties.custom "background-attachment"


{-| -}
type Attachment
    = Scroll
    | Fixed
    | Local


{-| -}
toString : Attachment -> String
toString attachment =
    case attachment of
        Scroll ->
            "scroll"

        Fixed ->
            "fixed"

        Local ->
            "local"



-- KEYWORD VALUES


{-| The background is fixed relative to the element itself and does not scroll with its contents.
(It is effectively attached to the element's border.)
-}
scroll : Property
scroll =
    multiple (List.Nonempty.singleton Scroll)


{-| The background is fixed relative to the viewport. Even if an element has a scrolling mechanism,
the background doesn't move with the element. (This is not compatible with background-clip: text.)
-}
fixed : Property
fixed =
    multiple (List.Nonempty.singleton Fixed)


{-| The background is fixed relative to the element's contents. If the element has a scrolling
mechanism, the background scrolls with the element's contents, and the background painting area and
background positioning area are relative to the scrollable area of the element rather than to the
border framing them.
-}
local : Property
local =
    multiple (List.Nonempty.singleton Local)



-- MULTIPLE BACKGROUND IMAGES


{-| This property supports multiple background images. You can specify a different <attachment> for
each background, separated by commas. Each image is matched with the corresponding <attachment>
type, from first specified to last.
-}
multiple : Nonempty Attachment -> Property
multiple =
    List.Nonempty.toList
        >> List.map toString
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
