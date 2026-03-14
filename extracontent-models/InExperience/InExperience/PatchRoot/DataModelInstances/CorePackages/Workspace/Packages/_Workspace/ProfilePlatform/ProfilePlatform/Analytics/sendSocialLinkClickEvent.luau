local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local l_flaggedMutedError_0 = require(l_Parent_0.Loggers).flaggedMutedError;
local v3 = require(l_Parent_0.t);
local v4 = if require(l_Parent_0.SharedFlags).FFlagLuaAppAddSocialLinkClickTelemetryToEdp then game:DefineFastInt("SocialLinkClickTelemetryThrottlePermyriad", 0) else nil;
local v5 = v3.strictInterface({
    assignment_id = v3.number, 
    assignment_type = v3.string, 
    social_link_type = v3.string, 
    social_link_url = v3.string, 
    social_link_display_type = v3.string
});
local v6 = {
    eventName = "socialLinkClickEvent", 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = v4, 
    lastUpdated = {
        25, 
        12, 
        9
    }, 
    description = "Event fired from the client every time a social link is clicked", 
    links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/usercommunities/social_link_click_event.proto"
};
return function(v7) --[[ Line: 32 ]]
    -- upvalues: v5 (copy), l_flaggedMutedError_0 (copy), l_TelemetryService_0 (copy), v6 (copy)
    local v8, v9 = v5(v7);
    if not v8 then
        l_flaggedMutedError_0("SocialLinkClickEventInterface", v9);
    end;
    l_TelemetryService_0:LogEvent(v6, {
        standardizedFields = {
            "addSessionInfo"
        }, 
        customFields = v7
    });
end;