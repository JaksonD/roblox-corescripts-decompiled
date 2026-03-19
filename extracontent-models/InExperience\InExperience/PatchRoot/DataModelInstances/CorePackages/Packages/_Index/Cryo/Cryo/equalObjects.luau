return function(...) --[[ Line: 2 ]] --[[ Name: equalObjects ]]
    local v0 = select(1, ...);
    for v1 = 2, select("#", ...) do
        if v0 ~= select(v1, ...) then
            return false;
        end;
    end;
    return true;
end;