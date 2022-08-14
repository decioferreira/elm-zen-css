module CSS.Properties.BlockSize exposing
    ( length, percentage, auto, maxContent, minContent, fitContent
    , inherit, initial, revert, revertLayer, unset
    )

{-| The `block-size` CSS property defines the horizontal or vertical size of an element's block,
depending on its writing mode. It corresponds to either the `width` or the `height` property,
depending on the value of `writing-mode`.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/block-size>


# Values

@docs length, percentage, auto, maxContent, minContent, fitContent


# Global values

@docs inherit, initial, revert, revertLayer, unset

-}

import CSS.Internal exposing (Property)
import CSS.Properties as Properties
import CSS.Types.Length as Length exposing (Length)
import CSS.Types.LengthPercentage as LengthPercentage exposing (LengthPercentage)
import CSS.Types.Percentage as Percentage exposing (Percentage)


property : String -> Property
property =
    Properties.custom "block-size"



-- VALUES


{-| -}
length : Length -> Property
length value =
    property (Length.toString value)


{-| -}
percentage : Percentage -> Property
percentage value =
    property (Percentage.toString value)


{-| -}
auto : Property
auto =
    property "auto"


{-| -}
maxContent : Property
maxContent =
    property "max-content"


{-| -}
minContent : Property
minContent =
    property "min-content"


{-| -}
fitContent : LengthPercentage -> Property
fitContent value =
    property ("fit-content(" ++ LengthPercentage.toString value ++ ")")



-- GLOBAL


{-| Specifies that all the element's properties should be changed to their
inherited values.
-}
inherit : Property
inherit =
    property "inherit"


{-| Specifies that all the element's properties should be changed to their
initial values.
-}
initial : Property
initial =
    property "initial"


{-| Specifies behavior that depends on the stylesheet origin to which the
declaration belongs:

  - If the rule belongs to the author origin, the revert value rolls back the
    cascade to the user level, so that the specified values are calculated as if
    no author-level rules were specified for the element. For purposes of
    revert, the author origin includes the Override and Animation origins.
  - If the rule belongs to the user origin, the revert value rolls back the
    cascade to the user-agent level, so that the specified values are calculated
    as if no author-level or user-level rules were specified for the element.
  - If the rule belongs to the user-agent origin, the revert value acts like
    unset.

-}
revert : Property
revert =
    property "revert"


{-| Specifies that all the element's properties should roll back the cascade to
a previous cascade layer, if one exists. If no other cascade layer exists, the
element's properties will roll back to the matching rule, if one exists, in the
current layer or to a previous style origin.
-}
revertLayer : Property
revertLayer =
    property "revert-layer"


{-| Specifies that all the element's properties should be changed to their
inherited values if they inherit by default, or to their initial values if not.
-}
unset : Property
unset =
    property "unset"
