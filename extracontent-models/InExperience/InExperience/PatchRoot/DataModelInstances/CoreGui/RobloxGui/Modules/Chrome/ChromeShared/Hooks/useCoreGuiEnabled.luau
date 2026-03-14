local l_CorePackages_0 = game:GetService("CorePackages");
local l_StarterGui_0 = game:GetService("StarterGui");
local v2 = require(l_CorePackages_0.Packages.React);
useCoreGuiEnabled = function(v3) --[[ Line: 5 ]] --[[ Name: useCoreGuiEnabled ]]
    -- upvalues: v2 (copy), l_StarterGui_0 (copy)
    local v4, v5 = v2.useState(l_StarterGui_0:GetCoreGuiEnabled(v3));
    v2.useEffect(function() --[[ Line: 7 ]]
        -- upvalues: l_StarterGui_0 (ref), v3 (copy), v5 (copy)
        local v8 = l_StarterGui_0.CoreGuiChangedSignal:Connect(function(v6, v7) --[[ Line: 9 ]]
            -- upvalues: v3 (ref), v5 (ref)
            if v6 == v3 then
                v5(v7);
            end;
        end);
        v5(l_StarterGui_0:GetCoreGuiEnabled(v3));
        return function() --[[ Line: 16 ]]
            -- upvalues: v8 (copy)
            v8:Disconnect();
        end;
    end, {
        v3
    });
    return v4;
end;
return useCoreGuiEnabled;