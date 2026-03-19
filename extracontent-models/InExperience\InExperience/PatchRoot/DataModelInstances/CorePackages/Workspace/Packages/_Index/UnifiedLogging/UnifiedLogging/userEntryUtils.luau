return {
    extractFieldsFromUserEntry = function(v0) --[[ Line: 7 ]]
        if not v0 then
            return {};
        else
            local v1 = v0.presence and v0.presence.userPresenceType or "";
            local v2 = v0.isFriend and "friend" or "notFriend";
            local v3 = if v0.presence and v0.presence.universeId and v0.presence.universeId ~= "" then v0.presence.universeId else "-1";
            return {
                presence = v1, 
                friendStatus = v2, 
                presenceUniverseId = v3
            };
        end;
    end
};