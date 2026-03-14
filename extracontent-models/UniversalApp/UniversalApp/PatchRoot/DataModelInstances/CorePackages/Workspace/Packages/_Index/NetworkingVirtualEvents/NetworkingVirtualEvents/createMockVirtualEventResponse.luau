local l_script_FirstAncestor_0 = script:FindFirstAncestor("NetworkingVirtualEvents");
local _ = require(l_script_FirstAncestor_0.types);
return function(v2) --[[ Line: 5 ]] --[[ Name: createMockVirtualEventResponse ]]
    return {
        id = v2, 
        title = "Event Title", 
        description = "Event description...", 
        host = {
            hostType = "user", 
            hostId = 1, 
            hostName = "Roblox", 
            hasVerifiedBadge = false
        }, 
        eventTime = {
            startUtc = DateTime.fromLocalTime(2022, 1, 1):ToIsoDate(), 
            endUtc = DateTime.fromLocalTime(2022, 1, 7):ToIsoDate()
        }, 
        universeId = 1, 
        placeId = 123456789, 
        eventStatus = "active", 
        createdUtc = DateTime.fromLocalTime(2022, 1, 1):ToIsoDate(), 
        updatedUtc = DateTime.fromLocalTime(2022, 1, 1):ToIsoDate(), 
        userRsvpStatus = "none"
    };
end;