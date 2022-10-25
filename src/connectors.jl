"""
    ConnectorStyle(left, up, right, down)

Type defining a connector character. `left`, `up`, `right` and `down` are line styles
surrounding the connector.

See [`biconnector`](@ref), [`triconnector`](@ref) and [`quadriconnector`](@ref) for easy
creation.
"""
struct ConnectorStyle{L,U,R,D} end

function ConnectorStyle(::Type{L}, ::Type{U}, ::Type{R}, ::Type{D}) where {L,U,R,D}
    ConnectorStyle{L,U,R,D}
end

"""
    drawconnector!(canvas, (x,y), cstyle, [prstyle = defstyle(canvas)])

Draw a connector at location `(x,y)`, with a connector style `cstyle`.

See [`biconnector`](@ref), [`triconnector`](@ref) and [`quadriconnector`](@ref) for usage
examples.
"""
function drawconnector!(canvas, P, ::Type{ConnectorStyle{L,U,R,D}},
                        prstyle = defstyle(canvas)) where {SL,TL,L<:LineStyle{SL,TL},
                                                           SU,TU,U<:LineStyle{SU,TU},
                                                           SR,TR,R<:LineStyle{SR,TR},
                                                           SD,TD,D<:LineStyle{SD,TD}}
    drawchar!(canvas, P, char(SL, SU, SR, SD), prstyle)
end

"""
    biconnector(ldir1, lstyle1, ldir2, lstyle2)

Create a `ConnectorStyle` between two lines with line styles `lstyle1` and `lstyle2`
and with positions `ldir1` and `ldir2`.

# Example

```julia-repl
julia> c = Canvas(10, 1);

julia> l1 = LineStyle(Light);

julia> l2 = LineStyle(Heavy, Half1);

julia> drawline!(c, (1,1), 4, Horizontal, l1)
────


julia> drawline!(c, (6,1), 4, Horizontal, l2)
──── ╸╸╸╸


julia> bc = biconnector(Left, l1, Right, l2);

julia> drawconnector!(c, (5,1), bc)
────╼╸╸╸╸


```
"""
biconnector

"""
    triconnector(ldir1, lstyle1, ldir2, lstyle2, ldir3, lstyle3)

Create a `ConnectorStyle` between three lines with line styles `lstyle1`, `lstyle2` and
`lstyle3` and with positions `ldir1`, `ldir2` and `ldir3`.

# Example

```julia-repl
julia> c = Canvas(10, 3);

julia> l1 = LineStyle(Double);

julia> l2 = LineStyle(Double);

julia> l3 = LineStyle();

julia> drawline!(c, (1,1), 4, Horizontal, l1);

julia> drawline!(c, (6,1), 4, Horizontal, l2);

julia> drawline!(c, (5,2), 2, Vertical, l3);

julia> c
════ ════
    │
    │


julia> tc = triconnector(Left, l1, Right, l2, Down, l3);

julia> drawconnector!(c, (5,1), tc)
════╤════
    │
    │


```
"""
triconnector

"""
quadriconnector(ldir1, lstyle1, ldir2, lstyle2, ldir3, lstyle3, ldir4, lstyle4)

Create a `ConnectorStyle` between four lines with line styles `lstyle1`, `lstyle2`,
`lstyle3`, and `lstyle4` and with positions `ldir1`, `ldir2`, `ldir3` and `ldir4`.

# Example

```julia-repl
julia> c = Canvas(10, 5);

julia> l1 = LineStyle(Double);

julia> l2 = LineStyle(Double);

julia> l3 = LineStyle(Dashed1);

julia> l4 = LineStyle(Dashed3);

julia> drawline!(c, (1,3), 4, Horizontal, l1);

julia> drawline!(c, (6,3), 4, Horizontal, l2);

julia> drawline!(c, (5,4), 2, Vertical, l3);

julia> drawline!(c, (5,2), -2, Vertical, l4);

julia> c
    ╎
    ╎
════ ════
    ┆
    ┆


julia> qc = quadriconnector(Left, l1, Right, l2, Down, l3, Up, l4);

julia> drawconnector!(c, (5,3), qc)
    ╎
    ╎
════╪════
    ┆
    ┆


```
"""
quadriconnector

