# Closures

## Copying Functions

Take the following for example:

``` swift
func myFunc() {
    print("hello world!")
}
myFunc()
```

If you want to make a copy of that function into a variable, you can do the following:

``` swift
myFuncCopy = myFunc
```

There are no `()` when copying a function. If you did add them, it would just run the function and assign a return value to `myFuncCopy`

## What Are Closures?

