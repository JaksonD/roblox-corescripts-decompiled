local l_Parent_0 = script:FindFirstAncestor("PurchasePrompt").Parent;
local v1 = require(l_Parent_0.React);
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
return function(v3, v4) --[[ Line: 8 ]]
    -- upvalues: v1 (copy), l_StyleProviderWithDefaultTheme_0 (copy)
    return v1.createElement(l_StyleProviderWithDefaultTheme_0, {
        withUiModeSupport = if v4 then v4.withUiModeSupport else false, 
        withDarkTheme = not v4 or v4.withDarkTheme
    }, v3);
end;