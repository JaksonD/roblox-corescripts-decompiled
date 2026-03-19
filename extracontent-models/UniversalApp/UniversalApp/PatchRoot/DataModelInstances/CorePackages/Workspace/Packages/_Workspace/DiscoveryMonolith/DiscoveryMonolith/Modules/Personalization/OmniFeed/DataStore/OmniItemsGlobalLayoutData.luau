local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.DiscoveryTypes);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v6 = require(l_Modules_0.LuaApp.Actions.Games.AddOmniRecommendations);
return function(v7, v8) --[[ Line: 12 ]]
    -- upvalues: v6 (copy), l_AppPage_0 (copy), v2 (copy)
    v7 = v7 or {};
    if v8.type == v6.name then
        local l_recommendations_0 = v8.recommendations;
        for v10, v11 in pairs(l_recommendations_0) do
            if v10 == l_AppPage_0.Home then
                assert(v10 == v11.pageType, "Should match page type");
                if v11.globalLayoutData then
                    if v8.isAppend then
                        v7 = v2.Dictionary.join(v7, v11.globalLayoutData);
                    else
                        v7 = v2.Dictionary.join({}, v11.globalLayoutData);
                    end;
                end;
            end;
        end;
    end;
    return v7;
end;