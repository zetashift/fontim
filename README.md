# Fontim

A simple helper for getting the paths of `TTF` files using Nim.

Given a certain font, like `Noto` get the system path of it:

The main procedure we'll be using:

```nim
proc getFontPath*(name: string, slant = "Sans", suffix = "-Regular"): Option[string] =
```

For example for NotoSans-Regular:
```nim
getFontPath("Noto")
```

Or for Libera Mono Bold:

```nim
getFontPath(name = "Libera", slant = "Mono", suffix = "-Bold")
```

