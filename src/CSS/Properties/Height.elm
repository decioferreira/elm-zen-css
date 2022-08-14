module CSS.Properties.Height exposing
    ( length, percentage, auto, maxContent, minContent, fitContent
    , inherit, initial, revert, revertLayer, unset
    )

{-| The `height` CSS property specifies the height of an element. By default, the property defines
the height of the content area. If box-sizing is set to border-box, however, it instead determines
the height of the border area.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/height>


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
    Properties.custom "width"



-- VALUES


{-| Defines the height as an absolute value.
-}
length : Length -> Property
length value =
    property (Length.toString value)


{-| Defines the height as a percentage of the containing block's height.
-}
percentage : Percentage -> Property
percentage value =
    property (Percentage.toString value)


{-| The browser will calculate and select a height for the specified element.
-}
auto : Property
auto =
    property "auto"


{-| The intrinsic preferred height.
-}
maxContent : Property
maxContent =
    property "max-content"


{-| The intrinsic minimum height.
-}
minContent : Property
minContent =
    property "min-content"


{-| Uses the fit-content formula with the available space replaced by the specified argument, i.e.
`min(max-content, max(min-content, <length-percentage>))`
-}
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
