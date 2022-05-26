module CSS.AtRules exposing (media)

{-| At-rules are CSS statements that instruct CSS how to behave.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/At-rule>


# At-rules

@docs media

-}

import CSS.Internal exposing (AtRule(..), Class(..), Property)


{-| The @media CSS at-rule can be used to apply part of a style sheet based on
the result of one or more media queries.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/@media>

-}
media : String -> List Property -> Class -> Class
media rule properties (Class details) =
    Class { details | atRules = AtRuleMedia { rule = rule, properties = properties } :: details.atRules }
