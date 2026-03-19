local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local v1 = require(l_Parent_0.React);
local l_useContext_0 = v1.useContext;
local v3 = require(script.Parent.PluginContext);
return function() --[[ Line: 9 ]] --[[ Name: usePlugin ]]
    -- upvalues: l_useContext_0 (copy), v3 (copy), v1 (copy)
    local v4 = l_useContext_0(v3);
    if v4 == v1.None then
        return nil;
    else
        return v4;
    end;
end;