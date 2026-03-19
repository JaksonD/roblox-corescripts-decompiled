local l_script_FirstAncestor_0 = script:FindFirstAncestor("Groups");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.GroupsPage);
local v4 = require(l_script_FirstAncestor_0.Contexts.useGroupsWrapperContext);
local v5 = require(l_script_FirstAncestor_0.Analytics.initializeGroupsAnalytics);
local v6 = require(l_script_FirstAncestor_0.Analytics.GroupsAnalyticsContext);
return function(v7) --[[ Line: 19 ]] --[[ Name: GroupsWithContext ]]
    -- upvalues: v4 (copy), v2 (copy), v5 (copy), v6 (copy), v3 (copy)
    local v8 = v4();
    local v10 = v2.useMemo(function() --[[ Line: 22 ]]
        -- upvalues: v5 (ref), v8 (copy)
        local v9 = v5();
        v9.updateInfoForAllEvents({
            userId = v8.userId
        });
        return v9;
    end, {
        v8.userId
    });
    return v2.createElement(v6.Provider, {
        value = v10
    }, {
        GroupsPage = v2.createElement(v3, v7)
    });
end;