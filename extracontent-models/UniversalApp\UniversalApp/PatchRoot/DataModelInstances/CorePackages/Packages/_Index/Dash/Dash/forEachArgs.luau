return function(v0, ...) --[[ Line: 9 ]] --[[ Name: forEachArgs ]]
    for v1 = 1, select("#", ...) do
        v0(select(v1, ...), v1);
    end;
end;