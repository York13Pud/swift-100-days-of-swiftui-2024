# Day 1 Notes

## Variables And Constants

### General Notes

Where possible, use constants instead of variables. The main reasons are:

- Better performance.
- Less memory used.
- Less prone to making an error due to changing a value as you can't with constants.

Also, if a variable is created and its value never changes, XCode will recommend to you that is should be changed to a const.

### Naming Vars And Consts

When naming vars and const that contain multiple words, use camelCase. For example:

``` swift
var myVarName = "potato"

// or

let myConstName = "potato"
```

### Strings

All strings are case sensitive.

When typing double quotes in a string, use `\` to escape them to signal that they don't end the string. For example:

``` swift
let textString = "They said \"Hello\" to Fred."
```

When creating multi-line strings, the `"""` quotes must be on their own lines. For example:

``` swift
let multilineExanple = """
This is an
example of a multi-line string
"""
```
