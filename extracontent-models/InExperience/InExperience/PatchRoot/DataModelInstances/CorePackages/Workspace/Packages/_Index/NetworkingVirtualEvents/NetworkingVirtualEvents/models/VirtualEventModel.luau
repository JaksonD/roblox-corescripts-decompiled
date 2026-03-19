local l_script_FirstAncestor_0 = script:FindFirstAncestor("NetworkingVirtualEvents");
local _ = require(l_script_FirstAncestor_0.types);
return {
    mock = function(v2) --[[ Line: 7 ]] --[[ Name: mock ]]
        local v3 = DateTime.now();
        local v4 = DateTime.fromUnixTimestamp(v3.UnixTimestamp + 86400);
        return {
            id = v2, 
            title = "Event Name", 
            description = "Event description goes here...", 
            host = {
                hostType = "user", 
                hostId = 1, 
                hostName = "Roblox", 
                hasVerifiedBadge = true
            }, 
            eventTime = {
                startTime = v3, 
                endTime = v4, 
                startUtc = v3:ToIsoDate(), 
                endUtc = v3:ToIsoDate()
            }, 
            universeId = 3531439676, 
            placeId = 123456789, 
            eventStatus = "active", 
            createdTime = v3, 
            updatedTime = v3, 
            userRsvpStatus = "none"
        };
    end, 
    fromResponse = function(v5) --[[ Line: 38 ]] --[[ Name: fromResponse ]]
        local v6 = DateTime.fromIsoDate(v5.eventTime.startUtc);
        local v7 = DateTime.fromIsoDate(v5.eventTime.endUtc);
        local v8 = DateTime.fromIsoDate(v5.createdUtc);
        local v9 = DateTime.fromIsoDate(v5.updatedUtc);
        if v6 and v7 and v8 and v9 then
            return {
                id = v5.id, 
                title = v5.title, 
                description = v5.description, 
                host = v5.host, 
                eventTime = {
                    startTime = v6, 
                    endTime = v7, 
                    startUtc = v5.eventTime.startUtc, 
                    endUtc = v5.eventTime.endUtc
                }, 
                universeId = v5.universeId, 
                placeId = v5.placeId, 
                eventStatus = v5.eventStatus, 
                createdTime = v8, 
                updatedTime = v9, 
                userRsvpStatus = v5.userRsvpStatus
            };
        else
            return nil;
        end;
    end
};