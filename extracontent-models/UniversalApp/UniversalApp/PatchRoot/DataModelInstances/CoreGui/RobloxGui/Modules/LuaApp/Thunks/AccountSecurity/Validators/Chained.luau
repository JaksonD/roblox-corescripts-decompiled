return function(...) --[[ Line: 3 ]]
    local v0 = {
        ...
    };
    return function(v1) --[[ Line: 6 ]]
        -- upvalues: v0 (copy)
        local v2 = nil;
        for _, v4 in ipairs(v0) do
            if v2 == nil then
                v2 = v4(v1);
            else
                v2 = v2:andThen(function(v5) --[[ Line: 12 ]]
                    -- upvalues: v4 (copy), v1 (copy)
                    if v5 ~= nil then
                        return v5;
                    else
                        return v4(v1);
                    end;
                end);
            end;
        end;
        return v2;
    end;
end;