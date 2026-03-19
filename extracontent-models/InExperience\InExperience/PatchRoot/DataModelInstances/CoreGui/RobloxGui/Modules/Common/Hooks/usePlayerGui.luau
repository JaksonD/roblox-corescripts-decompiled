local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(script.Parent.useLocalPlayer);
return function() --[[ Line: 5 ]] --[[ Name: usePlayerGui ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v3 = v2();
    local v4, v5 = v1.useState(nil);
    v1.useEffect(function() --[[ Line: 9 ]]
        -- upvalues: v3 (copy), v5 (copy)
        local v6 = nil;
        if v3 then
            v5(v3:FindFirstChildOfClass("PlayerGui"));
            v6 = v3.ChildAdded:Connect(function(v7) --[[ Line: 15 ]]
                -- upvalues: v5 (ref)
                if v7:IsA("PlayerGui") then
                    v5(v7);
                end;
            end);
        end;
        return function() --[[ Line: 22 ]]
            -- upvalues: v6 (ref)
            if v6 then
                v6:Disconnect();
            end;
        end;
    end, {
        v3
    });
    return v4;
end;