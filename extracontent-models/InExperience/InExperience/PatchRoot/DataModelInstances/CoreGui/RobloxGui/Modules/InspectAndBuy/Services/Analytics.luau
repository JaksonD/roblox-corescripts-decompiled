local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v3 = require(l_CorePackages_0.Packages.Cryo);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local l_EventStreamReporter_0 = require(l_CorePackages_0.Workspace.Packages.TelemetryService).EventStreamReporter;
local v9 = require(script.Parent.Parent.Flags.FFlagAXEnableInspectAndBuyVersionAnalytics);
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_UnifiedLoggingSurface_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface;
local l_UnifiedEventLogConstants_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants;
local l_ItemTypeEnum_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Enums.ItemTypeEnum;
local l_TIMED_OPTION_BY_DAYS_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Constants.TIMED_OPTION_BY_DAYS;
local v15 = {
    SEND_EVENT_DEFERRED = 0, 
    SEND_EVENT_IMMEDIATELY = 1, 
    SEND_ROBLOX_TELEMETRY_EVENT = 2
};
local v16 = {};
v16.__index = v16;
v16.__tostring = function() --[[ Line: 40 ]]
    return "Service(Analytics)";
end;
v16.new = function(v17, v18, v19) --[[ Line: 46 ]] --[[ Name: new ]]
    -- upvalues: v16 (copy), l_EventStreamReporter_0 (copy), l_default_0 (copy), l_Players_0 (copy), v9 (copy), l_UnifiedEventLogEnums_0 (copy), l_TIMED_OPTION_BY_DAYS_0 (copy), l_ItemTypeEnum_0 (copy), l_UserInputService_0 (copy), l_HttpService_0 (copy), l_RunService_0 (copy), l_RbxAnalyticsService_0 (copy)
    local v20 = {};
    setmetatable(v20, v16);
    v20.eventStream = l_EventStreamReporter_0.new(l_default_0);
    v20.pid = tostring(game.PlaceId);
    v20.uid = tostring(l_Players_0.LocalPlayer.UserId);
    v20.feature = "inspectAndBuy";
    v20.inspecteeUid = v17;
    v20.ctx = v18;
    v20.version = if v9 then v19 else nil;
    v20.reportOpenInspectMenu = function() --[[ Line: 60 ]] --[[ Name: reportOpenInspectMenu ]]
        -- upvalues: v20 (copy)
        v20:report("inspectUser", {});
    end;
    v20.reportTryOnButtonClicked = function(v21, v22) --[[ Line: 67 ]] --[[ Name: reportTryOnButtonClicked ]]
        -- upvalues: v20 (copy)
        local v23 = {
            itemType = v21, 
            itemID = v22
        };
        v20:report("tryItem", v23);
    end;
    v20.reportFavoriteItem = function(v24, v25, v26, v27, v28, v29) --[[ Line: 77 ]] --[[ Name: reportFavoriteItem ]]
        -- upvalues: v20 (copy)
        local v30 = {
            itemType = v24, 
            itemID = v25, 
            favorite = v26, 
            success = v27, 
            failureReason = v28, 
            favoriteCount = v29
        };
        v20:report("favoriteItem", v30);
    end;
    v20.reportPurchaseAttempt = function(v31, v32) --[[ Line: 91 ]] --[[ Name: reportPurchaseAttempt ]]
        -- upvalues: v20 (copy)
        local v33 = {
            itemType = v31, 
            itemID = v32
        };
        v20:report("purchaseAttemptItem", v33);
    end;
    v20.reportPurchaseAttemptUnifiedEvent = function(v34, v35, v36) --[[ Line: 101 ]] --[[ Name: reportPurchaseAttemptUnifiedEvent ]]
        -- upvalues: v20 (copy), l_UnifiedEventLogEnums_0 (ref), l_TIMED_OPTION_BY_DAYS_0 (ref), l_ItemTypeEnum_0 (ref)
        v20:reportUnifiedEvent({
            action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_ATTEMPT, 
            itemId = v35, 
            itemType = v34, 
            organicTimedOption = if v36.timedOptionDays ~= nil then l_TIMED_OPTION_BY_DAYS_0[v36.timedOptionDays] else nil, 
            assetType = if v34 == l_ItemTypeEnum_0.Asset then v36.itemSubType else nil, 
            bundleType = if v34 == l_ItemTypeEnum_0.Bundle then v36.itemSubType else nil, 
            organicItemPrice = v36.price or 0
        });
        local v37 = {
            itemType = v34, 
            itemID = v35
        };
        v20:report("purchaseAttemptItem", v37);
    end;
    v20.reportPurchaseSuccessUnifiedEvent = function(v38, v39, v40) --[[ Line: 123 ]] --[[ Name: reportPurchaseSuccessUnifiedEvent ]]
        -- upvalues: v20 (copy), l_UnifiedEventLogEnums_0 (ref), l_TIMED_OPTION_BY_DAYS_0 (ref), l_ItemTypeEnum_0 (ref)
        v20:reportUnifiedEvent({
            action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_SUCCESS, 
            itemId = v39, 
            itemType = v38, 
            organicTimedOption = if v40.timedOptionDays ~= nil then l_TIMED_OPTION_BY_DAYS_0[v40.timedOptionDays] else nil, 
            assetType = if v38 == l_ItemTypeEnum_0.Asset then v40.itemSubType else nil, 
            bundleType = if v38 == l_ItemTypeEnum_0.Bundle then v40.itemSubType else nil, 
            organicItemPrice = v40.price or 0
        });
        local v41 = {
            itemType = v38, 
            itemID = v39
        };
        v20:report("purchaseSuccessItem", v41);
    end;
    v20.reportPurchaseSuccess = function(v42, v43) --[[ Line: 145 ]] --[[ Name: reportPurchaseSuccess ]]
        -- upvalues: v20 (copy)
        local v44 = {
            itemType = v42, 
            itemID = v43
        };
        v20:report("purchaseSuccessItem", v44);
    end;
    v20.reportItemDetailPageOpened = function(v45, v46) --[[ Line: 159 ]] --[[ Name: reportItemDetailPageOpened ]]
        -- upvalues: v20 (copy)
        local v47 = {
            itemType = v45, 
            itemID = v46
        };
        v20:report("itemDetailView", v47);
    end;
    v20.platformStr = (function() --[[ Line: 169 ]] --[[ Name: getPlatformString ]]
        -- upvalues: l_UserInputService_0 (ref), l_HttpService_0 (ref)
        local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
        local v49 = "Unknown";
        if l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows then
            return "Windows";
        elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX then
            return "OSX";
        elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then
            return "IOS";
        else
            if l_l_UserInputService_0_Platform_0 == Enum.Platform.Android then
                local l_l_HttpService_0_UserAgent_0 = l_HttpService_0:GetUserAgent();
                v49 = string.find(l_l_HttpService_0_UserAgent_0, "AmazonAppStore") and "Amazon" or "Android";
                if string.find(l_l_HttpService_0_UserAgent_0, "OculusQuest3Store") then
                    return "Quest";
                end;
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne or l_l_UserInputService_0_Platform_0 == Enum.Platform.XBox360 then
                return "XBox";
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP then
                return "UWP";
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.PS4 or l_l_UserInputService_0_Platform_0 == Enum.Platform.PS3 or l_l_UserInputService_0_Platform_0 == Enum.Platform.PS5 then
                v49 = "PlayStation";
            end;
            return v49;
        end;
    end)();
    v20.sendCounter = function(v51) --[[ Line: 202 ]] --[[ Name: sendCounter ]]
        -- upvalues: l_RunService_0 (ref), v20 (copy), l_RbxAnalyticsService_0 (ref)
        if l_RunService_0:IsStudio() then
            return;
        else
            local v52 = "inspectAndBuy" .. "_" .. v20.platformStr .. "_" .. v51;
            l_RbxAnalyticsService_0:ReportCounter(v52);
            return;
        end;
    end;
    return v20;
