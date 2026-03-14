local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_makeActionCreator_0 = require(l_Parent_0.Rodux).makeActionCreator;
local _ = require(l_script_FirstAncestor_0.Modules.LuaApp.Models.DiscoveryApi.TextSearchEntry);
return l_makeActionCreator_0(script.Name, function(v4) --[[ Line: 12 ]]
    return {
        searchUuid = v4.searchUuid, 
        topicId = v4.topicId, 
        entry = v4.entry
    };
end);