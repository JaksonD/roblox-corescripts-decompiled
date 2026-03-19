local l_Parent_0 = script:FindFirstAncestor("NotApprovedPage").Parent;
local v1 = require(l_Parent_0.ArgCheck);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v3 = require(l_Parent_0.Promise);
local l_Players_0 = game:GetService("Players");
local l_HttpService_0 = game:GetService("HttpService");
return function(v6, v7) --[[ Line: 11 ]] --[[ Name: PostReactivateAccount ]]
    -- upvalues: v1 (copy), l_Players_0 (copy), v3 (copy), l_UrlBuilder_0 (copy), l_HttpService_0 (copy)
    v1.isType(v7, "number", "PostReactivate expects punishmentId to be a number");
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    v1.assert(l_LocalPlayer_0, "Players.LocalPlayer should be non-nil");
    if l_LocalPlayer_0 == nil then
        return v3.reject("Players.LocalPlayer is nil");
    else
        local l_UserId_0 = l_LocalPlayer_0.UserId;
        return v6(l_UrlBuilder_0.usermoderation.reactivate(), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                PunishmentId = v7, 
                PunishedUserId = l_UserId_0
            })
        });
    end;
end;