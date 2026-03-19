local function v1(v0) --[[ Line: 3 ]]
    return v0;
end;
return function(v2, v3) --[[ Line: 17 ]] --[[ Name: all ]]
    -- upvalues: v1 (copy)
    local v4 = v3 or v1;
    for v5, v6 in v2 do
        if not v4(v6, v5) then
            return false;
        end;
    end;
    return true;
end;