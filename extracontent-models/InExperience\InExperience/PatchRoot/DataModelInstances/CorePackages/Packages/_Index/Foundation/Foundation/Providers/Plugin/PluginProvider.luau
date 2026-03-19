local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.PluginContext);
return function(v3) --[[ Line: 13 ]] --[[ Name: PluginProvider ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.createElement(v2.Provider, {
        value = v3.plugin or v1.None
    }, v3.children);
end;