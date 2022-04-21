module CSS.Properties.All exposing (inherit, initial, revert, revertLayer, unset)

{-| The all shorthand CSS property resets all of an element's properties except
unicode-bidi, direction, and CSS Custom Properties. It can set properties to
their initial or inherited values, or to the values specified in another cascade
layer or stylesheet origin.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/all>


# Global values

@docs inherit, initial, revert, revertLayer, unset

-}

import CSS.Internal exposing (CSS)
import CSS.Properties as Properties


property : String -> CSS -> CSS
property =
    Properties.custom "all"



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
