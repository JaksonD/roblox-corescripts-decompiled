return function(v0, v1) --[[ Line: 16 ]] --[[ Name: is ]]
    return v0 == v1 and (v0 ~= 0 or 1 / v0 == 1 / v1) or v0 ~= v0 and v1 ~= v1;
end;