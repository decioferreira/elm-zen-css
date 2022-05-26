module CSS.Properties.AlignSelf exposing
    ( auto, normal
    , center, start, end, selfStart, selfEnd, flexStart, flexEnd
    , baseline, firstBaseline, lastBaseline, stretch
    , OverflowPosition(..)
    , inherit, initial, revert, revertLayer, unset
    )

{-| The align-self CSS property overrides a grid or flex item's align-items
value. In Grid, it aligns the item inside the grid area. In Flexbox, it aligns
the item on the cross axis.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/align-self>


# Keyword values

@docs auto, normal


# Positional alignment

@docs center, start, end, selfStart, selfEnd, flexStart, flexEnd


# Baseline alignment

@docs baseline, firstBaseline, lastBaseline, stretch


# Overflow alignment

@docs OverflowPosition


# Global values

@docs inherit, initial, revert, revertLayer, unset

-}

import CSS.Internal exposing (Property)
import CSS.Properties as Properties


property : String -> Property
property =
    Properties.custom "align-self"



-- KEYWORD VALUES


{-| Computes to the parent's align-items value.
-}
auto : Property
auto =
    property "auto"


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
normal : Property
normal =
    property "normal"



-- POSITIONAL ALIGNMENT


{-| The flex item's margin box is centered within the line on the cross-axis.
If the cross-size of the item is larger than the flex container, it will overflow
equally in both directions.
-}
center : Maybe OverflowPosition -> Property
center maybeOverflowPosition =
    property (overflowPositionHelper maybeOverflowPosition "center")


{-| Put the item at the start.
-}
start : Maybe OverflowPosition -> Property
start maybeOverflowPosition =
    property (overflowPositionHelper maybeOverflowPosition "start")


{-| Put the item at the end.
-}
end : Maybe OverflowPosition -> Property
end maybeOverflowPosition =
    property (overflowPositionHelper maybeOverflowPosition "end")


{-| Aligns the items to be flush with the edge of the alignment container
corresponding to the item's start side in the cross axis.
-}
selfStart : Maybe OverflowPosition -> Property
selfStart maybeOverflowPosition =
    property (overflowPositionHelper maybeOverflowPosition "self-start")


{-| Aligns the items to be flush with the edge of the alignment container
corresponding to the item's end side in the cross axis.
-}
selfEnd : Maybe OverflowPosition -> Property
selfEnd maybeOverflowPosition =
    property (overflowPositionHelper maybeOverflowPosition "self-end")


{-| The cross-start margin edge of the flex item is flushed with the cross-start
edge of the line.
-}
flexStart : Maybe OverflowPosition -> Property
flexStart maybeOverflowPosition =
    property (overflowPositionHelper maybeOverflowPosition "flex-start")


{-| The cross-end margin edge of the flex item is flushed with the cross-end
edge of the line.
-}
flexEnd : Maybe OverflowPosition -> Property
flexEnd maybeOverflowPosition =
    property (overflowPositionHelper maybeOverflowPosition "flex-end")



-- BASELINE ALIGNMENT


{-| Specifies participation in first- or last-baseline alignment: aligns the
alignment baseline of the box's first or last baseline set with the
corresponding baseline in the shared first or last baseline set of all the boxes
in its baseline-sharing group. The fallback alignment for first baseline is
start, the one for last baseline is end.
-}
baseline : Property
baseline =
    property "baseline"


{-| Specifies participation in first- or last-baseline alignment: aligns the
alignment baseline of the box's first or last baseline set with the
corresponding baseline in the shared first or last baseline set of all the boxes
in its baseline-sharing group. The fallback alignment for first baseline is
start, the one for last baseline is end.
-}
firstBaseline : Property
firstBaseline =
    property "first baseline"


{-| Specifies participation in first- or last-baseline alignment: aligns the
alignment baseline of the box's first or last baseline set with the
corresponding baseline in the shared first or last baseline set of all the boxes
in its baseline-sharing group. The fallback alignment for first baseline is
start, the one for last baseline is end.
-}
lastBaseline : Property
lastBaseline =
    property "last baseline"


{-| If the combined size of the items along the cross axis is less than the size
of the alignment container and the item is auto-sized, its size is increased
equally (not proportionally), while still respecting the constraints imposed by
max-height/max-width (or equivalent functionality), so that the combined size of
all auto-sized items exactly fills the alignment container along the cross axis.
-}
stretch : Property
stretch =
    property "stretch"



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
