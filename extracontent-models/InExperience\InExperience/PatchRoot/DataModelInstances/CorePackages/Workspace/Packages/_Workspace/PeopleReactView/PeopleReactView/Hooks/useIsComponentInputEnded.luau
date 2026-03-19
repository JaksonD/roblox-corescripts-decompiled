local l_Parent_0 = script:FindFirstAncestor("PeopleReactView").Parent;
local v1 = require(l_Parent_0.React);
return function(v2) --[[ Line: 10 ]]
    -- upvalues: v1 (copy)
    local v3, v4 = v1.useState(false);
    v1.useEffect(function() --[[ Line: 13 ]]
        -- upvalues: v2 (copy), v4 (copy)
        local v5 = nil;
        local v6 = nil;
        if v2.current then
            v5 = v2.current.InputBegan:Connect(function() --[[ Line: 18 ]]
                -- upvalues: v4 (ref)
                v4(false);
            end);
            v6 = v2.current.InputEnded:Connect(function() --[[ Line: 21 ]]
                -- upvalues: v4 (ref)
                v4(true);
            end);
        end;
        return function() --[[ Line: 26 ]]
            -- upvalues: v5 (ref), v6 (ref)
            if v5 then
                v5:Disconnect();
            end;
            if v6 then
                v6:Disconnect();
            end;
        end;
    end, {});
    return v3;
end;