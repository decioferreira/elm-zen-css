module CSS.Properties.BackfaceVisibility exposing
    ( visible, hidden
    , inherit, initial, revert, revertLayer, unset
    )

{-| The backface-visibility CSS property sets whether the back face of an
element is visible when turned towards the user.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/backface-visibility>


# Keyword values

@docs visible, hidden


# Global values

@docs inherit, initial, revert, revertLayer, unset

-}

import CSS.Internal exposing (CSS)
import CSS.Properties as Properties


property : String -> CSS -> CSS
property =
    Properties.custom "backface-visibility"



-- KEYWORD VALUES


{-| The back face is visible when turned towards the user.
-}
visible : CSS -> CSS
visible =
    property "visible"


{-| The back face is hidden, effectively making the element invisible when
turned away from the user.
-}
hidden : CSS -> CSS
hidden =
    property "hidden"



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
