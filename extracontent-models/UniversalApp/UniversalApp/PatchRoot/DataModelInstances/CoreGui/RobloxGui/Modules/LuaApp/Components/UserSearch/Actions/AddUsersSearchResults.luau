local l_CorePackages_0 = game:GetService("CorePackages");
local l_makeActionCreator_0 = require(l_CorePackages_0.Packages.Rodux).makeActionCreator;
local _ = require(script.Parent.Parent.Models.UserSearchEntry);
return l_makeActionCreator_0(script.Name, function(v3) --[[ Line: 15 ]]
    return {
        keyword = v3.keyword, 
        searchUuid = v3.searchUuid, 
        nextPageCursor = v3.nextPageCursor, 
        entries = v3.entries, 
        curPageCursor = v3.curPageCursor, 
        paginationMethod = v3.paginationMethod
    };
end);