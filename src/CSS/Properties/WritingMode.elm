module CSS.Properties.WritingMode exposing
    ( horizontalTb, verticalRl, verticalLr, sidewaysRl, sidewaysLr
    , inherit, initial, revert, revertLayer, unset
    )

{-| The appearance CSS property is used to control native appearance of UI controls, that are based
on operating system's theme.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/writing-mode>


# Values

@docs horizontalTb, verticalRl, verticalLr, sidewaysRl, sidewaysLr


# Global values

@docs inherit, initial, revert, revertLayer, unset

-}

import CSS.Internal exposing (Property)
import CSS.Properties as Properties


property : String -> Property
property =
    Properties.custom "writing-mode"



-- VALUES


{-| For `ltr` scripts, content flows horizontally from left to right. For `rtl` scripts, content
flows horizontally from right to left. The next horizontal line is positioned below the previous
line.
-}
horizontalTb : Property
horizontalTb =
    property "horizontal-tb"


{-| For `ltr` scripts, content flows vertically from top to bottom, and the next vertical line is
positioned to the left of the previous line. For `rtl` scripts, content flows vertically from bottom
to top, and the next vertical line is positioned to the right of the previous line.
-}
verticalRl : Property
verticalRl =
    property "vertical-rl"


{-| For `ltr` scripts, content flows vertically from top to bottom, and the next vertical line is
positioned to the right of the previous line. For `rtl` scripts, content flows vertically from
bottom to top, and the next vertical line is positioned to the left of the previous line.
-}
verticalLr : Property
verticalLr =
    property "vertical-lr"


{-| For `ltr` scripts, content flows vertically from bottom to top. For `rtl` scripts, content flows
vertically from top to bottom. All the glyphs, even those in vertical scripts, are set sideways
toward the right.
-}
sidewaysRl : Property
sidewaysRl =
    property "sideways-rl"


{-| For `ltr` scripts, content flows vertically from top to bottom. For `rtl` scripts, content flows
vertically from bottom to top. All the glyphs, even those in vertical scripts, are set sideways
toward the left.
-}
sidewaysLr : Property
sidewaysLr =
    property "sideways-lr"



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
