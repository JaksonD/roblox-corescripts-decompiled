local l_GuiService_0 = game:GetService("GuiService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local l_NotificationService_0 = game:GetService("NotificationService");
local l_HttpService_0 = game:GetService("HttpService");
local v6 = require(l_CorePackages_0.Workspace.Packages.ScreenTime);
local l_HttpRequests_0 = v6.HttpRequests;
local l_Constants_0 = v6.Constants;
local l_GetFFlagScreenTimeSignalR_0 = v6.GetFFlagScreenTimeSignalR;
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v11 = require(l_RobloxGui_0.Modules.ErrorPrompt);
local function _() --[[ Line: 16 ]] --[[ Name: leaveGame ]]
    -- upvalues: l_GuiService_0 (copy)
    l_GuiService_0.SelectedCoreObject = nil;
    game:Shutdown();
end;
local v13 = {
    Warning = 1, 
    Lockout = 2, 
    OpenWebView = 3
};
local v14 = l_HttpRequests_0:new(l_HttpService_0);
local v15 = nil;
local function _() --[[ Line: 32 ]] --[[ Name: disconnectAndLeaveGame ]]
    -- upvalues: v15 (ref), l_GuiService_0 (copy)
    if v15 then
        v15:Disconnect();
        v15 = nil;
    end;
    l_GuiService_0.SelectedCoreObject = nil;
    game:Shutdown();
end;
local v25 = {
    pendingResolveMessage = {}, 
    displaying = nil, 
    resolvedMessage = {}, 
    displayMessageCallback = nil, 
    update = function(v17, v18) --[[ Line: 53 ]] --[[ Name: update ]]
        for _, v20 in pairs(v18) do
            local v21 = {
                id = v20.serialId, 
                instructionName = v20.instructionName, 
                message = v20.message, 
                type = v20.type
            };
            table.insert(v17.pendingResolveMessage, v21);
        end;
        v17:processNext();
    end, 
    processNext = function(v22) --[[ Line: 66 ]] --[[ Name: processNext ]]
        if v22.displaying then
            return;
        else
            local v23 = table.remove(v22.pendingResolveMessage, 1);
            if not v23 then
                return;
            elseif v22.resolvedMessage[v23.id] then
                v22:processNext();
                return;
            else
                v22.displaying = v23;
                if v22.displayMessageCallback then
                    v22.displayMessageCallback(v23.message);
                end;
                return;
            end;
        end;
    end, 
    resolve = function(v24) --[[ Line: 88 ]] --[[ Name: resolve ]]
        -- upvalues: v14 (copy)
        v24.resolvedMessage[v24.displaying.id] = v24.displaying.message;
        v14:reportExecution(v24.displaying.instructionName, v24.displaying.id);
        v24.displaying = nil;
        v24:processNext();
    end
};
local v26 = {
    MessageTextScaled = true, 
    HideErrorCode = true, 
    MenuIsOpenKey = "ScreenTimePrompt"
};
local v27 = v11.new("Default", v26);
v27:setParent(l_RobloxGui_0);
local function v29(v28) --[[ Line: 108 ]] --[[ Name: displayMessage ]]
    -- upvalues: v27 (copy)
    v27:_open(v28);
end;
local v30 = {
    {
        Text = "OK", 
        LocalizationKey = "InGame.CommonUI.Button.Ok", 
        LayoutOrder = 1, 
        Callback = function() --[[ Line: 112 ]] --[[ Name: resolveMessage ]]
            -- upvalues: v27 (copy), v25 (copy)
            v27:_close();
            v25:resolve();
        end, 
        Primary = true
    }
};
v25.displayMessageCallback = v29;
v27:updateButtons(v30);
v27:setErrorTitle("Warning", "InGame.CommonUI.Title.Warning");
local l_X_0 = l_RobloxGui_0.AbsoluteSize.X;
local l_Y_0 = l_RobloxGui_0.AbsoluteSize.Y;
local function v35() --[[ Line: 135 ]] --[[ Name: onScreenSizeChanged ]]
    -- upvalues: v27 (copy), l_RobloxGui_0 (copy), l_X_0 (ref), l_Y_0 (ref)
    if not v27 then
        return;
    else
        local l_X_1 = l_RobloxGui_0.AbsoluteSize.X;
        local l_Y_1 = l_RobloxGui_0.AbsoluteSize.Y;
        if l_X_0 ~= l_X_1 or l_Y_0 ~= l_Y_1 then
            l_X_0 = l_X_1;
            l_Y_0 = l_Y_1;
            v27:resizeWidthAndHeight(l_X_0, l_Y_0);
        end;
        return;
    end;
end;
l_RobloxGui_0:GetPropertyChangedSignal("AbsoluteSize"):connect(v35);
if v27 then
    local l_X_2 = l_RobloxGui_0.AbsoluteSize.X;
    local l_Y_2 = l_RobloxGui_0.AbsoluteSize.Y;
    if l_X_0 ~= l_X_2 or l_Y_0 ~= l_Y_2 then
        l_X_0 = l_X_2;
        l_Y_0 = l_Y_2;
        v27:resizeWidthAndHeight(l_X_0, l_Y_0);
    end;
end;
local function v42(v38) --[[ Line: 151 ]] --[[ Name: screenTimeStatesUpdated ]]
    -- upvalues: v13 (copy), v15 (ref), l_GuiService_0 (copy), v25 (copy)
    local v39 = {};
    for _, v41 in ipairs(v38) do
        if v41.type == v13.Warning then
            table.insert(v39, v41);
        elseif v41.type == v13.Lockout then
            if v15 then
                v15:Disconnect();
                v15 = nil;
            end;
            l_GuiService_0.SelectedCoreObject = nil;
            game:Shutdown();
            return;
        elseif v41.type == v13.OpenWebView then

        end;
    end;
    v25:update(v39);
end;
local function _() --[[ Line: 170 ]] --[[ Name: requestInstructions ]]
    -- upvalues: v14 (copy), v42 (copy), l_Logging_0 (copy)
    v14:getInstructions(function(v43, v44, v45) --[[ Line: 171 ]]
        -- upvalues: v42 (ref), l_Logging_0 (ref)
        if v43 then
            v42(v45);
            return;
        elseif v44 then
            l_Logging_0.warn("ScreenTimeInGame requestInstructions failed: unauthorized");
            return;
        else
            l_Logging_0.warn("ScreenTimeInGame requestInstructions failed: error");
            return;
        end;
    end);
end;
v15 = l_NotificationService_0.RobloxEventReceived:Connect(function(v47) --[[ Line: 183 ]]
    -- upvalues: l_GetFFlagScreenTimeSignalR_0 (copy), l_Constants_0 (copy), v14 (copy), v42 (copy), l_Logging_0 (copy), v15 (ref), l_GuiService_0 (copy), l_HttpService_0 (copy)
    if l_GetFFlagScreenTimeSignalR_0() then
        if v47.namespace == l_Constants_0.SIGNALR_NAMESPACE and v47.detailType == l_Constants_0.SIGNALR_TYPE_NEW_INSTRUCTION then
            v14:getInstructions(function(v48, v49, v50) --[[ Line: 171 ]]
                -- upvalues: v42 (ref), l_Logging_0 (ref)
                if v48 then
                    v42(v50);
                    return;
                elseif v49 then
                    l_Logging_0.warn("ScreenTimeInGame requestInstructions failed: unauthorized");
                    return;
                else
                    l_Logging_0.warn("ScreenTimeInGame requestInstructions failed: error");
                    return;
                end;
            end);
            return;
        end;
    elseif v47.namespace == l_Constants_0.HEARTBEAT_NOTIFICATIONS_NAMESPACE then
        if v47.detailType == l_Constants_0.HEARTBEAT_CONSECUTIVE_FAILURE then
            if v15 then
                v15:Disconnect();
                v15 = nil;
            end;
            l_GuiService_0.SelectedCoreObject = nil;
            game:Shutdown();
            return;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 198 ]]
                -- upvalues: l_HttpService_0 (ref), v47 (copy)
                return l_HttpService_0:JSONDecode(v47.detail);
            end);
            if not l_status_0 then
                l_Logging_0.warn("ScreenTimeInGame json decoding failed");
                return;
            elseif l_result_0.notifications == nil then
                l_Logging_0.warn("ScreenTimeInGame empty heartbeat notifications");
                return;
            else
                for _, v54 in ipairs(l_result_0.notifications) do
                    if v54.type == l_Constants_0.HEARTBEAT_NOTIFICATION_TYPE_NEW_INSTRUCTION then
                        v14:getInstructions(function(v55, v56, v57) --[[ Line: 171 ]]
                            -- upvalues: v42 (ref), l_Logging_0 (ref)
                            if v55 then
                                v42(v57);
                                return;
                            elseif v56 then
                                l_Logging_0.warn("ScreenTimeInGame requestInstructions failed: unauthorized");
                                return;
                            else
                                l_Logging_0.warn("ScreenTimeInGame requestInstructions failed: error");
                                return;
                            end;
                        end);
                    end;
                end;
            end;
        end;
    end;
end);