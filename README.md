# Elm CSS

## Temporary scripts

**These are just WIP tests of how the final library should work.**

There are currently 5 scripts available. Here is a description of their responsability:
1. this initial script is responsible for transpiling the Elm converter code into JavaScript
2. this script uses the result of the initial script to add the required code to
   use the `CSS.toString` on the initial code
3. this script converts the previous elm code into JavaScript
4. this script runs the previous JavaScript code and writes its result to a CSS file
5. this script uses the initial script, to convert the Elm code into a production
   version, where we only reference the classNames, since we don't need to have
   any other extra information - which should only be required for the CSS file

The initial script `script1.js`, which should at some point be moved into the
`prepublish` npm script, so that we have its result available on the published
npm package from the start.