end;
v16.report = function(v53, v54, v55) --[[ Line: 214 ]] --[[ Name: report ]]
    -- upvalues: v15 (copy), v9 (copy), v3 (copy)
    local v56 = {
        pid = v53.pid, 
        uid = v53.uid, 
        inspecteeUid = v53.inspecteeUid, 
        feature = "inspectAndBuy", 
        event_sender_api = v15.SEND_ROBLOX_TELEMETRY_EVENT, 
        inspectAndBuyVersion = if v9 then v53.version else nil
    };
    local v57 = v3.Dictionary.join(v56, v55);
    v53.eventStream:sendTelemetryEvent(v53.ctx, v54, v57);
end;
v16.reportUnifiedEvent = function(v58, v59) --[[ Line: 228 ]] --[[ Name: reportUnifiedEvent ]]
    -- upvalues: l_UnifiedLoggingSurface_0 (copy), v3 (copy), l_UnifiedEventLogConstants_0 (copy)
    local v60 = {
        surface = l_UnifiedLoggingSurface_0.IN_EXPERIENCE_INSPECT_BUY
    };
    local v61 = v3.Dictionary.join(v60, v59);
    v58.eventStream:sendTelemetryEvent(v58.ctx, l_UnifiedEventLogConstants_0.EVENT_NAME, v61);
end;
return v16;