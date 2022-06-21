module CSS exposing
    ( Variable, Class, ClassName, ExternalClass, Property, AtRule, Keyframe
    , class, className, externalClass
    )

{-|


# Definitions

@docs Variable, Class, ClassName, ExternalClass, Property, AtRule, Keyframe


# Methods

@docs class, className, externalClass

-}

import CSS.Internal as Internal



-- DEFINITIONS


{-| -}
type alias Variable =
    Internal.Variable


{-| -}
type alias Class =
    Internal.Class


{-| -}
type alias ClassName =
    Internal.ClassName


{-| -}
type alias ExternalClass =
    Internal.ExternalClass


{-| -}
type alias Property =
    Internal.Property


{-| -}
type alias AtRule =
    Internal.AtRule


{-| -}
type alias Keyframe =
    Internal.Keyframe



-- METHODS


{-| Start a new class definition.
-}
class : String -> List Property -> Class
class name properties =
    Internal.Class
        { name = name
        , properties = properties
        , pseudoClasses = []
        , pseudoElements = []
        , atRules = []
        }


{-| -}
className : String -> ClassName
className =
    Internal.ClassName


{-| Placeholder for a external class definition.
-}
externalClass : String -> ExternalClass
externalClass =
    Internal.ExternalClass
