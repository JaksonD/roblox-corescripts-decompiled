local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script:FindFirstAncestor("UserLib").Parent;
local l_GetFFlagInviteListRerank_0 = require(l_Parent_0.SharedFlags).GetFFlagInviteListRerank;
local v3 = {
    PresenceType = {
        OFFLINE = "OFFLINE", 
        ONLINE = "ONLINE", 
        IN_GAME = "IN_GAME", 
        IN_STUDIO = "IN_STUDIO"
    }, 
    new = function() --[[ Line: 17 ]] --[[ Name: new ]]
        return {};
    end
};
v3.fromData = function(v4, v5, v6, v7) --[[ Line: 25 ]] --[[ Name: fromData ]]
    -- upvalues: v3 (copy), l_Players_0 (copy)
    local v8 = v3.new();
    v8.id = tostring(v4);
    v8.isFetching = false;
    v8.isFriend = v6;
    v8.friendRank = v7 or 0;
    v8.lastLocation = nil;
    v8.name = v5;
    v8.displayName = v5;
    v8.externalAppDisplayName = v5;
    v8.universeId = nil;
    v8.placeId = nil;
    v8.rootPlaceId = nil;
    v8.gameInstanceId = nil;
    v8.presence = l_Players_0.LocalPlayer and v8.id == tostring(l_Players_0.LocalPlayer.UserId) and v3.PresenceType.ONLINE or nil;
    v8.DEPRECATED_thumbnails = nil;
    v8.lastOnline = nil;
    return v8;
end;
v3.fromDataTable = function(v9) --[[ Line: 51 ]] --[[ Name: fromDataTable ]]
    -- upvalues: v3 (copy), l_Players_0 (copy), l_GetFFlagInviteListRerank_0 (copy)
    local v10 = v3.new();
    v10.id = tostring(v9.id);
    v10.isFriend = v9.isFriend;
    v10.friendRank = v9.friendRank;
    v10.presence = l_Players_0.LocalPlayer and v10.id == tostring(l_Players_0.LocalPlayer.UserId) and v3.PresenceType.ONLINE or nil;
    v10.isFetching = false;
    v10.lastLocation = nil;
    v10.name = v9.name;
    v10.displayName = v9.displayName or v9.name;
    v10.externalAppDisplayName = v9.externalAppDisplayName;
    v10.universeId = nil;
    v10.placeId = nil;
    v10.rootPlaceId = nil;
    v10.gameInstanceId = nil;
    v10.DEPRECATED_thumbnails = nil;
    v10.lastOnline = nil;
    v10.hasVerifiedBadge = v9.hasVerifiedBadge;
    if l_GetFFlagInviteListRerank_0() then
        v10.friendFrequentRank = v9.friendFrequentRank;
    end;
    return v10;
end;
v3.compare = function(v11, v12) --[[ Line: 80 ]] --[[ Name: compare ]]
    local v13 = false;
    if v11 == nil then
        v13 = v12 == nil;
    end;
    assert(not v13, "user1 and user2 cannot both be nil");
    local v14 = true;
    if v11 ~= nil then
        v14 = typeof(v11) == "table";
    end;
    assert(v14, "user1 must be a table or nil");
    v14 = true;
    if v12 ~= nil then
        v14 = typeof(v12) == "table";
    end;
    assert(v14, "user2 must be a table or nil");
    if not v11 or not v12 then
        return false;
    else
        for v15, v16 in pairs(v12) do
            if v11[v15] ~= v16 then
                return false;
            end;
        end;
        for v17, v18 in pairs(v11) do
            if v12[v17] ~= v18 then
                return false;
            end;
        end;
        return true;
    end;
end;
v3.userPresenceToText = function(v19, v20) --[[ Line: 105 ]] --[[ Name: userPresenceToText ]]
    -- upvalues: v3 (copy)
    local l_presence_0 = v20.presence;
    local l_lastLocation_0 = v20.lastLocation;
    if not l_presence_0 then
        return "";
    elseif l_presence_0 == v3.PresenceType.OFFLINE then
        return v19:Format("Common.Presence.Label.Offline");
    elseif l_presence_0 == v3.PresenceType.ONLINE then
        return v19:Format("Common.Presence.Label.Online");
    elseif l_presence_0 == v3.PresenceType.IN_GAME or l_presence_0 == v3.PresenceType.IN_STUDIO then
        if l_lastLocation_0 ~= nil then
            return l_lastLocation_0;
        else
            return v19:Format("Common.Presence.Label.Online");
        end;
    else
        return;
    end;
end;
return v3;