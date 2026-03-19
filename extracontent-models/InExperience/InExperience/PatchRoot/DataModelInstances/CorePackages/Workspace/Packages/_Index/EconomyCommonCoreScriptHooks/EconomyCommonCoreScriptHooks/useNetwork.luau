local l_Parent_0 = script:FindFirstAncestor("EconomyCommonCoreScriptHooks").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.NetworkContext);
return function() --[[ Line: 7 ]] --[[ Name: useNetwork ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.useContext(v2);
end;