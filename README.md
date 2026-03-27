# Towel Day Countdown
This repository demonstrates a simple Go program and how to package it for Debian. 

## Code
A simple [Go program](main.go) to calculate the number of days till the next [Towel Day](https://en.wikipedia.org/wiki/Towel_Day)

A [Makefile](Makefile) to build a debian package from this.

See ``make help`` for how to do this


## Slides
Slides were written using markdown & can be viewed using [marp](https://marp.app/)

```
marp -w  -s ./slides/
```
PDF version also available [here](./slides/app-packaging.pdf)

### Convert slides to pdf
```
marp --pdf --allow-local-files ./slides/app-packaging.md
```
