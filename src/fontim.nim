import std/[os, strutils, strformat, options]
## Get the locations(paths) of a given `font` in a string

func getFontsDir(): seq[string] =
  # Returns the default system font paths
  when defined(windows):
    # TODO use winim to get Windows installation location
    result = @[r"C:\Windows\Fonts\"]
  elif defined(macosx):
    result = @[r"/Library/Fonts"]
  elif defined(linux):
    # Might also be possible to leverage libfontconfig here
    result = @[
    "/usr/share/fonts/truetype/",
    "/usr/share/fonts/TTF/",
    "/usr/share/fonts/"
    ]

proc getFontPath*(name: string, slant = "Sans", suffix = "-Regular"): Option[string] =
  ## Returns the path of a given font with `name`, `slant` and `suffix`

  let parsedSuffix = if suffix.startsWith('-'): suffix else: &"-{suffix}" # Be a bit more gentle with the `suffix` delimiter
  let fontName = toLowerAscii &"{name}{slant}{parsedSuffix}.ttf"

  for dir in getFontsDir():
    # Iterate over all the files in the font directories
    for filePath in dir.walkDirRec:
      # Check if the filename matches, if so we found our font file!
      if filePath.extractFilename.toLowerAscii == fontName: 
        return some(filePath)

  # In case we didn't find anything
  result = none[string]()

