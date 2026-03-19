local _ = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local l_NotificationService_0 = game:GetService("NotificationService");
local l_HttpService_0 = game:GetService("HttpService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local v8 = require(l_RobloxGui_0.Modules.ErrorPrompt);
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).Url;
local function _() --[[ Line: 18 ]] --[[ Name: leaveGame ]]
    -- upvalues: l_GuiService_0 (copy)
    l_GuiService_0.SelectedCoreObject = nil;
    game:Shutdown();
end;
local v11 = {
    Warning = 1, 
    Lockout = 2
};
local function _(v12) --[[ Line: 28 ]] --[[ Name: parseResponse ]]
    local l_type_0 = v12.response.state.type;
    local l_messages_0 = v12.response.state.messages;
    return {
        State = l_type_0, 
        Messages = l_messages_0
    };
end;
local _ = function(v16) --[[ Line: 37 ]] --[[ Name: markRead ]]
    -- upvalues: l_Url_0 (copy), l_HttpRbxApiService_0 (copy)
    local v17 = "mesasgeId=" .. v16;
    local v18 = l_Url_0.RCS_URL .. "screen-time-api/v1/messages/mark-read" .. "?" .. v17;
    local _, _ = pcall(l_HttpRbxApiService_0.GetAsyncFullUrl, l_HttpRbxApiService_0, v18);
end;
local v34 = {
    pendingResolveMessage = {}, 
    displaying = nil, 
    resolvedMessage = {}, 
    displayMessageCallback = nil, 
    update = function(v22, v23) --[[ Line: 57 ]] --[[ Name: update ]]
        for _, v25 in pairs(v23) do
            local v26 = {
                id = v25.id, 
                message = v25.text
            };
            table.insert(v22.pendingResolveMessage, v26);
        end;
        v22:processNext();
    end, 
    processNext = function(v27) --[[ Line: 68 ]] --[[ Name: processNext ]]
        -- upvalues: l_Url_0 (copy), l_HttpRbxApiService_0 (copy)
        if v27.displaying then
            return;
        else
            local v28 = table.remove(v27.pendingResolveMessage, 1);
            if not v28 then
                return;
            elseif v27.resolvedMessage[v28.id] then
                v27:processNext();
                return;
            else
                v27.displaying = v28;
                if v27.displayMessageCallback then
                    v27.displayMessageCallback(v28.message);
                end;
                spawn(function() --[[ Line: 88 ]]
                    -- upvalues: v28 (copy), l_Url_0 (ref), l_HttpRbxApiService_0 (ref)
                    local v29 = "mesasgeId=" .. v28.id;
                    local v30 = l_Url_0.RCS_URL .. "screen-time-api/v1/messages/mark-read" .. "?" .. v29;
                    local _, _ = pcall(l_HttpRbxApiService_0.GetAsyncFullUrl, l_HttpRbxApiService_0, v30);
                end);
                return;
            end;
        end;
    end, 
    resolve = function(v33) --[[ Line: 94 ]] --[[ Name: resolve ]]
        v33.resolvedMessage[v33.displaying.id] = v33.displaying.message;
        v33.displaying = nil;
        v33:processNext();
    end
};
local v35 = {
    MessageTextScaled = true, 
    HideErrorCode = true, 
    MenuIsOpenKey = "AnitAddictionPrompt"
};
local v36 = v8.new("Default", v35);
v36:setParent(l_RobloxGui_0);
local function v38(v37) --[[ Line: 110 ]] --[[ Name: displayMessage ]]
    -- upvalues: v36 (copy)
    v36:_open(v37);
end;
local v39 = {
    {
        Text = "OK", 
        LocalizationKey = "InGame.CommonUI.Button.Ok", 
        LayoutOrder = 1, 
        Callback = function() --[[ Line: 114 ]] --[[ Name: resolveMessage ]]
            -- upvalues: v36 (copy), v34 (copy)
            v36:_close();
            v34:resolve();
        end, 
        Primary = true
    }
};
v34.displayMessageCallback = v38;
v36:updateButtons(v39);
v36:setErrorTitle("Warning", "InGame.CommonUI.Title.Warning");
local l_X_0 = l_RobloxGui_0.AbsoluteSize.X;
local l_Y_0 = l_RobloxGui_0.AbsoluteSize.Y;
local function v44() --[[ Line: 136 ]] --[[ Name: onScreenSizeChanged ]]
    -- upvalues: v36 (copy), l_RobloxGui_0 (copy), l_X_0 (ref), l_Y_0 (ref)
    if not v36 then
        return;
    else
        local l_X_1 = l_RobloxGui_0.AbsoluteSize.X;
        local l_Y_1 = l_RobloxGui_0.AbsoluteSize.Y;
        if l_X_0 ~= l_X_1 or l_Y_0 ~= l_Y_1 then
            l_X_0 = l_X_1;
            l_Y_0 = l_Y_1;
            v36:resizeWidthAndHeight(l_X_0, l_Y_0);
        end;
        return;
    end;
end;
l_RobloxGui_0:GetPropertyChangedSignal("AbsoluteSize"):connect(v44);
if v36 then
    local l_X_2 = l_RobloxGui_0.AbsoluteSize.X;
    local l_Y_2 = l_RobloxGui_0.AbsoluteSize.Y;
    if l_X_0 ~= l_X_2 or l_Y_0 ~= l_Y_2 then
        l_X_0 = l_X_2;
        l_Y_0 = l_Y_2;
        v36:resizeWidthAndHeight(l_X_0, l_Y_0);
    end;
end;
local v47 = nil;
local function _(v48) --[[ Line: 154 ]] --[[ Name: antiAddictionStatesUpdated ]]
    -- upvalues: v11 (copy), v47 (ref), l_GuiService_0 (copy), v34 (copy)
    local l_type_1 = v48.response.state.type;
    local l_messages_1 = v48.response.state.messages;
    local v51 = {
        State = l_type_1, 
        Messages = l_messages_1
    };
    if v51.State == v11.Lockout then
        if v47 then
            v47:Disconnect();
        end;
        l_GuiService_0.SelectedCoreObject = nil;
        game:Shutdown();
    end;
    v34:update(v51.Messages);
end;
v47 = l_NotificationService_0.RobloxEventReceived:Connect(function(v53) --[[ Line: 168 ]]
    -- upvalues: l_HttpService_0 (copy), v11 (copy), v47 (ref), l_GuiService_0 (copy), v34 (copy)
    if v53.namespace == "AntiAddictionNotifications" then
        local v54 = l_HttpService_0:JSONDecode(v53.detail);
        local l_type_2 = v54.response.state.type;
        local l_messages_2 = v54.response.state.messages;
        local v57 = {
            State = l_type_2, 
            Messages = l_messages_2
        };
        if v57.State == v11.Lockout then
            if v47 then
                v47:Disconnect();
            end;
            l_GuiService_0.SelectedCoreObject = nil;
            game:Shutdown();
        end;
        v34:update(v57.Messages);
    end;
end);