local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.DiscoveryTypes);
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v5 = require(l_Modules_0.Personalization.Sessions.DataStore.SetPageSessionTimestamp);
return function(v6, v7) --[[ Line: 10 ]]
    -- upvalues: v5 (copy), v2 (copy)
    v6 = v6 or {};
    if v7.type == v5.name then
        v6 = v2.Dictionary.join(v6, {
            [v7.page] = v7.timestamp
        });
    end;
    return v6;
end;