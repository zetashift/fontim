# To run these tests, simply execute `nimble test`.
import unittest, options
import fontim

test "finds Noto Regular":
  assert getFontPath("Noto") == some("/usr/share/fonts/truetype/noto/NotoSans-Regular.ttf")

test "find IBM Plex Mono Bold":
  assert getFontPath(name = "IBMPlex", slant= "Mono", suffix="-Bold") == some("/usr/share/fonts/truetype/ibm-plex/IBMPlexMono-Bold.ttf")
