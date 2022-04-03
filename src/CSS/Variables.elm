module CSS.Variables exposing (Variable, variable, var)

{-|


# Variables

@docs Variable, variable, var

-}

import CSS.Variables.Internal as Internal


type alias Variable =
    Internal.Variable


variable : String -> String -> Variable
variable =
    Internal.Variable


var : Variable -> String
var (Internal.Variable name _) =
    "var(--" ++ name ++ ")"
