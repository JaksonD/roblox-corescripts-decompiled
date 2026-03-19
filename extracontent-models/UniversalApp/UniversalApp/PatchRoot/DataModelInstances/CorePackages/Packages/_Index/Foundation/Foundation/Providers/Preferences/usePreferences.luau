local l_Parent_0 = script.Parent;
local l_Parent_1 = script:FindFirstAncestor("Foundation").Parent;
local v2 = require(l_Parent_0.PreferencesContext);
local v3 = require(l_Parent_1.React);
return function() --[[ Line: 9 ]] --[[ Name: usePreferences ]]
    -- upvalues: v3 (copy), v2 (copy)
    return (v3.useContext(v2));
end;