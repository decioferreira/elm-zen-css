module CSS.Properties.BoxDecorationBreak exposing
    ( slice, clone
    , inherit, initial, revert, revertLayer, unset
    )

{-| The box-decoration-break CSS property specifies how an element's fragments
should be rendered when broken across multiple lines, columns, or pages.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/box-decoration-break>


# Keyword values

@docs slice, clone


# Global values

@docs inherit, initial, revert, revertLayer, unset

-}

import CSS.Internal exposing (CSS)
import CSS.Properties as Properties


property : String -> CSS -> CSS
property =
    Properties.custom "box-decoration-break"



-- KEYWORD VALUES


{-| The element is initially rendered as if its box were not fragmented, after
which the rendering for this hypothetical box is sliced into pieces for each
line/column/page. Note that the hypothetical box can be different for each
fragment since it uses its own height if the break occurs in the inline
direction, and its own width if the break occurs in the block direction. See the
CSS specification for details.
-}
slice : CSS -> CSS
slice =
    property "slice"


{-| Each box fragment is rendered independently with the specified border,
padding, and margin wrapping each fragment. The border-radius, border-image, and
box-shadow are applied to each fragment independently. The background is also
drawn independently for each fragment, which means that a background image with
background-repeat: no-repeat may nevertheless repeat multiple times.
-}
clone : CSS -> CSS
clone =
    property "clone"



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
