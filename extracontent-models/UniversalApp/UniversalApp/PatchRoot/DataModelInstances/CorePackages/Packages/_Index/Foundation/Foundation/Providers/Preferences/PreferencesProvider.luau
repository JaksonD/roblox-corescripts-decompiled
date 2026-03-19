local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_1 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_0.PreferencesContext);
local v5 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v6 = {
    preferredTextSize = Enum.PreferredTextSize.Medium, 
    preferredTransparency = 1, 
    reducedMotion = false, 
    scale = 1
};
return function(v7) --[[ Line: 30 ]] --[[ Name: PreferencesProvider ]]
    -- upvalues: v5 (copy), v6 (copy), v3 (copy), v4 (copy)
    local v8 = v5({
        preferredTextSize = v7.preferredTextSize, 
        preferredTransparency = v7.preferredTransparency, 
        reducedMotion = v7.reducedMotion
    }, v6);
    return v3.createElement(v4.Provider, {
        value = v8
    }, v7.children);
end;