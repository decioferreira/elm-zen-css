module CSS.AtRules exposing (custom, media)

{-| At-rules are CSS statements that instruct CSS how to behave.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/At-rule>


# At-rules

@docs custom, media

-}

import CSS.Internal exposing (CSS(..))


{-| -}
custom : String -> String -> (CSS -> CSS) -> CSS -> CSS
custom identifier rule value (CSS details) =
    CSS { details | atRules = ( identifier, rule, value ) :: details.atRules }


{-| The @media CSS at-rule can be used to apply part of a style sheet based on
the result of one or more media queries.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/@media>

-}
media : String -> (CSS -> CSS) -> CSS -> CSS
media =
    custom "media"
