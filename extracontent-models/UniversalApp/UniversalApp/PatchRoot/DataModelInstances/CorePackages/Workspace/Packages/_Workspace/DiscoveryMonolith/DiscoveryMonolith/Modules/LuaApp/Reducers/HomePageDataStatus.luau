local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v4 = require(l_Modules_0.LuaApp.Actions.SetHomePageDataStatus);
return function(v5, v6) --[[ Line: 8 ]]
    -- upvalues: l_RetrievalStatus_0 (copy), v4 (copy)
    v5 = v5 or l_RetrievalStatus_0.NotStarted;
    if v6.type == v4.name then
        v5 = v6.status;
    end;
    return v5;
end;