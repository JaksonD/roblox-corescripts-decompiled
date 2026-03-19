local l_Parent_0 = script:FindFirstAncestor("Localization").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.LocalizationRoactContext);
return function(v3) --[[ Line: 7 ]] --[[ Name: LocalizationProvider ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.createElement(v2.Provider, {
        value = v3.localization
    }, v3.children);
end;