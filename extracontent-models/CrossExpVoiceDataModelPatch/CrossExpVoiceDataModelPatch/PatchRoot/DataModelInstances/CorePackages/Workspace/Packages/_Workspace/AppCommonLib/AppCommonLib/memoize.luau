local function v0(...) --[[ Line: 31 ]] --[[ Name: captureSize ]]
    return {
        ...
    }, select("#", ...);
end;
return function(v1) --[[ Line: 37 ]] --[[ Name: memoize ]]
    -- upvalues: v0 (copy)
    assert(type(v1) == "function", "memoize requires a function to memoize");
    local v2 = nil;
    local v3 = nil;
    local v4 = nil;
    local v5 = nil;
    return function(...) --[[ Line: 45 ]]
        -- upvalues: v3 (ref), v4 (ref), v5 (ref), v0 (ref), v1 (copy), v2 (ref)
        local v6 = select("#", ...);
        while v6 > 0 and select(v6, ...) == nil do
            v6 = v6 - 1;
        end;
        if v6 ~= v3 then
            local v7, v8 = v0(v1(...));
            v4 = v7;
            v5 = v8;
            v2 = {
                ...
            };
            v3 = v6;
            return unpack(v4, 1, v5);
        else
            for v9 = 1, v3 do
                if select(v9, ...) ~= v2[v9] then
                    local v10, v11 = v0(v1(...));
                    v4 = v10;
                    v5 = v11;
                    v2 = {
                        ...
                    };
                    break;
                end;
            end;
            return unpack(v4, 1, v5);
        end;
    end;
end;