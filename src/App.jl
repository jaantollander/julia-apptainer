module App

append_sum(v::Vector{Int}) = [v..., sum(v)]

export append_sum

end