setarg!(args, ::Type{Left}, sym) = args[2] = sym

setarg!(args, ::Type{Up}, sym) = args[3] = sym

setarg!(args, ::Type{Right}, sym) = args[4] = sym

setarg!(args, ::Type{Down}, sym) = args[5] = sym

function defcstyle()
    nl = :(LineStyle(NoLine))
    :(ConnectorStyle($nl, $nl, $nl, $nl))
end

function defbcstyle(style)
    nl = :(LineStyle(NoLine))
    :($style{$nl,$nl,$nl,$nl})
end

for ldir1 in (Left, Up, Right, Down), ldir2 in (Left, Up, Right, Down)
    if ldir1 != ldir2
        bc = defcstyle()
        setarg!(bc.args, ldir1, :(L1))
        setarg!(bc.args, ldir2, :(L2))
        @eval begin
            function biconnector(::Type{$ldir1}, ::Type{L1}, ::Type{$ldir2},
                                 ::Type{L2}) where {L1,L2}
                $bc
            end
        end

        for ldir3 in (Left, Up, Right, Down)
            if ldir1 != ldir3 && ldir2 != ldir3
                tc = defcstyle()
                setarg!(tc.args, ldir1, :(L1))
                setarg!(tc.args, ldir2, :(L2))
                setarg!(tc.args, ldir3, :(L3))
                @eval begin
                    @inline function triconnector(::Type{$ldir1}, ::Type{L1},
                                                  ::Type{$ldir2}, ::Type{L2},
                                                  ::Type{$ldir3},
                                                  ::Type{L3}) where {L1,L2,L3}
                        $tc
                    end
                end

                for ldir4 in (Left, Up, Right, Down)
                    if ldir1 != ldir4 && ldir2 != ldir4 && ldir3 != ldir4
                        qc = defcstyle()
                        setarg!(qc.args, ldir1, :(L1))
                        setarg!(qc.args, ldir2, :(L2))
                        setarg!(qc.args, ldir3, :(L3))
                        setarg!(qc.args, ldir4, :(L4))
                        @eval begin
                            @inline function quadriconnector(::Type{$ldir1}, ::Type{L1},
                                                             ::Type{$ldir2}, ::Type{L2},
                                                             ::Type{$ldir3}, ::Type{L3},
                                                             ::Type{$ldir4},
                                                             ::Type{L4}) where {L1,L2,L3,L4}
                                $qc
                            end
                        end
                    end
                end
            end
        end
    end
end

#=
for ldir1 in (Left, Up, Right, Down), ldir2 in (Left, Up, Right, Down), ldir3 in (Left, Up, Right, Down)
    if ldir1 != ldir2 && ldir2 != ldir3 && ldir1 != ldir3
        cons = defcstyle()
        setarg!(cons.args, ldir1, :(L1))
        setarg!(cons.args, ldir2, :(L2))
        setarg!(cons.args, ldir3, :(L3))
        @eval begin
            function triconnector(::Type{$ldir1}, ::Type{L1}, ::Type{$ldir2},
                                  ::Type{L2}, ::Type{$ldir3}, ::Type{L3}) where {L1,L2,L3}
                $cons
            end
        end
    end
end
=#
#quadriconnector() = ConnectorStyle{L,U,R,D}


#=
function biconnector(::Type{Right}, ::Type{Down}, ::Type{L1}, ::Type{L2}) where {L1,L2} # upper left corner
    ConnectorStyle(LineStyle(NoLine), LineStyle(NoLine), L1, L2)
end

function biconnector(::Type{Left}, ::Type{Down}, ::Type{L1}, ::Type{L2}) where {L1,L2} # upper right corner
    ConnectorStyle(L1, LineStyle(NoLine), LineStyle(NoLine), L2)
end

