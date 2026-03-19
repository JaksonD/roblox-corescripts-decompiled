local function v0(v1, v2) --[[ Line: 9 ]] --[[ Name: deepCopy ]]
    -- upvalues: v0 (copy)
    if type(v1) ~= "table" then
        return v1;
    elseif v2 and v2[v1] then
        return v2[v1];
    else
        local v3 = v2 or {};
        local v4 = setmetatable({}, (getmetatable(v1)));
        v3[v1] = v4;
        for v5, v6 in pairs(v1) do
            v4[v0(v5, v3)] = v0(v6, v3);
        end;
        return v4;
    end;
end;
return v0;