# Package

version     = "0.1.0"
author      = "Francis Thérien"
description = "Handle byte orders without a fiasco."
license     = "MIT"

# Deps

requires "nim >= 1.6.0"

# Tasks

task docs, "Generate API docs":
  exec "nim doc -o:docs --index:on --project bight.nim"
