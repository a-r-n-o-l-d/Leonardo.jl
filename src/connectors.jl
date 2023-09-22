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

############################################################################################
#                                   INTERNAL FUNCTIONS                                     #
############################################################################################

_setarg!(args, ::Type{Left}, sym) = args[2] = sym

_setarg!(args, ::Type{Up}, sym) = args[3] = sym

_setarg!(args, ::Type{Right}, sym) = args[4] = sym

_setarg!(args, ::Type{Down}, sym) = args[5] = sym

function _defcstyle()
    nl = :(LineStyle(NoLine))
    :(ConnectorStyle($nl, $nl, $nl, $nl))
end

#function _defbcstyle(style)
#    nl = :(LineStyle(NoLine))
#    :($style{$nl,$nl,$nl,$nl})
#end

############################################################################################
#                                  AUTOMATIC GENERATION                                    #
############################################################################################

for ldir1 in (Left, Up, Right, Down), ldir2 in (Left, Up, Right, Down)
    if ldir1 != ldir2
        bc = _defcstyle()
        _setarg!(bc.args, ldir1, :(L1))
        _setarg!(bc.args, ldir2, :(L2))
        @eval begin
            @inline function biconnector(::Type{$ldir1}, ::Type{L1}, ::Type{$ldir2},
                                 ::Type{L2}) where {L1,L2}
                $bc
            end
        end

        for ldir3 in (Left, Up, Right, Down)
            if ldir1 != ldir3 && ldir2 != ldir3
                tc = _defcstyle()
                _setarg!(tc.args, ldir1, :(L1))
                _setarg!(tc.args, ldir2, :(L2))
                _setarg!(tc.args, ldir3, :(L3))
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
                        qc = _defcstyle()
                        _setarg!(qc.args, ldir1, :(L1))
                        _setarg!(qc.args, ldir2, :(L2))
                        _setarg!(qc.args, ldir3, :(L3))
                        _setarg!(qc.args, ldir4, :(L4))
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
