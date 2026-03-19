local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = script:FindFirstAncestor("Localization").Parent;
local v2 = require(l_Parent_0.Signals);
return function() --[[ Line: 12 ]]
    -- upvalues: v2 (copy), l_LocalizationService_0 (copy)
    local v3 = {};
    local v4, v5 = v2.createSignal(l_LocalizationService_0.RobloxLocaleId);
    v3.robloxLocaleId = l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function() --[[ Line: 16 ]]
        -- upvalues: v5 (copy), l_LocalizationService_0 (ref)
        v5(l_LocalizationService_0.RobloxLocaleId);
    end);
    return {
        getRobloxLocaleId = v4, 
        cleanUp = function() --[[ Line: 23 ]] --[[ Name: cleanUp ]]
            -- upvalues: v3 (ref)
            for _, v7 in v3 do
                v7:Disconnect();
            end;
            v3 = {};
        end
    };
end;