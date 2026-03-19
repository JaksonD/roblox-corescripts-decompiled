local l_Parent_0 = script:FindFirstAncestor("FriendsCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.SocialLuaAnalytics);
local v4 = require(l_Parent_0.LoggingProtocol);
local v5 = game:DefineFastInt("PresenceImpressionLoggingThrottlePerMyriad", 10000);
local v6 = v3.Telemetry.createEmitter({
    telemetryImpl = v4.default, 
    defaultTelemetryConfig = {
        throttlingThousandths = v5, 
        links = "https://docs.google.com/document/d/1uj9vb188k-wC2u3U3-UX3fm7xLffIbbvF7BDq3hs2Ak"
    }, 
    getSharedInfo = function() --[[ Line: 29 ]] --[[ Name: getSharedInfo ]]
        return {};
    end
});
local v9 = v3.Telemetry.new({
    name = "PresenceImpression", 
    description = "Emitted when the presence status of a friend updates on the client", 
    lastUpdated = {
        2025, 
        4, 
        10
    }, 
    backendsList = {
        {
            type = "EventIngest", 
            format = function(v7, _) --[[ Line: 41 ]] --[[ Name: format ]]
                return v7;
            end
        }
    }
});
areEqual = function(v10, v11) --[[ Line: 48 ]] --[[ Name: areEqual ]]
    local v12 = false;
    if v10.userPresenceType == v11.userPresenceType then
        v12 = v10.placeId == v11.placeId;
    end;
    return v12;
end;
usePresenceImpressionEvents = function(v13) --[[ Line: 52 ]] --[[ Name: usePresenceImpressionEvents ]]
    -- upvalues: v1 (copy), v2 (copy), v6 (copy), v9 (copy)
    local v14, v15 = v1.useState({});
    v1.useEffect(function() --[[ Line: 55 ]]
        -- upvalues: v13 (copy), v2 (ref), v14 (copy), v6 (ref), v9 (ref), v15 (copy)
        local v16 = {};
        for _, v18 in pairs(v13) do
            v16[v18.id] = v18.presence;
        end;
        local v19 = false;
        local v20 = v2.Dictionary.join(v14, v16);
        for v21, v22 in pairs(v20) do
            if v16[v21] == nil then
                v6.emit(v9, {
                    observedUserId = v21, 
                    presenceType = "Offline", 
                    lastLocation = "Website", 
                    implementationVariant = "UniversalAppGraphQL"
                });
                v19 = true;
            elseif v14[v21] == nil or not areEqual(v14[v21], v16[v21]) then
                local v23 = {
                    observedUserId = v22.id, 
                    presenceType = v22.userPresenceType, 
                    placeId = v22.placeId, 
                    universeId = v22.universeId, 
                    gameId = v22.gameId, 
                    lastLocation = v22.lastLocation, 
                    implementationVariant = "UniversalAppGraphQL"
                };
                v6.emit(v9, v23);
                v19 = true;
            end;
        end;
        if v19 then
            v15(v16);
        end;
    end, {
        v13
    });
end;
return usePresenceImpressionEvents;