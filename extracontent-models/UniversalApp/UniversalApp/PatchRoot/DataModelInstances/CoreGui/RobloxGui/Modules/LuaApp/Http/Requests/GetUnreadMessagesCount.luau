local l_CorePackages_0 = game:GetService("CorePackages");
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
return function(v2) --[[ Line: 13 ]]
    -- upvalues: l_Url_0 (copy)
    return v2(string.format("%s/messages/unread/count", l_Url_0.PRIVATEMESSAGES_URL), "GET");
end;