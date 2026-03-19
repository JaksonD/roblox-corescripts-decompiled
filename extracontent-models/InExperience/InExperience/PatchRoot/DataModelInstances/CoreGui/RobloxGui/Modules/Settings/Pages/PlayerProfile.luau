local l_RobloxGui_0 = game:GetService("CoreGui").RobloxGui;
local v1 = require(l_RobloxGui_0.Modules.Settings.ReactPageFactory);
local v2 = require(script.PlayerProfileContainer);
createPlayerProfilePage = function() --[[ Line: 9 ]] --[[ Name: createPlayerProfilePage ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v3 = v1:createNewPage("PlayerProfile");
    v3:setPage(v2);
    return v3;
end;
return createPlayerProfilePage();