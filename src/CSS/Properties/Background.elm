module CSS.Properties.Background exposing
    ( background
    , inherit, initial, revert, revertLayer, unset
    , BackgroundLayer, FinalBackgroundLayer, BackgroundPosition, OriginAndClip(..), Box(..)
    )

{-| The `background` shorthand CSS property sets all background style properties at once, such as
color, image, origin and size, or repeat method.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/background>

@docs background


# Global values

@docs inherit, initial, revert, revertLayer, unset


# Types

@docs BackgroundLayer, FinalBackgroundLayer, BackgroundPosition, OriginAndClip, Box

-}

import CSS.Internal exposing (Property)
import CSS.Properties as Properties
import CSS.Properties.Background.Attachment as Attachment exposing (Attachment)
import CSS.Properties.Background.Image as Image exposing (Image)
import CSS.Properties.Background.Repeat as Repeat exposing (RepeatStyle)
import CSS.Properties.Background.Size as Size exposing (Size)
import CSS.Types.Color as Color exposing (Color)
import CSS.Types.Position as Position exposing (Position)


property : String -> Property
property =
    Properties.custom "background"


{-| -}
type alias BackgroundLayer =
    { backgroundImage : Maybe Image
    , backgroundPosition : Maybe BackgroundPosition
    , repeatStyle : Maybe RepeatStyle
    , attachment : Maybe Attachment
    , originAndClip : Maybe OriginAndClip
    }


backgroundLayerToString : BackgroundLayer -> String
backgroundLayerToString backgroundLayer =
    [ Maybe.map Image.toString backgroundLayer.backgroundImage
    , Maybe.map backgroundPositionToString backgroundLayer.backgroundPosition
    , Maybe.map Repeat.toString backgroundLayer.repeatStyle
    , Maybe.map Attachment.toString backgroundLayer.attachment
    , Maybe.map originAndClipToString backgroundLayer.originAndClip
    ]
        |> List.filterMap identity
        |> String.join " "


{-| -}
type alias FinalBackgroundLayer =
    { backgroundColor : Maybe Color
    , backgroundImage : Maybe Image
    , backgroundPosition : Maybe BackgroundPosition
    , repeatStyle : Maybe RepeatStyle
    , attachment : Maybe Attachment
    , originAndClip : Maybe OriginAndClip
    }


finalBackgroundLayerToString : FinalBackgroundLayer -> String
finalBackgroundLayerToString finalBackgroundLayer =
    [ Maybe.map Color.toString finalBackgroundLayer.backgroundColor
    , Maybe.map Image.toString finalBackgroundLayer.backgroundImage
    , Maybe.map backgroundPositionToString finalBackgroundLayer.backgroundPosition
    , Maybe.map Repeat.toString finalBackgroundLayer.repeatStyle
    , Maybe.map Attachment.toString finalBackgroundLayer.attachment
    , Maybe.map originAndClipToString finalBackgroundLayer.originAndClip
    ]
        |> List.filterMap identity
        |> String.join " "


{-| -}
type alias BackgroundPosition =
    { position : Position
    , size : Maybe Size
    }


backgroundPositionToString : BackgroundPosition -> String
backgroundPositionToString backgroundPosition =
    Position.toString backgroundPosition.position
        ++ (backgroundPosition.size
                |> Maybe.map (\size -> "/" ++ Size.toString size)
                |> Maybe.withDefault ""
           )


{-| -}
type OriginAndClip
    = OriginAndClip Box
    | DistinctOriginAndClip { origin : Box, clip : Box }


originAndClipToString : OriginAndClip -> String
originAndClipToString originAndClip =
    case originAndClip of
        OriginAndClip box ->
            boxToString box

        DistinctOriginAndClip { origin, clip } ->
            boxToString origin ++ " " ++ boxToString clip


{-| -}
type Box
    = BorderBox
    | PaddingBox
    | ContentBox


boxToString : Box -> String
boxToString box =
    case box of
        BorderBox ->
            "border-box"

        PaddingBox ->
            "padding-box"

        ContentBox ->
            "content-box"


{-| -}
background : List BackgroundLayer -> FinalBackgroundLayer -> Property
background backgroundLayers finalBackgroundLayer =
    List.map backgroundLayerToString backgroundLayers
        ++ [ finalBackgroundLayerToString finalBackgroundLayer ]
        |> String.join ", "
        |> property



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
