module CSS.Properties.Appearence exposing
    ( none, auto
    , menulistButton, textfield
    , button, checkbox, listbox, menulist, meter, progressBar, pushButton, radio, searchfield, sliderHorizontal, squareButton, textarea
    , inherit, initial, revert, revertLayer, unset
    )

{-| The appearance CSS property is used to control native appearance of UI controls, that are based
on operating system's theme.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/appearance>


# Values

@docs none, auto


# <compat-special>

@docs menulistButton, textfield


# <compat-auto>

@docs button, checkbox, listbox, menulist, meter, progressBar, pushButton, radio, searchfield, sliderHorizontal, squareButton, textarea


# Global values

@docs inherit, initial, revert, revertLayer, unset

-}

import CSS.Internal exposing (Property)
import CSS.Properties as Properties


property : String -> Property
property =
    Properties.custom "appearance"



-- VALUES


{-| Hides certain features of widgets, such as arrow displayed in select element, indicating that
list can be expanded.
-}
none : Property
none =
    property "none"


{-| The user agent selects the appropriate special styling based on the element. Acts as `none` on
elements with no special styling.
-}
auto : Property
auto =
    property "auto"



-- COMPAT-SPECIAL


{-| -}
menulistButton : Property
menulistButton =
    property "menulist-button"


{-| -}
textfield : Property
textfield =
    property "textfield"



-- COMPAT-AUTO


{-| -}
button : Property
button =
    property "button"


{-| -}
checkbox : Property
checkbox =
    property "checkbox"


{-| -}
listbox : Property
listbox =
    property "listbox"


{-| -}
menulist : Property
menulist =
    property "menulist"


{-| -}
meter : Property
meter =
    property "meter"


{-| -}
progressBar : Property
progressBar =
    property "progress-bar"


{-| -}
pushButton : Property
pushButton =
    property "push-button"


{-| -}
radio : Property
radio =
    property "radio"


{-| -}
searchfield : Property
searchfield =
    property "searchfield"


{-| -}
sliderHorizontal : Property
sliderHorizontal =
    property "slider-horizontal"


{-| -}
squareButton : Property
squareButton =
    property "square-button"


{-| -}
textarea : Property
textarea =
    property "textarea"



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
