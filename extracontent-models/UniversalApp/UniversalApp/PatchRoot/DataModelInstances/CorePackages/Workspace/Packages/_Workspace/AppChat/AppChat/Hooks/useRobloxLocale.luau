local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v2 = require(l_Parent_0.React);
return function() --[[ Line: 7 ]] --[[ Name: useRobloxLocale ]]
    -- upvalues: v2 (copy), l_LocalizationService_0 (copy)
    local v3, v4 = v2.useState(l_LocalizationService_0.RobloxLocaleId);
    v2.useEffect(function() --[[ Line: 10 ]]
        -- upvalues: l_LocalizationService_0 (ref), v4 (copy)
        local v5 = l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function() --[[ Line: 11 ]]
            -- upvalues: v4 (ref), l_LocalizationService_0 (ref)
            v4(l_LocalizationService_0.RobloxLocaleId);
        end);
        return function() --[[ Line: 15 ]]
            -- upvalues: v5 (copy)
            v5:Disconnect();
        end;
    end, {});
    return v3;
end;