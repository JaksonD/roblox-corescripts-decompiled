local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Roact_0 = require(l_Parent_0.PurchasePromptDeps).Roact;
local v4 = require(l_script_FirstAncestor_0.Localization.getLocalizationContext);
local v5 = require(script.Parent.LocalizationContextProvider);
return function(v6) --[[ Line: 16 ]]
    -- upvalues: l_Roact_0 (copy), v5 (copy), v4 (copy), l_LocalizationService_0 (copy)
    return l_Roact_0.createElement(v5, {
        localizationContext = v4(l_LocalizationService_0.RobloxLocaleId)
    }, {
        PurchasePromptApp = v6()
    });
end;