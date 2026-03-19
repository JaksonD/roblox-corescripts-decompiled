local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_0.Utility.formatNumber);
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v5 = require(l_Parent_1.Foundation);
local l_Enums_0 = v5.Enums;
local l_getIconRichText_0 = v5.Utility.getIconRichText;
useRobuxText = function(v8) --[[ Line: 10 ]] --[[ Name: useRobuxText ]]
    -- upvalues: v2 (copy), v3 (copy), l_LocalizationService_0 (copy), l_getIconRichText_0 (copy), l_Enums_0 (copy)
    return (v2.useMemo(function() --[[ Line: 11 ]]
        -- upvalues: v3 (ref), l_LocalizationService_0 (ref), v8 (copy), l_getIconRichText_0 (ref), l_Enums_0 (ref)
        local v9 = v3(l_LocalizationService_0.RobloxLocaleId, v8 or 0);
        return (("%* %*"):format(l_getIconRichText_0(l_Enums_0.IconName.Robux), v9));
    end, {
        v8, 
        l_LocalizationService_0.RobloxLocaleId
    }));
end;
return useRobuxText;