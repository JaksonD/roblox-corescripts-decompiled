local l_Parent_0 = script:FindFirstAncestor("AddFriends").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_SessionService_0 = game:GetService("SessionService");
local l_SessionType_0 = require(l_Parent_0.RobloxAppSessionization).SessionType;
return {
    initializeSession = function() --[[ Line: 9 ]] --[[ Name: initializeSession ]]
        -- upvalues: l_HttpService_0 (copy), l_SessionService_0 (copy), l_SessionType_0 (copy)
        local v4 = l_HttpService_0:GenerateGUID(false);
        l_SessionService_0:SetSession(l_SessionType_0.StructuralIdentifier.Level2a, l_SessionType_0.StructuralIdentifier.AddFriendsPage, l_SessionType_0.StructuralIdentifier.AddFriendsPage);
        l_SessionService_0:SetMetadata(l_SessionType_0.StructuralIdentifier.AddFriendsPage, l_SessionType_0.Metadata.AddFriendsPage.AddFriendsSessionId, v4);
        return v4;
    end, 
    getSessionId = function() --[[ Line: 26 ]] --[[ Name: getSessionId ]]
        -- upvalues: l_SessionService_0 (copy), l_SessionType_0 (copy)
        if l_SessionService_0:SessionExists(l_SessionType_0.StructuralIdentifier.AddFriendsPage) then
            return l_SessionService_0:GetMetadata(l_SessionType_0.StructuralIdentifier.AddFriendsPage, l_SessionType_0.Metadata.AddFriendsPage.AddFriendsSessionId);
        else
            return "";
        end;
    end, 
    destroySession = function() --[[ Line: 35 ]] --[[ Name: destroySession ]]
        -- upvalues: l_SessionService_0 (copy), l_SessionType_0 (copy)
        l_SessionService_0:RemoveSession(l_SessionType_0.StructuralIdentifier.AddFriendsPage);
    end
};