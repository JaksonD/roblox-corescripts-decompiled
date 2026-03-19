local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v4 = require(l_Modules_0.LuaApp.Actions.Games.UpdateGameMedia);
return function(v5, v6) --[[ Line: 12 ]]
    -- upvalues: v4 (copy), l_Immutable_0 (copy)
    v5 = v5 or {};
    assert(v5, "");
    if v6.type == v4.name then
        v5 = l_Immutable_0.Set(v5, v6.universeId, v6.entries);
    end;
    return v5;
end;