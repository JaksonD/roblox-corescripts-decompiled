local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.SignalsExperimental);
return function(v2) --[[ Line: 4 ]] --[[ Name: createSignalsMiddleware ]]
    -- upvalues: v1 (copy)
    return function(v3, _) --[[ Line: 5 ]]
        -- upvalues: v2 (copy), v1 (ref)
        return function(v5) --[[ Line: 6 ]]
            -- upvalues: v2 (ref), v1 (ref), v3 (copy)
            local v6 = v2[v5.type];
            if v6 and #v6 > 0 then
                v1.batch(function() --[[ Line: 10 ]]
                    -- upvalues: v6 (copy), v5 (copy), v3 (ref)
                    local v7 = true;
                    for _, v9 in v6 do
                        v7 = v9(v5) and v7;
                    end;
                    if not v7 then
                        return v3(v5);
                    else
                        return nil;
                    end;
                end);
                return nil;
            else
                return v3(v5);
            end;
        end;
    end;
end;