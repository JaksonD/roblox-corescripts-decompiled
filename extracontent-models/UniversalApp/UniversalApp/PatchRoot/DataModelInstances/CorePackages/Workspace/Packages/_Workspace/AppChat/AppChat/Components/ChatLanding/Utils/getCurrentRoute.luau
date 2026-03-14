return function(v0) --[[ Line: 1 ]]
    while v0 and v0.index and v0.routes do
        v0 = v0.routes[v0.index];
    end;
    return v0;
end;