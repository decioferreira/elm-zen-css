module CSS.Types.Url exposing (Url(..), toString)

{-| The url() CSS function is used to include a file. The parameter is an absolute URL, a relative
URL, a blob URL, or a data URL. The url() function can be passed as a parameter of another CSS
functions, like the attr() function. Depending on the property for which it is a value, the resource
sought can be an image, font, or a stylesheet. The url() functional notation is the value for the
<url> data type.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/url>

@docs Url, toString

-}


{-| <percentage> data type.
-}
type Url
    = Url String


{-| -}
toString : Url -> String
toString (Url value) =
    "url(" ++ value ++ ")"
