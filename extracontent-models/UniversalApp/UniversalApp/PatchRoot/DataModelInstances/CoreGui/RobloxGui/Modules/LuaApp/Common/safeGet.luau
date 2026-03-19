local function v0(v1, v2, ...) --[[ Line: 3 ]] --[[ Name: safeGet ]]
    -- upvalues: v0 (copy)
    if not v2 then
        return v1;
    elseif type(v1) ~= "table" then
        return nil;
    else
        return v0(v1[v2], ...);
    end;
end;
return v0;