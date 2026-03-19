local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.LocalizationKeysContext);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
return function() --[[ Line: 8 ]] --[[ Name: useLocalizedStrings ]]
    -- upvalues: v1 (copy), v2 (copy), l_useLocalization_0 (copy)
    local v4 = v1.useContext(v2);
    return (l_useLocalization_0(v4));
end;