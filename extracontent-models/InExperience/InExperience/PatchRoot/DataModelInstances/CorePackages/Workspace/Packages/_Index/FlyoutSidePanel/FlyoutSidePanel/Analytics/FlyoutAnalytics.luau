local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = script:FindFirstAncestor("FlyoutSidePanel").Parent;
local v2 = require(l_Parent_0.LoggingProtocol);
local v3 = require(script.Parent.Parent.Config.FlyoutContentSettings);
local l_default_0 = v2.default;
local v5 = game:DefineFastFlag("FlyoutRemoveAddSessionInfo", false);
local v6 = {
    eventName = "coreui_flyout_side_panel_open", 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = game:DefineFastInt("FlyoutSidePanelOpenEventThrottleHunderedthsPercent", 10000), 
    lastUpdated = {
        2025, 
        10, 
        30
    }, 
    description = "FlyoutSidePanel open event, source can be Home, Chat, or Charts", 
    links = "https://roblox.atlassian.net/browse/APPEXP-3739"
};
local v7 = {
    eventName = "coreui_flyout_side_panel_close", 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = game:DefineFastInt("FlyoutSidePanelCloseEventThrottleHunderedthsPercent", 10000), 
    lastUpdated = {
        2025, 
        10, 
        30
    }, 
    description = "FlyoutSidePanel close event, source can be click, swipe, or shield", 
    links = "https://github.rbx.com/Roblox/proto-schemas/pull/8500"
};
local v8 = {
    eventName = "coreui_flyout_tooltip_show", 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = game:DefineFastInt("FlyoutTooltipShowEventThrottleHunderedthsPercent", 10000), 
    lastUpdated = {
        2026, 
        1, 
        21
    }, 
    description = "Flyout tooltip show event", 
    links = "https://github.rbx.com/Roblox/proto-schemas/pull/9318"
};
local v9 = {
    eventName = "coreui_flyout_tooltip_dismiss", 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = game:DefineFastInt("FlyoutTooltipDismissEventThrottleHunderedthsPercent", 10000), 
    lastUpdated = {
        2025, 
        10, 
        30
    }, 
    description = "Flyout tooltip dismiss event, source can be click or shield", 
    links = "https://github.rbx.com/Roblox/proto-schemas/pull/8500"
};
local v10 = {
    eventName = "coreui_flyout_content_item_click", 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = game:DefineFastInt("FlyoutContentItemClickEventThrottleHunderedthsPercent", 10000), 
    lastUpdated = {
        2025, 
        10, 
        30
    }, 
    description = "FlyoutSidePanel content item click event", 
    links = "https://github.rbx.com/Roblox/proto-schemas/pull/8500"
};
local function _(v11) --[[ Line: 64 ]] --[[ Name: checkEventNameMappings ]]
    -- upvalues: v3 (copy)
    if v11 and v3.EventNameMappings[v11] then
        return v3.EventNameMappings[v11];
    else
        return v11 or "";
    end;
end;
local function v18(v13, v14, v15) --[[ Line: 71 ]] --[[ Name: logEventHelper ]]
    -- upvalues: v5 (copy), v3 (copy), l_default_0 (copy)
    local v16 = if v5 then {
        "addPlaceId", 
        "addUniverseId", 
        "addPlaceInstanceId", 
        "addSessionId", 
        "addOsInfo"
    } else {
        "addPlaceId", 
        "addUniverseId", 
        "addPlaceInstanceId", 
        "addSessionId", 
        "addSessionInfo", 
        "addOsInfo"
    };
    local l_integrationId_0 = v15.integrationId;
    l_integrationId_0 = {
        integration_id = if l_integrationId_0 and v3.EventNameMappings[l_integrationId_0] then v3.EventNameMappings[l_integrationId_0] else l_integrationId_0 or "", 
        source = v15.source, 
        local_timestamp = os.time(), 
        count = v15.count
    };
    l_default_0:logRobloxTelemetryEvent(v13, v16, l_integrationId_0, v14);
end;
local function v20(v19) --[[ Line: 93 ]] --[[ Name: onFlyoutSidePanelClosed ]]
    -- upvalues: v18 (copy), v7 (copy)
    v18(v7, "flyout_close", v19);
end;
local function v22(v21) --[[ Line: 97 ]] --[[ Name: onFlyoutTooltipShown ]]
    -- upvalues: v18 (copy), v8 (copy)
    v18(v8, "flyout_tooltip_show", v21);
end;
local function v24(v23) --[[ Line: 101 ]] --[[ Name: onFlyoutTooltipDismissed ]]
    -- upvalues: v18 (copy), v9 (copy)
    v18(v9, "flyout_tooltip_dismiss", v23);
end;
local function v26(v25) --[[ Line: 105 ]] --[[ Name: onFlyoutContentItemClicked ]]
    -- upvalues: v18 (copy), v10 (copy), v7 (copy)
    v18(v10, "flyout_item_click", v25);
    v18(v7, "flyout_close", v25);
end;
local function _(v27, v28, v29, v30) --[[ Line: 111 ]] --[[ Name: sendMoreGridItemClickEvent_legacy ]]
    v27:setRBXEventStream("moreGridItem", "moreGridItemClick", {
        itemType = v28, 
        localUserId = v29, 
        url = v30
    });
end;
return {
    onFlyoutSidePanelClosed = v20, 
    onFlyoutTooltipShown = v22, 
    onFlyoutTooltipDismissed = v24, 
    onFlyoutContentItemClicked = v26, 
    sendMoreLegacyAndFlyoutItemClickEvent = function(v32, v33, v34, v35) --[[ Line: 119 ]] --[[ Name: sendMoreLegacyAndFlyoutItemClickEvent ]]
        -- upvalues: v3 (copy), v18 (copy), v10 (copy), v7 (copy)
        local v36 = if v33 and v3.EventNameMappings[v33] then v3.EventNameMappings[v33] else v33 or "";
        local v37 = {
            integrationId = v36, 
            source = "click"
        };
        v18(v10, "flyout_item_click", v37);
        v18(v7, "flyout_close", v37);
        v32:setRBXEventStream("moreGridItem", "moreGridItemClick", {
            itemType = v36, 
            localUserId = v34, 
            url = v35
        });
    end, 
    sendPageLoadEvent = function(v38, v39) --[[ Line: 125 ]] --[[ Name: sendPageLoadEvent ]]
        -- upvalues: l_LocalizationService_0 (copy), v18 (copy), v6 (copy)
        v38:setRBXEventStream("AppRouter", "luaPageLoad", {
            locale = l_LocalizationService_0.RobloxLocaleId, 
            page = "more", 
            rootPageTitle = v39
        });
        v18(v6, "flyout_open", {
            source = v39
        });
    end
};