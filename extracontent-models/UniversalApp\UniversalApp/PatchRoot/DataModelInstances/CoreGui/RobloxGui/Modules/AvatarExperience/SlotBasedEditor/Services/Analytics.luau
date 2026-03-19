local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_AnalyticsService_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).AnalyticsService;
local l_ImpressionEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXImproveSlotBasedEditorPerformance);
local v6 = {};
local v7 = nil;
local function _(v8) --[[ Line: 15 ]] --[[ Name: getSlotBasedEditorAnalyticsInner ]]
    -- upvalues: l_ImpressionEnums_0 (copy), v5 (copy), v7 (ref)
    local v11 = {
        slotClick = function(v9) --[[ Line: 18 ]] --[[ Name: slotClick ]]
            -- upvalues: l_ImpressionEnums_0 (ref), v8 (copy)
            local v10 = {
                actionType = l_ImpressionEnums_0.ActionType.UI_BUTTON_CLICK, 
                subcategory = v9.editorSubcategory, 
                surface = l_ImpressionEnums_0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY, 
                event_sender_api = l_ImpressionEnums_0.MarketplaceEventSenderAPI.SEND_ROBLOX_TELEMETRY_EVENT
            };
            v8.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", v10);
        end
    };
    if v5 then
        v7 = v11;
    end;
    return v11;
end;
v6.get = function(_) --[[ Line: 38 ]] --[[ Name: get ]]
    -- upvalues: v5 (copy), v7 (ref), l_AnalyticsService_0 (copy), l_ImpressionEnums_0 (copy)
    if v5 and v7 then
        return v7;
    else
        local l_l_AnalyticsService_0_0 = l_AnalyticsService_0;
        local v17 = {
            slotClick = function(v15) --[[ Line: 18 ]] --[[ Name: slotClick ]]
                -- upvalues: l_ImpressionEnums_0 (ref), l_l_AnalyticsService_0_0 (copy)
                local v16 = {
                    actionType = l_ImpressionEnums_0.ActionType.UI_BUTTON_CLICK, 
                    subcategory = v15.editorSubcategory, 
                    surface = l_ImpressionEnums_0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY, 
                    event_sender_api = l_ImpressionEnums_0.MarketplaceEventSenderAPI.SEND_ROBLOX_TELEMETRY_EVENT
                };
                l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", v16);
            end
        };
        if v5 then
            v7 = v17;
        end;
        return v17;
    end;
end;
return v6;