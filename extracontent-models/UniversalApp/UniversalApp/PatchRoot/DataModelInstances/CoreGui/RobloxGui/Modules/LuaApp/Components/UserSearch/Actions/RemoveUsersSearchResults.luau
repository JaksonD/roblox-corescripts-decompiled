local l_CorePackages_0 = game:GetService("CorePackages");
local l_makeActionCreator_0 = require(l_CorePackages_0.Packages.Rodux).makeActionCreator;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return l_makeActionCreator_0(script.Name, function(v3) --[[ Line: 5 ]]
    -- upvalues: v2 (copy)
    v2.isType(v3, "string", "Actions.RemoveUsersSearchResults.keyword");
    return {
        searchUuid = v3, 
        keyword = v3
    };
end);