
@test_call drawtext!(CANVAS1, (1,1), "So Long, and Thanks for All the Fish", Horizontal)
@test_opt drawtext!(CANVAS1, (1,1), "So Long, and Thanks for All the Fish", Horizontal)

bs = BoxStyle(LineStyle(Heavy))
@test_call drawtextbox!(CANVAS1, (5,5), "The Hitchhiker's Guide\nto the Galaxy", Horizontal, bs)
@test_opt drawtextbox!(CANVAS1, (5,5), "The Hitchhiker's Guide\nto the Galaxy", Horizontal, bs)

reset!(CANVAS1)
drawtext!(CANVAS1, (1,1), "So Long, and Thanks for All the Fish", Horizontal)
res = """
So Long, and Thanks for All the Fish............................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
"""
test_canvas_output(CANVAS1, res)

reset!(CANVAS1)
drawtextbox!(CANVAS1, (5,5), "The Hitchhiker's Guide\nto the Galaxy", Horizontal, bs)
res = """
................................................................................
................................................................................
................................................................................
................................................................................
....┎──────────────────────┒....................................................
....┃The Hitchhiker's Guide┃....................................................
....┃to the Galaxy.........┃....................................................
....┖──────────────────────┚....................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
"""
test_canvas_output(CANVAS1, res)

reset!(CANVAS1)
drawtext!(CANVAS1, (1,1), "Thanks for All", Vertical)
res = """
T...............................................................................
h...............................................................................
a...............................................................................
n...............................................................................
k...............................................................................
s...............................................................................
 ...............................................................................
f...............................................................................
o...............................................................................
r...............................................................................
 ...............................................................................
A...............................................................................
l...............................................................................
l...............................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
"""
test_canvas_output(CANVAS1, res)

reset!(CANVAS1)
drawtextbox!(CANVAS1, (1,1), "H2G2", Vertical, bs)
res = """
┎─┒.............................................................................
┃H┃.............................................................................
┃2┃.............................................................................
┃G┃.............................................................................
┃2┃.............................................................................
┖─┚.............................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
"""
test_canvas_output(CANVAS1, res)
