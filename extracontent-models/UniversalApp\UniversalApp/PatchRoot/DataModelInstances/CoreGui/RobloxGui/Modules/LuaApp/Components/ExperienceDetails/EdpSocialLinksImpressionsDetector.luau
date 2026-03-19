local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local l_ScreenSizeImpressionsTracker_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ScreenSizeImpressionsTracker;
local v5 = game:DefineFastInt("SocialLinksImpressionsEventHundredthsPercent", 10000);
local v6 = {
    eventName = "EdpSocialLinksImpressions", 
    description = "Impressions for social links on EDP", 
    lastUpdated = {
        25, 
        12, 
        10
    }, 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = v5
};
return function(v7) --[[ Line: 31 ]]
    -- upvalues: v2 (copy), l_TelemetryService_0 (copy), v6 (copy), l_ScreenSizeImpressionsTracker_0 (copy)
    local v15 = v2.useCallback(function(v8) --[[ Line: 32 ]]
        -- upvalues: v7 (copy), l_TelemetryService_0 (ref), v6 (ref)
        if #v8 == 0 or v7.socialLinks == nil then
            return;
        else
            local v9 = {};
            local v10 = {};
            local v11 = {};
            for v12 = 1, #v8 do
                local v13 = v7.socialLinks[v12];
                if v13 then
                    table.insert(v9, v12);
                    table.insert(v10, v13.url or "");
                    table.insert(v11, v13.type or "");
                end;
            end;
            local v14 = {
                item_positions = table.concat(v9, ","), 
                social_link_urls = table.concat(v10, ","), 
                social_link_types = table.concat(v11, ","), 
                social_link_display_type = "badge", 
                assignment_id = tonumber(v7.universeId), 
                assignment_type = "game", 
                page = v7.pageContext
            };
            l_TelemetryService_0:LogEvent(v6, {
                customFields = v14, 
                standardizedFields = {
                    "addSessionInfo"
                }
            });
            return;
        end;
    end, {
        v7.socialLinks, 
        v7.universeId, 
        v7.pageContext
    });
    return v2.createElement(l_ScreenSizeImpressionsTracker_0, {
        parentRef = v7.parentRef, 
        pageContext = v7.pageContext, 
        impressionsTag = v7.impressionsTag, 
        scrollViewPositionChangedSignal = v7.scrollViewPositionChangedSignal, 
        sendImpressions = v15
    });
end;