local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Roact_0 = require(l_Parent_0.PurchasePromptDeps).Roact;
local v4 = require(l_script_FirstAncestor_0.Localization.getLocalizationContext);
local v5 = require(script.Parent.LocalizationContextProvider);
local v6 = require(l_script_FirstAncestor_0.Flags.FFlagPurchasePromptUseAppLocales);
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
return function(v8) --[[ Line: 21 ]]
    -- upvalues: v6 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v4 (copy), l_Roact_0 (copy), v5 (copy)
    local v9 = nil;
    v9 = if v6 then l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId) else v4(l_LocalizationService_0.RobloxLocaleId);
    return l_Roact_0.createElement(v5, {
        localizationContext = v9
    }, {
        PurchasePromptApp = v8()
    });
end;