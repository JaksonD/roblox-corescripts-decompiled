local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_RunService_0 = game:GetService("RunService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v6 = require(l_CorePackages_0.Workspace.Packages.ScreenTime);
local l_HttpRequests_0 = v6.HttpRequests;
local l_Constants_0 = v6.Constants;
local l_GetFFlagScreenTimeSignalR_0 = v6.GetFFlagScreenTimeSignalR;
local l_Utils_0 = v6.Utils;
local v11 = require(l_CorePackages_0.Packages.Roact);
local v12 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v16 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v18 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v19 = require(l_Modules_0.LuaApp.Components.AntiAddictionPrompt);
local v20 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v21 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local v22 = require(l_Modules_0.LuaApp.Components.ScreenGuiWithBlurControl);
local l_Toast_0 = require(l_CorePackages_0.Packages.UIBlox).App.Dialog.Toast;
local v24 = require(l_Modules_0.LuaApp.Constants);
local v25 = require(l_Modules_0.LuaApp.withLocalization);
local v26 = v11.Component:extend("ScreenTimeEventReceiver");
local v27 = {
    Normal = 1, 
    LockedOut = 2, 
    OpenWebView = 3
};
local v28 = {
    Default = 0, 
    LogoutOnClose = 1, 
    Toast = 2
};
local v29 = {
    FullScreen = "fullScreen"
};
v26.showScreenTimeHeartbeatConsecutiveFailurePrompt = function(v30) --[[ Line: 52 ]] --[[ Name: showScreenTimeHeartbeatConsecutiveFailurePrompt ]]
    v30:setState({
        heartbeatConsecutiveFailure = true
    });
end;
v26.init = function(v31) --[[ Line: 58 ]] --[[ Name: init ]]
    -- upvalues: l_HttpRequests_0 (copy), l_HttpService_0 (copy), l_Utils_0 (copy), l_MemStorageService_0 (copy), v27 (copy), l_RunService_0 (copy), l_Logging_0 (copy), l_GetFFlagScreenTimeSignalR_0 (copy), l_Constants_0 (copy), l_RbxAnalyticsService_0 (copy), v18 (copy), v29 (copy)
    local l_RobloxEventReceiver_0 = v31.props.RobloxEventReceiver;
    v31:setState({
        promptsCount = 0, 
        promptsIndex = 0, 
        prompts = {}, 
        heartbeatConsecutiveFailure = false
    });
    v31.setScreenTimePrompts = function(v33) --[[ Line: 68 ]]
        -- upvalues: v31 (copy)
        local v34 = {};
        for _, v36 in ipairs(v33) do
            table.insert(v34, {
                type = v36.type, 
                instructionName = v36.instructionName, 
                id = v36.serialId, 
                title = v36.title, 
                text = v36.message, 
                url = v36.url, 
                modalType = v36.modalType
            });
        end;
        local v37 = #v34;
        v31:setState({
            promptsIndex = 1, 
            promptsCount = v37, 
            prompts = v34
        });
    end;
    v31.screenTimeHttpRequests = l_HttpRequests_0:new(l_HttpService_0);
    v31.screenTimeUtils = l_Utils_0:new({
        globalGetter = function(v38) --[[ Line: 96 ]] --[[ Name: globalGetter ]]
            -- upvalues: l_MemStorageService_0 (ref)
            return l_MemStorageService_0:GetItem(v38);
        end, 
        globalSetter = function(v39, v40) --[[ Line: 99 ]] --[[ Name: globalSetter ]]
            -- upvalues: l_MemStorageService_0 (ref)
            l_MemStorageService_0:SetItem(v39, v40);
        end
    });
    v31.processInstructions = function(v41) --[[ Line: 104 ]]
        -- upvalues: v27 (ref), v31 (copy), l_RunService_0 (ref)
        local v42 = {};
        for _, v44 in ipairs(v41) do
            if v44.type == v27.LockedOut then
                v31.screenTimeUtils:setLockedOut();
            end;
            if v44.type ~= v27.Normal or l_RunService_0:IsRunning() then
                table.insert(v42, v44);
            end;
        end;
        v31.setScreenTimePrompts(v42);
    end;
    v31.requestInstructions = function() --[[ Line: 120 ]]
        -- upvalues: v31 (copy), l_Logging_0 (ref)
        v31.screenTimeHttpRequests:getInstructions(function(v45, v46, v47) --[[ Line: 121 ]]
            -- upvalues: v31 (ref), l_Logging_0 (ref)
            if v45 then
                v31.processInstructions(v47);
                return;
            elseif v46 then
                l_Logging_0.warn("ScreenTimeEventReceiver requestInstructions failed: unauthorized");
                v31.props.doLogout(v31.props.networking, v31.props.guiService);
                return;
            else
                l_Logging_0.warn("ScreenTimeEventReceiver requestInstructions failed: error");
                return;
            end;
        end);
    end;
    v31.tokens = {};
    if l_GetFFlagScreenTimeSignalR_0() then
        local v50 = l_RobloxEventReceiver_0:observeEvent(l_Constants_0.SIGNALR_NAMESPACE, function(_, v49) --[[ Line: 138 ]]
            -- upvalues: l_Constants_0 (ref), v31 (copy)
            if v49 == l_Constants_0.SIGNALR_TYPE_NEW_INSTRUCTION then
                v31.requestInstructions();
            end;
        end);
        table.insert(v31.tokens, v50);
    else
        local v55 = l_RobloxEventReceiver_0:observeEvent(l_Constants_0.HEARTBEAT_NOTIFICATIONS_NAMESPACE, function(v51, v52) --[[ Line: 148 ]]
            -- upvalues: l_Constants_0 (ref), v31 (copy), l_Logging_0 (ref)
            if v52 == l_Constants_0.HEARTBEAT_CONSECUTIVE_FAILURE then
                v31:showScreenTimeHeartbeatConsecutiveFailurePrompt();
                return;
            elseif v51.notifications == nil then
                l_Logging_0.warn("ScreenTimeEventReceiver empty heartbeat notifications");
                return;
            else
                for _, v54 in ipairs(v51.notifications) do
                    if v54.type == l_Constants_0.HEARTBEAT_NOTIFICATION_TYPE_NEW_INSTRUCTION then
                        v31.requestInstructions();
                    end;
                end;
                return;
            end;
        end);
        table.insert(v31.tokens, v55);
    end;
    v31.ok = function() --[[ Line: 168 ]]
        -- upvalues: v31 (copy), v27 (ref)
        local l_promptsIndex_0 = v31.state.promptsIndex;
        local v57 = v31.state.prompts[l_promptsIndex_0];
        v31.screenTimeHttpRequests:reportExecution(v57.instructionName, v57.id);
        if v57.type == v27.LockedOut then
            return;
        else
            if v57.type == v27.OpenWebView then
                v31.openWebView(v57.url);
            end;
            l_promptsIndex_0 = l_promptsIndex_0 + 1;
            if v31.state.promptsCount < l_promptsIndex_0 then
                v31:setState({
                    promptsIndex = 0, 
                    promptsCount = 0
                });
                return;
            else
                v31:setState({
                    promptsIndex = l_promptsIndex_0
                });
                return;
            end;
        end;
    end;
    v31.toastDismissed = function() --[[ Line: 194 ]]
        -- upvalues: v31 (copy)
        local l_promptsIndex_1 = v31.state.promptsIndex;
        local v59 = v31.state.prompts[l_promptsIndex_1];
        v31.screenTimeHttpRequests:reportExecution(v59.instructionName, v59.id);
        l_promptsIndex_1 = l_promptsIndex_1 + 1;
        if v31.state.promptsCount < l_promptsIndex_1 then
            v31:setState({
                promptsIndex = 0, 
                promptsCount = 0
            });
            return;
        else
            v31:setState({
                promptsIndex = l_promptsIndex_1
            });
            return;
        end;
    end;
    v31.heartbeatConsecutiveFailureLogoutCallback = function() --[[ Line: 214 ]]
        -- upvalues: l_RbxAnalyticsService_0 (ref)
        l_RbxAnalyticsService_0:ReportCounter("ScreenTime-LogoutAfterConsecutiveHeartbeatFailure-FromApp");
    end;
    v31.openWebView = function(v60) --[[ Line: 218 ]]
        -- upvalues: v31 (copy), v18 (ref), l_HttpService_0 (ref), v29 (ref)
        local l_guiService_0 = v31.props.guiService;
        local l_SDK_OPEN_URL_0 = v18.SDK_OPEN_URL;
        l_guiService_0:BroadcastNotification(l_HttpService_0:JSONEncode({
            url = v60, 
            encodeUrl = false, 
            type = v29.FullScreen
        }), l_SDK_OPEN_URL_0);
    end;
end;
v26.render = function(v63) --[[ Line: 238 ]] --[[ Name: render ]]
    -- upvalues: v28 (copy), v11 (copy), l_CoreGui_0 (copy), v22 (copy), v24 (copy), l_Toast_0 (copy), v19 (copy), v27 (copy), v25 (copy)
    local v64 = nil;
    if v63.state.promptsCount > 0 then
        local l_promptsIndex_2 = v63.state.promptsIndex;
        local v66 = v63.state.prompts[l_promptsIndex_2];
        local l_type_0 = v66.type;
        local v68 = v66.id or "";
        local l_text_0 = v66.text;
        v64 = if v66.modalType == v28.Toast then v11.createElement(v11.Portal, {
            target = l_CoreGui_0
        }, {
            ["prompt:" .. v68] = v11.createElement(v22, {
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                DisplayOrder = v24.DisplayOrder.AntiAddictionPrompt
            }, {
                Toast = v11.createElement(l_Toast_0, {
                    toastContent = {
                        toastTitle = l_text_0, 
                        onDismissed = v63.toastDismissed
                    }, 
                    duration = 5
                })
            })
        }) else v11.createElement(v11.Portal, {
            target = l_CoreGui_0
        }, {
            ["prompt:" .. v68] = v11.createElement(v19, {
                okCallback = v63.ok, 
                logoutCallback = v63.ok, 
                message = l_text_0, 
                lockOut = l_type_0 == v27.LockedOut
            })
        });
    end;
    if v63.state.heartbeatConsecutiveFailure then
        v64 = v25({
            heartbeatConsecutiveFailureMessage = "Feature.Screentime.Description.HeartbeatConsecutiveFailure"
        })(function(v70) --[[ Line: 281 ]]
            -- upvalues: v11 (ref), l_CoreGui_0 (ref), v19 (ref), v63 (copy)
            local l_heartbeatConsecutiveFailureMessage_0 = v70.heartbeatConsecutiveFailureMessage;
            return v11.createElement(v11.Portal, {
                target = l_CoreGui_0
            }, {
                hearbeatFailurePrompt = v11.createElement(v19, {
                    logoutCallback = v63.heartbeatConsecutiveFailureLogoutCallback, 
                    message = l_heartbeatConsecutiveFailureMessage_0, 
                    lockOut = true
                })
            });
        end);
    end;
    return v64;
end;
v26.willUnmount = function(v72) --[[ Line: 297 ]] --[[ Name: willUnmount ]]
    for _, v74 in pairs(v72.tokens) do
        v74:disconnect();
    end;
end;
v26 = v12.connect(nil, function(v75) --[[ Line: 303 ]]
    -- upvalues: v20 (copy), v21 (copy)
    return {
        doLogout = function(v76, v77) --[[ Line: 305 ]] --[[ Name: doLogout ]]
            -- upvalues: v75 (copy), v20 (ref), v21 (ref)
            v75(v20(v76, v77, v21.ScreenTimeEvent));
        end
    };
end)(v26);
return l_RoactServices_0.connect({
    networking = v16, 
    guiService = l_AppGuiService_0
})(v26);