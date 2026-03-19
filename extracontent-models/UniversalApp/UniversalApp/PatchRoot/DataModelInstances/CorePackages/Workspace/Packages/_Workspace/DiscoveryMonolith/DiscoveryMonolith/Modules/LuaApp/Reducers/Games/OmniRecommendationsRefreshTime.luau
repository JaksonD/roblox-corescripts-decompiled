local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v4 = require(l_Modules_0.LuaApp.Actions.Games.SetOmniRecommendationsRefreshTime);
return function(v5, v6) --[[ Line: 9 ]]
    -- upvalues: v4 (copy), v2 (copy)
    v5 = v5 or {};
    if v6.type == v4.name then
        v5 = v2.Dictionary.join(v5, {
            [v6.pageType] = v6.refreshTime
        });
    end;
    return v5;
end;