local v0 = {};
return function(v1, v2) --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    if v0[v1] then
        return;
    else
        v0[v1] = true;
        v2();
        return;
    end;
end;