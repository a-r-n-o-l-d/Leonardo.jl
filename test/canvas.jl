#module CanvasTest

using Leonardo: drawchar!, DEFAULT_PSTYLE

@test_call PrintStyle(; color = :red)
@test_opt PrintStyle(; color = :red)

#p = PrintStyle(; color = :red)
#@test_call Leonardo.charprint(stdout, 'a', p)
#@test_opt Leonardo.charprint(stdout, 'a', p)
#@test_opt printstyled(stdout, 'a')

@test_call Canvas(80, 20)
@test_opt Canvas(80, 20)

c = Canvas(80, 20)
@test_call reset!(c)
@test_opt reset!(c)

#@test_call print!(c, 'a', DEFAULT_PSTYLE, 1, 1)
#@test_opt print!(c, 'a', DEFAULT_PSTYLE, 1, 1)

@test_call drawchar!(c, (1, 1), 'a', DEFAULT_PSTYLE)
@test_opt drawchar!(c, (1, 1), 'a', DEFAULT_PSTYLE)

@test_call drawchar!(c, (1, 1), 'a', PrintStyle(color = :red))
@test_opt drawchar!(c, (1, 1), 'a', PrintStyle(color = :red))

#end
