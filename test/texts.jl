
@test_call drawtext!(CANVAS, (1,1), "So Long, and Thanks for All the Fish", Horizontal)
@test_opt drawtext!(CANVAS, (1,1), "So Long, and Thanks for All the Fish", Horizontal)

@test_call drawtextbox!(c, (5,5), "The Hitchhiker's Guide\nto the Galaxy", Horizontal, bs)
@test_opt drawtextbox!(c, (5,5), "The Hitchhiker's Guide\nto the Galaxy", Horizontal, bs)
