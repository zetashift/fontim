# To run these tests, simply execute `nimble test`.
import unittest, options
import fontim

test "finds Noto Regular":
  assert getFontPath("NotoSans") == some("/usr/share/fonts/truetype/noto/NotoSans-Regular.ttf")

test "find IBM Plex Mono Bold":
  # This test only actually works if the font is installed on the system!
  assert getFontPath(name = "IBMPlex Mono", slant="-Bold") == some("/usr/share/fonts/truetype/ibm-plex/IBMPlexMono-Bold.ttf")
