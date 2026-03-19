return function(v0, v1, v2) --[[ Line: 5 ]]
    if v0 and v1 and v2 and v2 ~= "" and v0[v2] and v1[v2] and v0[v2] == v1[v2] then
        return true;
    else
        return false;
    end;
end;