local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v4 = require(l_Modules_0.LuaApp.Actions.Games.SetOmniRecommendationsMetadataRequestStatus);
return function(v5, v6) --[[ Line: 9 ]]
    -- upvalues: v4 (copy), v2 (copy)
    v5 = v5 or {};
    if v6.type == v4.name then
        local v7 = {};
        for v8, v9 in pairs(v6.contentIds) do
            local v10 = v5[v8] or {};
            v7[v8] = v2.Dictionary.join(v10, v9);
        end;
        v5 = v2.Dictionary.join(v5, v7);
    end;
    return v5;
end;