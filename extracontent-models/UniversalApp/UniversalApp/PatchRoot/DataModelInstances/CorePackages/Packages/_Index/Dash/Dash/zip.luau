return function(v0, v1) --[[ Line: 10 ]] --[[ Name: zip ]]
    local v2 = nil;
    local v3 = nil;
    local v4 = nil;
    local v5 = nil;
    return function() --[[ Line: 12 ]]
        -- upvalues: v2 (ref), v4 (ref), v0 (copy), v3 (ref), v5 (ref), v1 (copy)
        local v6, v7 = next(v0, v2);
        v2 = v6;
        v4 = v7;
        v6, v7 = next(v1, v3);
        v3 = v6;
        v5 = v7;
        if not v4 or not v5 then
            return nil;
        else
            return v4, v5;
        end;
    end;
end;