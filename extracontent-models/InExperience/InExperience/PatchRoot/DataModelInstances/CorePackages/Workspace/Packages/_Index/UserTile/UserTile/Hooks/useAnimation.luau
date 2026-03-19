local l_Parent_0 = script:FindFirstAncestor("UserTile").Parent;
local v1 = require(l_Parent_0.React);
return function(v2, v3, v4, v5) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    v1.useEffect(function() --[[ Line: 6 ]]
        -- upvalues: v2 (copy), v4 (copy), v3 (copy), v5 (copy)
        local v6 = nil;
        if v2 then
            local v7 = tick();
            v6 = game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 11 ]]
                -- upvalues: v7 (copy), v4 (ref), v3 (ref), v6 (ref), v5 (ref)
                local v8 = (tick() - v7) * 1000;
                v4(v8);
                if v3 < v8 then
                    v6:Disconnect();
                    v5();
                end;
            end);
        end;
    end, {
        v2
    });
end;