function biconnector(::Type{Up}, ::Type{Right}, ::Type{L1}, ::Type{L2}) where {L1,L2} # bottom left corner
    ConnectorStyle(LineStyle(NoLine), L1, L2, LineStyle(NoLine))
end

function biconnector(::Type{Left}, ::Type{Up}, ::Type{L1}, ::Type{L2}) where {L1,L2} # bottom right corner
    ConnectorStyle(L1, L2, LineStyle(NoLine), LineStyle(NoLine))
end

function biconnector(::Type{Up}, ::Type{Down}, ::Type{L1}, ::Type{L2}) where {L1,L2} # vertical line
    ConnectorStyle(LineStyle(NoLine), L1, LineStyle(NoLine), L2)
end

function biconnector(::Type{Left}, ::Type{Right}, ::Type{L1}, ::Type{L2}) where {L1,L2} # horizontal line
    ConnectorStyle(L1, LineStyle(NoLine), L2, LineStyle(NoLine))
end
=#

#=
function rdangle(::Type{L1}, ::Type{L2}) where {L1,L2}
    ConnectorStyle(LineStyle(NoLine), LineStyle(NoLine), L1, L2) # upper left corner
end

function ldangle(::Type{L1}, ::Type{L2}) where {L1,L2}
    ConnectorStyle(L1, LineStyle(NoLine), LineStyle(NoLine), L2) # upper right corner
end

function urangle(::Type{L1}, ::Type{L2}) where {L1,L2}
    ConnectorStyle(LineStyle(NoLine), L1, L2, LineStyle(NoLine)) # bottom left corner
end

function luangle(::Type{L1}, ::Type{L2}) where {L1,L2}
    ConnectorStyle(L1, L2, LineStyle(NoLine), LineStyle(NoLine)) # bottom right corner
end

function hline(::Type{L1}, ::Type{L2}) where {L1,L2}
    ConnectorStyle(LineStyle(NoLine), L1, LineStyle(NoLine), L2)
end

function vline(::Type{L1}, ::Type{L2}) where {L1,L2}
    ConnectorStyle(L1, LineStyle(NoLine), L2, LineStyle(NoLine))
end
=#

#=
struct CornerStyle{UD,LR,L1,L2} end

CornerStyle(::Type{UD}, ::Type{LR}, ::Type{L1}, ::Type{L2}) where {UD,LR,L1,L2} = CornerStyle{UD,LR,L1,L2}

CornerStyle(::Type{UD}, ::Type{LR}) where {UD,LR} = CornerStyle(UD, LR, LineStyle(), LineStyle())
=#

#function drawcorner!(canvas, P, cstyle, prstyle = DEFAULT_PSTYLE)
#    _drawcorner!(canvas, P, cstyle, prstyle)
#end
#=
# Upper left corner
function drawcorner!(canvas, P, ::Type{CornerStyle{Up,Left,L1,L2}}, prstyle = DEFAULT_PSTYLE
                     ) where {S1,T1,S2,T2,L1<:LineStyle{S1,T1},L2<:LineStyle{S2,T2}}
    c = char(NoLine, NoLine, S1, S2) #NoLine, NoLine, right, down
    drawchar!(canvas, P, c, prstyle)
    canvas
end

# Upper right corner
function drawcorner!(canvas, P, ::Type{CornerStyle{Up,Right,L1,L2}}, prstyle = DEFAULT_PSTYLE
                     ) where {S1,T1,S2,T2,L1<:LineStyle{S1,T1},L2<:LineStyle{S2,T2}}
    c = char(S1, NoLine, NoLine, S2) #left, NoLine, NoLine, down
    drawchar!(canvas, P, c, prstyle)
    canvas
end

# Bottom left corner
function drawcorner!(canvas, P, ::Type{CornerStyle{Down,Left,L1,L2}}, prstyle = DEFAULT_PSTYLE
                     ) where {S1,T1,S2,T2,L1<:LineStyle{S1,T1},L2<:LineStyle{S2,T2}}
    c = char(NoLine, S1, S2, NoLine) #NoLine, up, right, NoLine
    drawchar!(canvas, P, c, prstyle)
    canvas
