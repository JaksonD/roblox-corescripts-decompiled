local l_Parent_0 = script:FindFirstAncestor("PurchasePrompt").Parent;
local l_Roact_0 = require(l_Parent_0.PurchasePromptDeps).Roact;
local v2 = require(script.Parent.LocalizationContext);
return function(v3) --[[ Line: 13 ]]
    -- upvalues: l_Roact_0 (copy), v2 (copy)
    return l_Roact_0.createElement(v2.Provider, {
        value = v3.localizationContext
    }, l_Roact_0.oneChild(v3[l_Roact_0.Children]));
end;