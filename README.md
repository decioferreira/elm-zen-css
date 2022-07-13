# Elm Zen CSS

`elm-zen-css` allows you to define CSS in elm.

It achieves this by exporting both a `.css` file, as well as an `.elm` file that contains a trimmed
down version of the CSS definitions, where only the class names are kept.

Here is a simple example of the result of running
(find a more complete example on the [example directory](example)):

```
elm-zen-css stylesheet/Main.elm --watch --css app.css --elm src/Classes.elm
```

When the content of the `stylesheet/Main.elm` is the following:

```elm
module Main exposing ( strong )

import CSS exposing (Class)
import CSS.Properties as Properties


strong : Class
strong =
    CSS.class "strong"
        [ Properties.custom "font-weight" "bold"
        ]
```

The result will be the following two files, `app.css`:

```css
.strong {font-weight: bold}
```

And `src/Classes.elm`:

```elm
module Classes exposing (strong)

import CSS


strong : CSS.ClassName
strong  =
    CSS.className "strong"
```

This last file (ie. `Classes` module), can then the used in the following way:

```elm
module Main exposing (main)

import CSS.Attributes
import Classes
import Html


main =
  Html.div [ CSS.Attributes.class Classes.strong ] 
    [ Html.text "Hello!"
    ]
```

In addition to this, you can install [`elm-review-zen-css`](https://package.elm-lang.org/packages/decioferreira/elm-review-zen-css/latest/)
to add [`elm-review`](https://package.elm-lang.org/packages/jfmengels/elm-review/latest/)
rules that will support the use of `elm-zen-css`.

It is also encouraged that the `.css` and `.elm` generated files are added to `.gitignore`.

## Installation

```bash
npm install elm-zen-css
```

## Usage

```
% elm-zen-css --help
Usage: cli [options] <stylesheet-elm-file>

Elm Zen CSS

Arguments:
  stylesheet-elm-file       watch file changes

Options:
  -c, --css <css-file>      output CSS file
  -e, --elm <elm-file>      output production version file
  -w, --watch               watch file changes
  -j, --elmjson <elm-json>  use a custom elm-json file
  -h, --help                display help for command
```

## Example

Find more details on the [example directory](example).

# Development

Start by installing the project dependencies:

```
yarn
```