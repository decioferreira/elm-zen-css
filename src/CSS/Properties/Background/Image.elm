module CSS.Properties.Background.Image exposing
    ( multiple
    , inherit, initial, revert, revertLayer, unset
    , Image(..), toString
    , AngleOrSideOrCorner(..), SideOrCorner(..)
    , ColorStopList, LinearColorStop
    , EndingShapeSize(..), EndingShape(..), Size(..)
    )

{-| The `background-image` CSS property sets one or more background images on an element.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/background-image>


# Multiple backgrounds

@docs multiple


# Global values

@docs inherit, initial, revert, revertLayer, unset


# Types

@docs Image, toString
@docs AngleOrSideOrCorner, SideOrCorner
@docs ColorStopList, LinearColorStop
@docs EndingShapeSize, EndingShape, Size

-}

import CSS.Internal exposing (Property)
import CSS.Properties as Properties
import CSS.Types.Angle
import CSS.Types.Color as Color exposing (Color)
import CSS.Types.Length as Length exposing (Length)
import CSS.Types.LengthPercentage as LengthPercentage exposing (LengthPercentage)
import CSS.Types.Position as Position exposing (Position)
import CSS.Types.Url
import List.Nonempty exposing (Nonempty)
import Maybe.Extra as Maybe


property : String -> Property
property =
    Properties.custom "background-image"


{-| -}
type Image
    = None
    | Url CSS.Types.Url.Url
    | LinearGradient (Maybe AngleOrSideOrCorner) ColorStopList
    | RepeatingLinearGradient (Maybe AngleOrSideOrCorner) ColorStopList
    | RadialGradient (Maybe EndingShapeSize) (Maybe Position) ColorStopList
    | RepeatingRadialGradient (Maybe EndingShapeSize) (Maybe Position) ColorStopList


{-| -}
type EndingShapeSize
    = OnlyEndingShape EndingShape
    | OnlySize Size
    | BothEndingShapeAndSize EndingShape Size


endingShapeSizeToString : EndingShapeSize -> String
endingShapeSizeToString endingShapeSize =
    case endingShapeSize of
        OnlyEndingShape endingShape ->
            endingShapeToString endingShape

        OnlySize size ->
            sizeToString size

        BothEndingShapeAndSize endingShape size ->
            endingShapeToString endingShape ++ " " ++ sizeToString size


{-| The gradient's ending-shape. The value can be circle (meaning that the gradient's shape is a
circle with a constant radius) or ellipse (meaning that the shape is an axis-aligned ellipse).
If unspecified, it defaults to ellipse.
-}
type EndingShape
    = Circle Size
    | CircleWithRadius Length
    | Ellipse Size
    | EllipseWithRadius
        { horizontalRadius : LengthPercentage
        , verticalRadius : LengthPercentage
        }


endingShapeToString : EndingShape -> String
endingShapeToString endingShape =
    case endingShape of
        Circle size ->
            "circle " ++ sizeToString size

        CircleWithRadius length ->
            "circle " ++ Length.toString length

        Ellipse size ->
            "ellipse " ++ sizeToString size

        EllipseWithRadius { horizontalRadius, verticalRadius } ->
            "ellipse " ++ LengthPercentage.toString horizontalRadius ++ " " ++ LengthPercentage.toString verticalRadius


{-| -}
type Size
    = ClosestSide
    | ClosestCorner
    | FarthestSide
    | FarthestCorner


sizeToString : Size -> String
sizeToString size =
    case size of
        ClosestSide ->
            "closest-side"

        ClosestCorner ->
            "closest-corner"

        FarthestSide ->
            "farthest-side"

        FarthestCorner ->
            "farthest-corner"


{-| -}
type AngleOrSideOrCorner
    = Angle CSS.Types.Angle.Angle
    | SideOrCorner SideOrCorner


angleOrSideOrCornerToString : AngleOrSideOrCorner -> String
angleOrSideOrCornerToString angleOrSideOrCorner =
    case angleOrSideOrCorner of
        Angle angle ->
            CSS.Types.Angle.toString angle

        SideOrCorner sideOrCorner ->
            "to " ++ sideOrCornerToString sideOrCorner


type SideOrCorner
    = LeftTop
    | CenterTop
    | RightTop
    | LeftCenter
    | Center
    | RightCenter
    | LeftBottom
    | CenterBottom
    | RightBottom


