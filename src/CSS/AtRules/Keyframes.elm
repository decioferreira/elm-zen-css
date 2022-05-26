module CSS.AtRules.Keyframes exposing
    ( Name(..), Selector(..)
    , custom, fromTo, percentages
    )

{-| The @keyframes CSS at-rule controls the intermediate steps in a CSS
animation sequence by defining styles for keyframes (or waypoints) along the
animation sequence.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/@keyframes>


# @keyframes

@docs Name, Selector
@docs custom, fromTo, percentages

-}

import CSS.Internal exposing (Keyframe(..), Property)
import CSS.Types.Percentage as Percentage
import List.Nonempty as Nonempty exposing (Nonempty(..))


type Name
    = NameCustomIdent String
    | NameString String


nameToString : Name -> String
nameToString name =
    case name of
        NameCustomIdent value ->
            value

        NameString value ->
            "\"" ++ value ++ "\""


type Selector
    = From
    | To
    | Percentage Percentage.Percentage


selectorToString : Selector -> String
selectorToString selector =
    case selector of
        From ->
            "from"

        To ->
            "to"

        Percentage percentage ->
            Percentage.toString percentage


custom : Name -> Nonempty { selectors : Nonempty Selector, properties : List Property } -> Keyframe
custom name blocks =
    Keyframe
        { identifier = nameToString name
        , values =
            blocks
                |> Nonempty.toList
                |> List.map
                    (\block ->
                        { selector =
                            block.selectors
                                |> Nonempty.toList
                                |> List.map selectorToString
                                |> String.join ", "
                        , properties = block.properties
                        }
                    )
        }


fromTo : Name -> List Property -> List Property -> Keyframe
fromTo name from to =
    custom name
        (Nonempty { selectors = Nonempty.singleton From, properties = from }
            [ { selectors = Nonempty.singleton To, properties = to }
            ]
        )


percentages : Name -> Nonempty { percentages : Nonempty Percentage.Percentage, properties : List Property } -> Keyframe
percentages name blocks =
    custom name
        (Nonempty.map
            (\block ->
                { selectors = Nonempty.map Percentage block.percentages
                , properties = block.properties
                }
            )
            blocks
        )
