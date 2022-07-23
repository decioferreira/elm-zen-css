module CSS exposing
    ( Variable, Class, ClassName, Property, AtRule, Keyframe
    , class, className
    )

{-|


# Definitions

@docs Variable, Class, ClassName, Property, AtRule, Keyframe


# Methods

@docs class, className

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


{-| Function that allows for a definition of the classname, without its associated definition.
This is used as part of the "exported" module used in the production code.

This can also be used, directly in the production code, as a placeholder for a external class
definition.

-}
className : String -> ClassName
className =
    Internal.ClassName
