module CSS.Properties.AlignItems exposing
    ( normal, stretch
    , center, start, end, selfStart, selfEnd, flexStart, flexEnd
    , baseline, firstBaseline, lastBaseline
    , OverflowPosition(..)
    , inherit, initial, revert, revertLayer, unset
    )

{-| The CSS align-items property sets the align-self value on all direct
children as a group. In Flexbox, it controls the alignment of items on the Cross
Axis. In Grid Layout, it controls the alignment of items on the Block Axis
within their grid area.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/align-items>


# Basic keywords

@docs normal, stretch


# Positional alignment

@docs center, start, end, selfStart, selfEnd, flexStart, flexEnd


# Baseline alignment

@docs baseline, firstBaseline, lastBaseline


# Overflow alignment

@docs OverflowPosition


# Global values

@docs inherit, initial, revert, revertLayer, unset

-}

import CSS.Internal exposing (CSS)
import CSS.Properties as Properties


property : String -> CSS -> CSS
property =
    Properties.custom "align-items"



-- BASIC KEYWORDS


{-| The effect of this keyword is dependent of the layout mode we are in:

  - In absolutely-positioned layouts, the keyword behaves like start on replaced
    absolutely-positioned boxes, and as stretch on all other
    absolutely-positioned boxes.
  - In static position of absolutely-positioned layouts, the keyword behaves as
    stretch.
  - For flex items, the keyword behaves as stretch.
  - For grid items, this keyword leads to a behavior similar to the one of
    stretch, except for boxes with an aspect ratio or an intrinsic sizes where
    it behaves like start.
  - The property doesn't apply to block-level boxes, and to table cells.

-}
normal : CSS -> CSS
normal =
    property "normal"


{-| Flex items are stretched such that the cross-size of the item's margin box
is the same as the line while respecting width and height constraints.
-}
stretch : CSS -> CSS
stretch =
    property "stretch"



-- BASIC POSITIONAL ALIGNMENT


{-| The flex items' margin boxes are centered within the line on the cross-axis.
If the cross-size of an item is larger than the flex container, it will overflow
equally in both directions.
-}
center : Maybe OverflowPosition -> CSS -> CSS
center maybeOverflowPosition =
    property (overflowPositionHelper maybeOverflowPosition "center")


{-| The items are packed flush to each other toward the start edge of the
alignment container in the appropriate axis.
-}
start : Maybe OverflowPosition -> CSS -> CSS
start maybeOverflowPosition =
    property (overflowPositionHelper maybeOverflowPosition "start")


{-| The items are packed flush to each other toward the end edge of the
alignment container in the appropriate axis.
-}
end : Maybe OverflowPosition -> CSS -> CSS
end maybeOverflowPosition =
    property (overflowPositionHelper maybeOverflowPosition "end")


{-| The items are packed flush to the edge of the alignment container of the
start side of the item, in the appropriate axis.
-}
selfStart : Maybe OverflowPosition -> CSS -> CSS
selfStart maybeOverflowPosition =
    property (overflowPositionHelper maybeOverflowPosition "self-start")


{-| The items are packed flush to the edge of the alignment container of the end
side of the item, in the appropriate axis.
-}
selfEnd : Maybe OverflowPosition -> CSS -> CSS
selfEnd maybeOverflowPosition =
    property (overflowPositionHelper maybeOverflowPosition "self-end")


{-| The cross-start margin edges of the flex items are flushed with the
cross-start edge of the line.
-}
flexStart : Maybe OverflowPosition -> CSS -> CSS
flexStart maybeOverflowPosition =
    property (overflowPositionHelper maybeOverflowPosition "flex-start")


{-| The cross-end margin edges of the flex items are flushed with the cross-end
edge of the line.
-}
flexEnd : Maybe OverflowPosition -> CSS -> CSS
flexEnd maybeOverflowPosition =
    property (overflowPositionHelper maybeOverflowPosition "flex-end")



-- BASELINE ALIGNMENT


{-| All flex items are aligned such that their flex container baselines align.
The item with the largest distance between its cross-start margin edge and its
baseline is flushed with the cross-start edge of the line.
-}
baseline : CSS -> CSS
baseline =
    property "baseline"


{-| All flex items are aligned such that their flex container baselines align.
The item with the largest distance between its cross-start margin edge and its
baseline is flushed with the cross-start edge of the line.
-}
firstBaseline : CSS -> CSS
firstBaseline =
    property "first baseline"


{-| All flex items are aligned such that their flex container baselines align.
The item with the largest distance between its cross-start margin edge and its
baseline is flushed with the cross-start edge of the line.
-}
lastBaseline : CSS -> CSS
lastBaseline =
    property "last baseline"



-- OVERFLOW ALIGNMENT


{-| Used alongside an alignment keyword.
-}
type OverflowPosition
    = Safe
    | Unsafe


overflowPositionHelper : Maybe OverflowPosition -> String -> String
overflowPositionHelper maybeOverflowPosition contentPosition =
    case maybeOverflowPosition of
        Just Safe ->
            "safe " ++ contentPosition

        Just Unsafe ->
            "unsafe " ++ contentPosition

        Nothing ->
            contentPosition



-- GLOBAL


{-| The inherit CSS keyword causes the element to take the computed value of the
property from its parent element.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/inherit>

-}
inherit : CSS -> CSS
inherit =
    property "inherit"


{-| The initial CSS keyword applies the initial (or default) value of a property
to an element.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/initial>

-}
initial : CSS -> CSS
initial =
    property "initial"


{-| The revert CSS keyword reverts the cascaded value of the property from its
current value to the value the property would have had if no changes had been
made by the current style origin to the current element.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/revert>

-}
revert : CSS -> CSS
revert =
    property "revert"


{-| The revert-layer CSS keyword rolls back the value of a property in a cascade
layer to the value of the property in a CSS rule matching the element in a
previous cascade layer.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/revert-layer>

-}
revertLayer : CSS -> CSS
revertLayer =
    property "revert-layer"


{-| The unset CSS keyword resets a property to its inherited value if the
property naturally inherits from its parent, and to its initial value if not.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/unset>

-}
unset : CSS -> CSS
unset =
    property "unset"
