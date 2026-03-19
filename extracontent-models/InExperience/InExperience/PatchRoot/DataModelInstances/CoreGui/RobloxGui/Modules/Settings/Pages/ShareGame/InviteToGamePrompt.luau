local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.Rodux);
local l_Modules_0 = l_RobloxGui_0.Modules;
local l_Settings_0 = l_Modules_0.Settings;
local v9 = require(l_Modules_0.Settings.Pages.ShareGame.Constants);
local l_GameInviteEvents_0 = require(l_CorePackages_0.Workspace.Packages.GameInvite).GameInviteEvents;
local l_ShareGame_0 = l_Settings_0.Pages.ShareGame;
local v12 = require(l_ShareGame_0.Components.FullModalShareGameComponent);
local v13 = require(l_ShareGame_0.AppReducer);
local v14 = require(l_Modules_0.Common.renderWithCoreScriptsStyleProvider);
local v15 = require(l_ShareGame_0.InviteStore);
local v16 = require(l_Modules_0.Flags.GetFFlagEnableSharedInviteStore);
local v17 = require(l_Modules_0.Settings.Flags.GetFFlagAbuseReportAnalyticsHasLaunchData);
local v18 = {};
v18.__index = v18;
v18.new = function(v19) --[[ Line: 40 ]] --[[ Name: new ]]
    -- upvalues: v18 (copy)
    local v20 = {
        mountTarget = v19, 
        isActive = false
    };
    setmetatable(v20, v18);
    return v20;
end;
v18.withSocialServiceAndLocalPlayer = function(v21, v22, v23) --[[ Line: 50 ]] --[[ Name: withSocialServiceAndLocalPlayer ]]
    v21.socialService = v22;
    v21.localPlayer = v23;
    return v21;
end;
v18.withAnalytics = function(v24, v25) --[[ Line: 56 ]] --[[ Name: withAnalytics ]]
    v24.analytics = v25;
    return v24;
end;
v18._createTree = function(v26, v27, v28) --[[ Line: 61 ]] --[[ Name: _createTree ]]
    -- upvalues: v16 (copy), v15 (copy), v6 (copy), v13 (copy), v14 (copy), v5 (copy), v12 (copy)
    local v29 = if v16() then v15 else v6.Store.new(v13, nil, {
        v6.thunkMiddleware
    });
    return v14({
        FullModalShareGame = v5.createElement(v12, {
            store = v29, 
            isVisible = v27, 
            analytics = v26.analytics, 
            promptMessage = v28 and v28.promptMessage, 
            inviteUserId = v28 and v28.inviteUserId, 
            inviteMessageId = v28 and v28.inviteMessageId, 
            launchData = v28 and v28.launchData, 
            isLoading = v28 and v28.isLoading, 
            onAfterClosePage = function(_) --[[ Line: 75 ]] --[[ Name: onAfterClosePage ]]
                -- upvalues: v26 (copy)
                v26:hide({});
            end
        })
    });
end;
v18.show = function(v31, v32) --[[ Line: 89 ]] --[[ Name: show ]]
    -- upvalues: v9 (copy), l_GameInviteEvents_0 (copy), v17 (copy), v5 (copy), l_ContextActionService_0 (copy)
    if v31.isActive then
        return;
    else
        v31.isLoading = v32 and v32.isLoading;
        v31.isActive = not v31.isLoading;
        if v32 then
            local v33 = if v32.inviteUserId then v9.Triggers.DeveloperSingle else v9.Triggers.DeveloperMultiple;
            local v34 = false;
            if v32.launchData ~= nil then
                v34 = v32.launchData ~= "";
            end;
            v31.analytics:sendEvent(v33, l_GameInviteEvents_0.ModalOpened, if v17() then {
                isLaunchDataProvided = v34
            } else nil);
        end;
        if not v31.instance then
            v31.instance = v5.mount(v31:_createTree(true, v32), v31.mountTarget, "invitePrompt");
        else
            v31.instance = v5.update(v31.instance, v31:_createTree(true, v32));
        end;
        if v31.analytics and not v31.isLoading then
            v31.analytics:inputShareGameEntryPoint();
        end;
        l_ContextActionService_0:BindCoreAction("hideInvitePrompt", function(_, v36, _) --[[ Line: 118 ]]
            -- upvalues: v31 (copy)
            if v36 == Enum.UserInputState.Begin then
                v31:hide();
            end;
        end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Backspace);
        return;
    end;
end;
v18.hide = function(v38, _) --[[ Line: 125 ]] --[[ Name: hide ]]
    -- upvalues: v5 (copy), l_ContextActionService_0 (copy), l_GuiService_0 (copy)
    if not v38.isActive and not v38.isLoading then
        return;
    else
        v38.isLoading = false;
        v38.isActive = false;
        v38.instance = v5.update(v38.instance, v38:_createTree(false));
        if v38.socialService and v38.localPlayer then
            v38.socialService:InvokeGameInvitePromptClosed(v38.localPlayer, {});
        end;
        l_ContextActionService_0:UnbindCoreAction("hideInvitePrompt");
        l_GuiService_0.SelectedCoreObject = nil;
        l_GuiService_0:RemoveSelectionGroup("invitePrompt");
        return;
    end;
end;
v18.destruct = function(v40) --[[ Line: 142 ]] --[[ Name: destruct ]]
    -- upvalues: v5 (copy)
    if v40.instance then
        v5.unmount(v40.instance);
    end;
end;
return v18;