sideOrCornerToString : SideOrCorner -> String
sideOrCornerToString sideOrCorner =
    case sideOrCorner of
        LeftTop ->
            "left top"

        CenterTop ->
            "top"

        RightTop ->
            "right top"

        LeftCenter ->
            "left"

        Center ->
            "center"

        RightCenter ->
            "right"

        LeftBottom ->
            "left bottom"

        CenterBottom ->
            "bottom"

        RightBottom ->
            "right bottom"


{-| -}
type alias ColorStopList =
    { first : LinearColorStop
    , rest :
        Nonempty
            { linearColorHint : Maybe LengthPercentage
            , linearColorStop : LinearColorStop
            }
    }


colorStopListToString : ColorStopList -> String
colorStopListToString colorStopList =
    linearColorStopToString colorStopList.first
        ++ (colorStopList.rest
                |> List.Nonempty.toList
                |> List.map
                    (\item ->
                        (item.linearColorHint
                            |> Maybe.map
                                (\linearColorHint ->
                                    LengthPercentage.toString linearColorHint ++ ", "
                                )
                            |> Maybe.withDefault ""
                        )
                            ++ linearColorStopToString item.linearColorStop
                    )
                |> String.join ", "
           )


{-| -}
type alias LinearColorStop =
    { color : Color
    , lengthPercentage : Maybe LengthPercentage
    }


linearColorStopToString : LinearColorStop -> String
linearColorStopToString linearColorStop =
    Color.toString linearColorStop.color
        ++ (linearColorStop.lengthPercentage
                |> Maybe.map
                    (\lengthPercentage ->
                        ", " ++ LengthPercentage.toString lengthPercentage
                    )
                |> Maybe.withDefault ""
           )


toString : Image -> String
toString image =
    case image of
        None ->
            "none"

        Url url ->
            CSS.Types.Url.toString url

        LinearGradient maybeAngleOrSideOrCorner colorStopList ->
            "linear-gradient("
                ++ (maybeAngleOrSideOrCorner
                        |> Maybe.map
                            (\angleOrSideOrCorner ->
                                angleOrSideOrCornerToString angleOrSideOrCorner ++ ", "
                            )
                        |> Maybe.withDefault ""
                   )
                ++ colorStopListToString colorStopList
                ++ ")"

        RepeatingLinearGradient maybeAngleOrSideOrCorner colorStopList ->
            "repeating-linear-gradient("
                ++ (maybeAngleOrSideOrCorner
                        |> Maybe.map
                            (\angleOrSideOrCorner ->
                                angleOrSideOrCornerToString angleOrSideOrCorner ++ ", "
                            )
                        |> Maybe.withDefault ""
                   )
                ++ colorStopListToString colorStopList
                ++ ")"

        RadialGradient maybeEndingShapeSize maybePosition colorStopList ->
            "radial-gradient("
                ++ (maybeEndingShapeSize
                        |> Maybe.map endingShapeSizeToString
                        |> Maybe.withDefault ""
                   )
                ++ (Maybe.map2 (\_ _ -> " ") maybeEndingShapeSize maybePosition
                        |> Maybe.withDefault ""
                   )
                ++ (maybePosition
                        |> Maybe.map
                            (\position ->
                                "at " ++ Position.toString position
                            )
                        |> Maybe.withDefault ""
                   )
                ++ (Maybe.or
                        (Maybe.map (\_ -> ()) maybeEndingShapeSize)
                        (Maybe.map (\_ -> ()) maybePosition)
                        |> Maybe.map (\_ -> ", ")
                        |> Maybe.withDefault ""
                   )
                ++ colorStopListToString colorStopList
                ++ ")"

        RepeatingRadialGradient maybeEndingShapeSize maybePosition colorStopList ->
            "repeating-linear-gradient("
                ++ (maybeEndingShapeSize
                        |> Maybe.map endingShapeSizeToString
                        |> Maybe.withDefault ""
                   )
                ++ (Maybe.map2 (\_ _ -> " ") maybeEndingShapeSize maybePosition
                        |> Maybe.withDefault ""
                   )
                ++ (maybePosition
                        |> Maybe.map
                            (\position ->
                                "at " ++ Position.toString position
                            )
                        |> Maybe.withDefault ""
                   )
                ++ (Maybe.or
                        (Maybe.map (\_ -> ()) maybeEndingShapeSize)
                        (Maybe.map (\_ -> ()) maybePosition)
                        |> Maybe.map (\_ -> ", ")
                        |> Maybe.withDefault ""
                   )
                ++ colorStopListToString colorStopList
                ++ ")"



-- MULTIPLE VALUES


{-| Multiple backgrounds
-}
multiple : Nonempty Image -> Property
multiple =
    List.Nonempty.toList
        >> List.map toString
        >> String.join ", "
        >> property



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
