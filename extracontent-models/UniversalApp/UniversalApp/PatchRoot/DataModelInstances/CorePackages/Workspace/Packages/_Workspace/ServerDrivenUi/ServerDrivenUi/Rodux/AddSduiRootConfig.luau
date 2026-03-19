local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local l_makeActionCreator_0 = require(l_Parent_0.Rodux).makeActionCreator;
local _ = require(l_Parent_0.SduiCoreSystem);
return l_makeActionCreator_0(script.Name, function(v3, v4, v5, v6, v7) --[[ Line: 11 ]]
    return {
        page = v3, 
        rootConfig = v4, 
        dataUpdatedTimestamp = v5, 
        expectedSduiFeedItems = v6, 
        customFeedStoreKey = v7
    };
end);