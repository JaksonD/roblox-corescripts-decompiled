local l_script_FirstAncestor_0 = script:FindFirstAncestor("GraphQLServer");
local _ = require(l_script_FirstAncestor_0.graphql.generatedTypes);
return function(v2) --[[ Line: 5 ]] --[[ Name: createMockVirtualEvent ]]
    local v3 = DateTime.now();
    local v4 = DateTime.fromUnixTimestamp(v3.UnixTimestamp + 86400);
    return {
        id = v2, 
        title = "Event Name", 
        description = "Event description goes here...", 
        host = {
            hostType = "user", 
            hostId = "1", 
            hostName = "Roblox", 
            hasVerifiedBadge = true
        }, 
        eventTime = {
            startUtc = v3:ToIsoDate(), 
            endUtc = v4:ToIsoDate(), 
            startTime = v3, 
            endTime = v4
        }, 
        universeId = "3531439676", 
        eventStatus = "active", 
        createdTime = v3, 
        updatedTime = v3, 
        userRsvpStatus = "none", 
        eventCategories = {
            {
                category = "challenge", 
                rank = 0
            }, 
            {
                category = "newContent", 
                rank = 1
            }
        }, 
        experienceDetails = {
            id = "3531439676", 
            name = "Experience Name", 
            playing = 50000
        }, 
        rsvpCounters = {
            going = 2500, 
            notGoing = 0, 
            none = 0, 
            maybeGoing = 0
        }, 
        rsvps = {
            {
                userId = "957765952", 
                rsvpStatus = "going"
            }, 
            {
                userId = "35392", 
                rsvpStatus = "going"
            }, 
            {
                userId = "4416634", 
                rsvpStatus = "going"
            }, 
            {
                userId = "1893522417", 
                rsvpStatus = "going"
            }, 
            {
                userId = "1343930", 
                rsvpStatus = "going"
            }, 
            {
                userId = "29819622", 
                rsvpStatus = "notGoing"
            }, 
            {
                userId = "1668748746", 
                rsvpStatus = "notGoing"
            }, 
            {
                userId = "308199922", 
                rsvpStatus = "notGoing"
            }
        }
    };
end;