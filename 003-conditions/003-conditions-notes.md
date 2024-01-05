# Conditions

## If statements

When checking if a var or const is empty, the best method to check it is with the `isEmpty` check. For example:

``` swift
var myString = "Hello world!"

if myString.isEmpty { // isEmpty is a boolean so no need to compare it with == true
    myString = "I was empty but now I'm not!"
}
```

## Logical Operators

&& = And
|| = Or

## Switch Statements

Switch statements can be used as an alternative to an if statement where it makes sense to do so. For example, check is Metropolis is in the switch and if not, print the default value:

``` swift
let place = "Metropolis"

switch place {
case "Gotham":
    print("You're Batman!")
case "Mega-City One":
    print("You're Judge Dredd!")
case "Wakanda":
    print("You're Black Panther!")
default:
    print("Who are you?")
} // Prints Who are you?

print(place) // Prints Metropolis
```

NOTE: The default value must be at the end of the switch.

There are three reasons why you might want to consider using switch rather than if:

1. Swift requires that its switch statements are exhaustive, which means you must either have a case block for every possible value to check (e.g. all cases of an enum) or you must have a default case. This isn’t true for if and else if, so you might accidentally miss a case.
2. When you use switch to check a value for multiple possible results, that value will only be read once, whereas if you use if it will be read multiple times. This becomes more important when you start using function calls, because some of these can be slow.
3. Swift’s switch cases allow for advanced pattern matching that is unwieldy with if.
