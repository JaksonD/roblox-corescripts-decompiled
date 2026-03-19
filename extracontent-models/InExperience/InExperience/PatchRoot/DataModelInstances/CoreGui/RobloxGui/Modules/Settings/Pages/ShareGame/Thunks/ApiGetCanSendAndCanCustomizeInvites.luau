local l_CorePackages_0 = game:GetService("CorePackages");
local l_GetCanSendAndCanCustomizeInvites_0 = require(l_CorePackages_0.Workspace.Packages.GameInvite).GetCanSendAndCanCustomizeInvites;
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v4 = require(l_RobloxGui_0.Modules.Common.httpRequest);
return function(v5, v6) --[[ Line: 12 ]]
    -- upvalues: v4 (copy), l_HttpRbxApiService_0 (copy), l_GetCanSendAndCanCustomizeInvites_0 (copy)
    local v7 = v4(l_HttpRbxApiService_0);
    local v8, v9 = l_GetCanSendAndCanCustomizeInvites_0(v7, v5, v6):await();
    if v8 and v9 and v9.responseBody then
        return v9.responseBody.canPrompt, v9.responseBody.canCustomize;
    else
        return false, false;
    end;
end;