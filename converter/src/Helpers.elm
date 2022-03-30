module Helpers exposing (ProdData, node)

import Elm.Syntax.Node exposing (Node(..))


type alias ProdData =
    { name : List String
    , src : String
    }


node : a -> Node a
node =
    Node
        { end = { column = 0, row = 0 }
        , start = { column = 0, row = 0 }
        }
