module CSS.Properties.AlignContent exposing
    ( center, start, end, flexStart, flexEnd
    , normal
    , baseline, firstBaseline, lastBaseline
    , spaceBetween, spaceAround, spaceEvenly, stretch
    , OverflowPosition(..)
    , inherit, initial, revert, revertLayer, unset
    )

{-| The CSS align-content property sets the distribution of space between and
around content items along a flexbox's cross-axis or a grid's block axis.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/align-content>


# Basic positional alignment

@docs center, start, end, flexStart, flexEnd


# Normal alignment

@docs normal


# Baseline alignment

@docs baseline, firstBaseline, lastBaseline


# Distributed alignment

@docs spaceBetween, spaceAround, spaceEvenly, stretch


# Overflow alignment

@docs OverflowPosition


# Global values

@docs inherit, initial, revert, revertLayer, unset

-}

import CSS.Internal exposing (CSS)
import CSS.Properties as Properties


property : String -> CSS -> CSS
property =
    Properties.custom "align-content"



-- BASIC POSITIONAL ALIGNMENT


{-| The items are packed flush to each other in the center of the alignment
container along the cross axis.
-}
center : Maybe OverflowPosition -> CSS -> CSS
center maybeOverflowPosition =
    property (overflowPositionHelper maybeOverflowPosition "center")


{-| The items are packed flush to each other against the start edge of the
alignment container in the cross axis.
-}
start : Maybe OverflowPosition -> CSS -> CSS
start maybeOverflowPosition =
    property (overflowPositionHelper maybeOverflowPosition "start")


{-| The items are packed flush to each other against the end edge of the
alignment container in the cross axis.
-}
end : Maybe OverflowPosition -> CSS -> CSS
end maybeOverflowPosition =
    property (overflowPositionHelper maybeOverflowPosition "end")


{-| The items are packed flush to each other against the edge of the alignment
container depending on the flex container's cross-start side. This only applies
to flex layout items. For items that are not children of a flex container, this
value is treated like start.
-}
flexStart : Maybe OverflowPosition -> CSS -> CSS
flexStart maybeOverflowPosition =
    property (overflowPositionHelper maybeOverflowPosition "flex-start")


{-| The items are packed flush to each other against the edge of the alignment
container depending on the flex container's cross-end side. This only applies to
flex layout items. For items that are not children of a flex container, this
value is treated like end.
-}
flexEnd : Maybe OverflowPosition -> CSS -> CSS
flexEnd maybeOverflowPosition =
    property (overflowPositionHelper maybeOverflowPosition "flex-end")



-- NORMAL ALIGNMENT


{-| The items are packed in their default position as if no align-content value
was set.
-}
normal : CSS -> CSS
normal =
    property "normal"



-- BASELINE ALIGNMENT


{-| Specifies participation in first- or last-baseline alignment: aligns the
alignment baseline of the box's first or last baseline set with the
corresponding baseline in the shared first or last baseline set of all the boxes
in its baseline-sharing group.
-}
baseline : CSS -> CSS
baseline =
    property "baseline"


{-| Specifies participation in first- or last-baseline alignment: aligns the
alignment baseline of the box's first or last baseline set with the
corresponding baseline in the shared first or last baseline set of all the boxes
in its baseline-sharing group.
-}
firstBaseline : CSS -> CSS
firstBaseline =
    property "first baseline"


{-| Specifies participation in first- or last-baseline alignment: aligns the
alignment baseline of the box's first or last baseline set with the
corresponding baseline in the shared first or last baseline set of all the boxes
in its baseline-sharing group.
-}
lastBaseline : CSS -> CSS
lastBaseline =
    property "last baseline"



-- DISTRIBUTED ALIGNMENT


{-| The items are evenly distributed within the alignment container along the
cross axis. The spacing between each pair of adjacent items is the same. The
first item is flush with the start edge of the alignment container in the cross
axis, and the last item is flush with the end edge of the alignment container in
the cross axis.
-}
spaceBetween : CSS -> CSS
spaceBetween =
    property "space-between"


{-| The items are evenly distributed within the alignment container along the
cross axis. The spacing between each pair of adjacent items is the same. The
empty space before the first and after the last item equals half of the space
between each pair of adjacent items.
-}
spaceAround : CSS -> CSS
spaceAround =
    property "space-around"


{-| The items are evenly distributed within the alignment container along the
cross axis. The spacing between each pair of adjacent items, the start edge and
the first item, and the end edge and the last item, are all exactly the same.
-}
spaceEvenly : CSS -> CSS
spaceEvenly =
    property "space-evenly"


{-| If the combined size of the items along the cross axis is less than the size
of the alignment container, any auto-sized items have their size increased
equally (not proportionally), while still respecting the constraints imposed by
max-height/max-width (or equivalent functionality), so that the combined size
exactly fills the alignment container along the cross axis.
-}
stretch : CSS -> CSS
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