end

# Bottom right corner
function drawcorner!(canvas, P, ::Type{CornerStyle{Down,Right,L1,L2}}, prstyle = DEFAULT_PSTYLE
                     ) where {S1,T1,S2,T2,L1<:LineStyle{S1,T1},L2<:LineStyle{S2,T2}}
    c = char(S1, S2, NoLine, NoLine) #left, up, NoLine, NoLine
    drawchar!(canvas, P, c, prstyle)
    canvas
end
=#
############################################################################################
#                                   INTERNAL FUNCTIONS                                     #
############################################################################################

#=
setarg!(args, ::Type{Left}, sym) = args[2] = sym

setarg!(args, ::Type{Up}, sym) = args[3] = sym

setarg!(args, ::Type{Right}, sym) = args[4] = sym

setarg!(args, ::Type{Down}, sym) = args[5] = sym

function defcstyle()
    nl = :(LineStyle(NoLine))
    :(ConnectorStyle($nl, $nl, $nl, $nl))
end
=#
#=
const UpperLeftCorner{R,D} = Connector{NoLine,NoLine,R,D} where {R,D}

function UpperLeftCorner(P, ::Type{R}, ::Type{D}; pstyle = PrintStyle()) where {R,D}
    Connector{NoLine,NoLine,R,D}(first(P), last(P), pstyle)
    #UpperLeftCorner{R,D}(first(P), last(P), pstyle)
end

const UpperRightCorner{L,D} = Connector{L,NoLine,NoLine,D} where {L,D}

function UpperRightCorner(P, ::Type{L}, ::Type{D}; pstyle = PrintStyle()) where {L,D}
    UpperRightCorner{L,D}(P; pstyle = pstyle)
end

const BottomLeftCorner{U,R} = Connector{NoLine,U,R,NoLine} where {U,R}

function BottomLeftCorner(P, ::Type{U}, ::Type{R}; pstyle = PrintStyle()) where {U,R}
    BottomLeftCorner{U,R}(P; pstyle = pstyle)
end

const BottomRightCorner{U,L} = Connector{L,U,NoLine,NoLine} where {U,L}

function BottomRightCorner(P,::Type{U}, ::Type{L}; pstyle = PrintStyle()) where {U,L}
    BottomRightCorner{U,L}(P; pstyle = pstyle)
end
=#

#=




struct Connector{L,U,R,D}#{L<:Type{<:AbstractLineSize},U<:Type{<:AbstractLineSize},R<:Type{<:AbstractLineSize}, D<:Type{<:AbstractLineSize}} #<: AbstractConnector
    x::Int
    y::Int
    pstyle::PrintStyle
end

function Connector(P, left, up, right, down; pstyle = DEFAULT_PSTYLE) #where {L,U,R,D}
    Connector{left, up, right, down}(first(P), last(P), pstyle)#, left, up, right, down)
end

function draw!(canvas::Canvas, connector::Connector{L,U,R,D}) where {L,U,R,D}
    print!(canvas, char(L, U, R, D), connector.x, connector.y, connector.pstyle)
    canvas
end

#struct NoConnector <: AbstractConnector end

#function draw!(canvas::Canvas, ::NoConnector)
#    canvas
#end

function upper_left_corner(P, right, down; pstyle = DEFAULT_PSTYLE)
    Connector(P, NoLine, NoLine, right, down; pstyle = pstyle)
end

function upper_right_corner(P, left, down; pstyle = DEFAULT_PSTYLE)
    Connector(P, left, NoLine, NoLine, down; pstyle = pstyle)
end

function bottom_left_corner(P, up, right; pstyle = DEFAULT_PSTYLE)
    Connector(P, NoLine, up, right, NoLine; pstyle = pstyle)
end

function bottom_right_corner(P, up, left; pstyle = DEFAULT_PSTYLE)
    Connector(P, left, up, NoLine, NoLine; pstyle = pstyle)
end
=#
