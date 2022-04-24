module CSS.Properties.AspectRatio exposing
    ( auto, ratio
    , inherit, initial, revert, revertLayer, unset
    )

{-| The aspect-ratio CSS property sets a preferred aspect ratio for the box,
which will be used in the calculation of auto sizes and some other layout
functions.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/aspect-ratio>


# Values

@docs auto, ratio


# Global values

@docs inherit, initial, revert, revertLayer, unset

-}

import CSS.Internal exposing (CSS)
import CSS.Properties as Properties


property : String -> CSS -> CSS
property =
    Properties.custom "aspect-ratio"



-- VALUES


{-| Replaced elements with an intrinsic aspect ratio use that aspect ratio,
otherwise the box has no preferred aspect ratio. Size calculations involving
intrinsic aspect ratio always work with the content box dimensions.
-}
auto : CSS -> CSS
auto =
    property "auto"


{-| The box's preferred aspect ratio is the specified ratio of width / height.
If height and the preceding slash character are omitted, height defaults to 1.
Size calculations involving preferred aspect ratio work with the dimensions of
the box specified by box-sizing.
-}
ratio : Float -> CSS -> CSS
ratio value =
    property (String.fromFloat value)



-- GLOBAL


{-| Specifies that all the element's properties should be changed to their
inherited values.
-}
inherit : CSS -> CSS
inherit =
    property "inherit"


{-| Specifies that all the element's properties should be changed to their
initial values.
-}
initial : CSS -> CSS
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
revert : CSS -> CSS
revert =
    property "revert"


{-| Specifies that all the element's properties should roll back the cascade to
a previous cascade layer, if one exists. If no other cascade layer exists, the
element's properties will roll back to the matching rule, if one exists, in the
current layer or to a previous style origin.
-}
revertLayer : CSS -> CSS
revertLayer =
    property "revert-layer"


{-| Specifies that all the element's properties should be changed to their
inherited values if they inherit by default, or to their initial values if not.
-}
unset : CSS -> CSS
unset =
    property "unset"
