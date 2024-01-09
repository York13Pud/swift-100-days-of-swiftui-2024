# Functions

## Function Notes

Don't go crazy with the number of parameters you use on a function. If it is six or more, perhaps you should look at refactoring the function into smaller functions or using something like a dictionary to group the arguments to pass to a function.

When specifying a return for a function, you must declare what the return data type will be using `-> datatype`. For example, return an `Int`:

``` swift
func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)
```

Important: When you say your function will return an Int, Swift will make sure it always returns an Int – you can’t forget to send back a value, because your code won’t build.

## Dictionary vs. Tuple

1. When you access values in a dictionary, Swift can’t know ahead of time whether they are present or not. Yes, we knew that user["firstName"] was going to be there, but Swift can’t be sure and so we need to provide a default value.
2. When you access values in a tuple, Swift does know ahead of time that it is available because the tuple says it will be available.
3. We access values using user.firstName: it’s not a string, so there’s also no chance of typos.
4. Our dictionary might contain hundreds of other values alongside "firstName", but our tuple can’t – we must list all the values it will contain, and as a result it’s guaranteed to contain them all and nothing else.

## When should you use an array, a set, or a tuple in Swift?

- If you want to store a list of all words in a dictionary for a game, that has no duplicates and the order doesn’t matter so you would go for a set.
- If you want to store all the articles read by a user, you would use a set if the order didn’t matter (if all you cared about was whether they had read it or not), or use an array if the order did matter.
- If you want to store a list of high scores for a video game, that has an order that matters and might contain duplicates (if two players get the same score), so you’d use an array.
- If you want to store items for a todo list, that works best when the order is predictable so you should use an array.
- If you want to hold precisely two strings, or precisely two strings and an integer, or precisely three Booleans, or similar, you should use a tuple.

## Label Names

You can use another name for a parameter outside of the function to make it easier to understand what the parameter is. There are three options for this:

1. You don't define anything, other than the parameter name. This will just use the parameter name you defined. For example `func MyFunc(name: String) { }`.
2. You use an `_` before the parameter name. This essentially does the same thing as the label will be the same as the parameter name. For example `func MyFunc(name: String) { }`.
3. Use a name that is meaningful before the parameter name. For example `func MyFunc(upto count: Int) { }`.

