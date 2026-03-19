local l_Parent_0 = script:FindFirstAncestor("ApolloPresence").Parent;
local v1 = require(l_Parent_0.Cryo);
local l_PresenceType_0 = require(l_Parent_0.GraphQLServer).types.PresenceType;
local v3 = {
    [l_PresenceType_0.Offline] = 0, 
    [l_PresenceType_0.Online] = 1, 
    [l_PresenceType_0.InGame] = 2, 
    [l_PresenceType_0.InStudio] = 3
};
local v6 = v1.List.foldLeft(v1.Dictionary.keys(v3), function(v4, v5) --[[ Line: 18 ]]
    -- upvalues: v3 (copy)
    v4[tostring(v3[v5])] = v5;
    return v4;
end, {});
local function _(v7) --[[ Line: 23 ]] --[[ Name: convertToStringWithDefault ]]
    if v7 then
        return (tostring(v7));
    else
        return "";
    end;
end;
return {
    formatNumberToPresenceType = function(v9) --[[ Line: 27 ]] --[[ Name: formatNumberToPresenceType ]]
        -- upvalues: v6 (copy), l_PresenceType_0 (copy)
        return v9 and v6[tostring(v9)] or l_PresenceType_0.Offline;
    end, 
    formatPresenceTypeToNumber = function(v10) --[[ Line: 31 ]] --[[ Name: formatPresenceTypeToNumber ]]
        -- upvalues: v3 (copy), l_PresenceType_0 (copy)
        return v10 and v3[v10] or v3[l_PresenceType_0.Offline];
    end, 
    formatUserPresence = function(v11) --[[ Line: 58 ]] --[[ Name: formatUserPresence ]]
        -- upvalues: v6 (copy), l_PresenceType_0 (copy)
        local v12 = {
            id = v11.id
        };
        local v13;
        if v11.userPresenceType then
            v13 = v11.userPresenceType;
        else
            local l_userPresenceNumber_0 = v11.userPresenceNumber;
            v13 = l_userPresenceNumber_0 and v6[tostring(l_userPresenceNumber_0)] or l_PresenceType_0.Offline;
        end;
        v12.userPresenceType = v13;
        v12.lastLocation = v11.lastLocation or "";
        v12.lastOnline = v11.lastOnline or "";
        local l_gameId_0 = v11.gameId;
        v12.gameId = if l_gameId_0 then tostring(l_gameId_0) else "";
        l_gameId_0 = v11.placeId;
        v12.placeId = if l_gameId_0 then tostring(l_gameId_0) else "";
        l_gameId_0 = v11.rootPlaceId;
        v12.rootPlaceId = if l_gameId_0 then tostring(l_gameId_0) else "";
        l_gameId_0 = v11.universeId;
        v12.universeId = if l_gameId_0 then tostring(l_gameId_0) else "";
        return v12;
    end
};