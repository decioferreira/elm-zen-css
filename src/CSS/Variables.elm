module CSS.Variables exposing (variable, var)

{-|


# Variables

@docs variable, var

-}

import CSS.Internal as Internal


{-| -}
variable : String -> String -> Internal.Variable
variable =
    Internal.Variable


{-| -}
var : Internal.Variable -> String
var (Internal.Variable name _) =
    "var(--" ++ name ++ ")"
