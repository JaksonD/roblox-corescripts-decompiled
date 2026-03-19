local function v6(v0, v1) --[[ Line: 2 ]] --[[ Name: getArgs ]]
    for _, v3 in pairs(v1) do
        local v4 = v3 .. " ";
        local v5 = string.len(v4);
        if string.sub(v0, 1, v5):lower() == v4 then
            return (string.sub(v0, v5 + 1));
        end;
    end;
    return nil;
end;
return function(v7, v8) --[[ Line: 15 ]]
    -- upvalues: v6 (copy)
    local v9 = v6(v7, v8);
    if v9 then
        return string.split(v9, " ")[1];
    else
        return nil;
    end;
end;