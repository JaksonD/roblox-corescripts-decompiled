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
local v10 = {
    SEND_EVENT_DEFERRED = 0, 
    SEND_EVENT_IMMEDIATELY = 1, 
    SEND_ROBLOX_TELEMETRY_EVENT = 2
};
local v11 = {};
v11.__index = v11;
v11.__tostring = function() --[[ Line: 26 ]]
    return "Service(Analytics)";
end;
v11.new = function(v12, v13, v14) --[[ Line: 32 ]] --[[ Name: new ]]
    -- upvalues: v11 (copy), l_EventStreamReporter_0 (copy), l_default_0 (copy), l_Players_0 (copy), v9 (copy), l_UserInputService_0 (copy), l_HttpService_0 (copy), l_RunService_0 (copy), l_RbxAnalyticsService_0 (copy)
    local v15 = {};
    setmetatable(v15, v11);
    v15.eventStream = l_EventStreamReporter_0.new(l_default_0);
    v15.pid = tostring(game.PlaceId);
    v15.uid = tostring(l_Players_0.LocalPlayer.UserId);
    v15.feature = "inspectAndBuy";
    v15.inspecteeUid = v12;
    v15.ctx = v13;
    v15.version = if v9 then v14 else nil;
    v15.reportOpenInspectMenu = function() --[[ Line: 46 ]] --[[ Name: reportOpenInspectMenu ]]
        -- upvalues: v15 (copy)
        v15:report("inspectUser", {});
    end;
    v15.reportTryOnButtonClicked = function(v16, v17) --[[ Line: 53 ]] --[[ Name: reportTryOnButtonClicked ]]
        -- upvalues: v15 (copy)
        local v18 = {
            itemType = v16, 
            itemID = v17
        };
        v15:report("tryItem", v18);
    end;
    v15.reportFavoriteItem = function(v19, v20, v21, v22, v23, v24) --[[ Line: 63 ]] --[[ Name: reportFavoriteItem ]]
        -- upvalues: v15 (copy)
        local v25 = {
            itemType = v19, 
            itemID = v20, 
            favorite = v21, 
            success = v22, 
            failureReason = v23, 
            favoriteCount = v24
        };
        v15:report("favoriteItem", v25);
    end;
    v15.reportPurchaseAttempt = function(v26, v27) --[[ Line: 77 ]] --[[ Name: reportPurchaseAttempt ]]
        -- upvalues: v15 (copy)
        local v28 = {
            itemType = v26, 
            itemID = v27
        };
        v15:report("purchaseAttemptItem", v28);
    end;
    v15.reportPurchaseSuccess = function(v29, v30) --[[ Line: 87 ]] --[[ Name: reportPurchaseSuccess ]]
        -- upvalues: v15 (copy)
        local v31 = {
            itemType = v29, 
            itemID = v30
        };
        v15:report("purchaseSuccessItem", v31);
    end;
    v15.reportItemDetailPageOpened = function(v32, v33) --[[ Line: 101 ]] --[[ Name: reportItemDetailPageOpened ]]
        -- upvalues: v15 (copy)
        local v34 = {
            itemType = v32, 
            itemID = v33
        };
        v15:report("itemDetailView", v34);
    end;
    v15.platformStr = (function() --[[ Line: 111 ]] --[[ Name: getPlatformString ]]
        -- upvalues: l_UserInputService_0 (ref), l_HttpService_0 (ref)
        local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
        local v36 = "Unknown";
        if l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows then
            return "Windows";
        elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX then
            return "OSX";
        elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then
            return "IOS";
        else
            if l_l_UserInputService_0_Platform_0 == Enum.Platform.Android then
                local l_l_HttpService_0_UserAgent_0 = l_HttpService_0:GetUserAgent();
                v36 = string.find(l_l_HttpService_0_UserAgent_0, "AmazonAppStore") and "Amazon" or "Android";
                if string.find(l_l_HttpService_0_UserAgent_0, "OculusQuest3Store") then
                    return "Quest";
                end;
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne or l_l_UserInputService_0_Platform_0 == Enum.Platform.XBox360 then
                return "XBox";
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP then
                return "UWP";
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.PS4 or l_l_UserInputService_0_Platform_0 == Enum.Platform.PS3 or l_l_UserInputService_0_Platform_0 == Enum.Platform.PS5 then
                v36 = "PlayStation";
            end;
            return v36;
        end;
    end)();
    v15.sendCounter = function(v38) --[[ Line: 144 ]] --[[ Name: sendCounter ]]
        -- upvalues: l_RunService_0 (ref), v15 (copy), l_RbxAnalyticsService_0 (ref)
        if l_RunService_0:IsStudio() then
            return;
        else
            local v39 = "inspectAndBuy" .. "_" .. v15.platformStr .. "_" .. v38;
            l_RbxAnalyticsService_0:ReportCounter(v39);
            return;
        end;
    end;
    return v15;
end;
v11.report = function(v40, v41, v42) --[[ Line: 156 ]] --[[ Name: report ]]
    -- upvalues: v10 (copy), v9 (copy), v3 (copy)
    local v43 = {
        pid = v40.pid, 
        uid = v40.uid, 
        inspecteeUid = v40.inspecteeUid, 
        feature = "inspectAndBuy", 
        event_sender_api = v10.SEND_ROBLOX_TELEMETRY_EVENT, 
        inspectAndBuyVersion = if v9 then v40.version else nil
    };
    local v44 = v3.Dictionary.join(v43, v42);
    v40.eventStream:sendTelemetryEvent(v40.ctx, v41, v44);
end;
return v11;