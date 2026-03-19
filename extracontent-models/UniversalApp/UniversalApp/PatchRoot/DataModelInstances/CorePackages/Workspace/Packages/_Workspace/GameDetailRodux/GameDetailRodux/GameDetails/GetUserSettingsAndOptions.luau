local l_Parent_0 = script:FindFirstAncestor("GameDetailRodux").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v2) --[[ Line: 24 ]]
    -- upvalues: l_Url_0 (copy)
    return v2(("%*user-settings-api/v1/user-settings/settings-and-options"):format(l_Url_0.APIS_URL), "GET");
end;