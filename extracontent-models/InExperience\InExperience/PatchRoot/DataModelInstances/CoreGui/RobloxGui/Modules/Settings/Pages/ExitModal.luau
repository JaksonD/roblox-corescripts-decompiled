local v0 = {
    EventContext = "educational_popup", 
    ConfirmName = "educational_confirmed", 
    CancelName = "educational_close_app", 
    DismissName = "educational_dismiss_prompt"
};
local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Players_0 = game:GetService("Players");
local l_SharedFlags_0 = l_CorePackages_0.Workspace.Packages.SharedFlags;
local l_GetFFlagGateEducationalPopupVisibilityViaGUAC_0 = require(l_SharedFlags_0).GetFFlagGateEducationalPopupVisibilityViaGUAC;
local l_InExperienceCapabilities_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceCapabilities).InExperienceCapabilities;
local l_l_GuiService_0_NotificationTypeList_0 = l_GuiService_0:GetNotificationTypeList();
local v13 = require(l_CorePackages_0.Packages.Roact);
local l_LinkingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol;
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local v16 = require(l_RobloxGui_0.Modules.InGameMenu.Utility.SendAnalytics);
local v17 = require(l_RobloxGui_0.Modules.InGameMenu.Utility.UserLocalStore);
local l_GetDefaultQualityLevel_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel;
local l_MessageBus_0 = require(l_CorePackages_0.Workspace.Packages.MessageBus).MessageBus;
local l_UIBlox_0 = require(l_CorePackages_0.Packages.InGameMenuDependencies).UIBlox;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_EducationalModal_0 = l_UIBlox_0.App.Dialog.Modal.EducationalModal;
local v23 = require(l_RobloxGui_0.Modules.Common.renderWithCoreScriptsStyleProvider);
local v24 = nil;
local l_Constants_0 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v26 = require(l_RobloxGui_0.Modules.Flags.GetFIntEducationalPopupDisplayMaxCount);
v24 = (function() --[[ Line: 71 ]] --[[ Name: Initialize ]]
    -- upvalues: l_RobloxGui_0 (copy), l_GuiService_0 (copy), v16 (copy), v0 (copy), l_RunService_0 (copy), l_GetDefaultQualityLevel_0 (copy), l_l_GuiService_0_NotificationTypeList_0 (copy), l_LinkingProtocol_0 (copy), v24 (ref), v17 (copy), v26 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v13 (copy), l_EducationalModal_0 (copy), l_Images_0 (copy), l_CoreGui_0 (copy), l_Players_0 (copy), l_MessageBus_0 (copy), l_Constants_0 (copy), v23 (copy)
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    l_NewPage_0.LeaveAppFunc = function(v28) --[[ Line: 75 ]]
        -- upvalues: l_GuiService_0 (ref), v16 (ref), v0 (ref), l_RunService_0 (ref), l_GetDefaultQualityLevel_0 (ref), l_l_GuiService_0_NotificationTypeList_0 (ref)
        l_GuiService_0.SelectedCoreObject = nil;
        v16(v0.EventContext, v0.CancelName, {
            source = v28 and "Native" or "Button"
        });
        l_RunService_0.RenderStepped:wait();
        l_RunService_0.RenderStepped:wait();
        settings().Rendering.QualityLevel = l_GetDefaultQualityLevel_0();
        l_GuiService_0:BroadcastNotification("", l_l_GuiService_0_NotificationTypeList_0.NATIVE_EXIT);
    end;
    l_NewPage_0.LeaveGameFunc = function(v29) --[[ Line: 92 ]]
        -- upvalues: l_GuiService_0 (ref), v16 (ref), v0 (ref), l_LinkingProtocol_0 (ref), l_RunService_0 (ref), l_GetDefaultQualityLevel_0 (ref)
        l_GuiService_0.SelectedCoreObject = nil;
        v16(v0.EventContext, v0.ConfirmName, {
            source = v29 and "Gamepad" or "Button"
        });
        l_LinkingProtocol_0.default:detectURL("roblox://navigation/home");
        l_RunService_0.RenderStepped:wait();
        l_RunService_0.RenderStepped:wait();
        game:Shutdown();
        settings().Rendering.QualityLevel = l_GetDefaultQualityLevel_0();
    end;
    l_NewPage_0.LeaveGameFromHotkey = function(_, v31, v32) --[[ Line: 111 ]]
        -- upvalues: l_NewPage_0 (copy)
        if v31 == Enum.UserInputState.Begin then
            local v33 = true;
            if v32.UserInputType ~= Enum.UserInputType.Gamepad1 then
                v33 = true;
                if v32.UserInputType ~= Enum.UserInputType.Gamepad2 then
                    v33 = true;
                    if v32.UserInputType ~= Enum.UserInputType.Gamepad3 then
                        v33 = v32.UserInputType == Enum.UserInputType.Gamepad4;
                    end;
                end;
            end;
            l_NewPage_0.LeaveGameFunc(v33);
        end;
    end;
    l_NewPage_0.DontLeaveFunc = function(v34) --[[ Line: 121 ]]
        -- upvalues: v24 (ref), l_NewPage_0 (copy)
        v24.dismissedFrom = v34 and "Gamepad" or "Button";
        if l_NewPage_0.HubRef then
            l_NewPage_0.HubRef:PopMenu(v34, true);
        end;
    end;
    l_NewPage_0.DontLeaveFromHotkey = function(_, v36, v37) --[[ Line: 128 ]]
        -- upvalues: l_NewPage_0 (copy)
        if v36 == Enum.UserInputState.Begin then
            local v38 = true;
            if v37.UserInputType ~= Enum.UserInputType.Gamepad1 then
                v38 = true;
                if v37.UserInputType ~= Enum.UserInputType.Gamepad2 then
                    v38 = true;
                    if v37.UserInputType ~= Enum.UserInputType.Gamepad3 then
                        v38 = v37.UserInputType == Enum.UserInputType.Gamepad4;
                    end;
                end;
            end;
            l_NewPage_0.DontLeaveFunc(v38);
        end;
    end;
    l_NewPage_0.DontShowAgain = function() --[[ Line: 139 ]]
        -- upvalues: v17 (ref)
        local v39 = v17.new();
        v39:SetItem("NativeCloseLuaPromptDisplayCount", (tostring(1e999)));
        v39:Flush();
    end;
    l_NewPage_0.ShouldShow = function() --[[ Line: 146 ]]
        -- upvalues: v17 (ref), v26 (ref)
        local v40 = v17.new();
        local v41 = tonumber(v40:GetItem("NativeCloseLuaPromptDisplayCount"));
        if v26() < v41 then
            return false;
        else
            v40:SetItem("NativeCloseLuaPromptDisplayCount", (tostring(v41 + 1)));
            v40:Flush();
            return true;
        end;
    end;
    l_NewPage_0.TabHeader = nil;
    l_NewPage_0.Page.Name = "ExitModalPage";
    l_NewPage_0.ShouldShowBottomBar = false;
    l_NewPage_0.ShouldShowHubBar = false;
    l_NewPage_0.IsPageClipped = false;
    l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, 1);
    local v42 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    local function v49() --[[ Line: 173 ]] --[[ Name: ExitModal ]]
        -- upvalues: v42 (copy), l_LocalizationService_0 (ref), v13 (ref), l_EducationalModal_0 (ref), l_Images_0 (ref), l_CoreGui_0 (ref), l_NewPage_0 (copy), l_Players_0 (ref), l_MessageBus_0 (ref), l_Constants_0 (ref), v23 (ref)
        v42:SetLocale(l_LocalizationService_0.RobloxLocaleId);
        local v43 = {
            title = v42:Format("CoreScripts.InGameMenu.ExitModal.Title"), 
            subtitle = v42:Format("CoreScripts.InGameMenu.ExitModal.Subtitle"), 
            bodyTextOpenMenu = v42:Format("CoreScripts.InGameMenu.ExitModal.BodyTextOpenMenu"), 
            bodyTextClickHome = v42:Format("CoreScripts.InGameMenu.ExitModal.BodyTextClickHome"), 
            optionDontShow = v42:Format("CoreScripts.InGameMenu.ExitModal.OptionDontShow"), 
            actionExit = v42:Format("CoreScripts.InGameMenu.ExitModal.ActionExit"), 
            actionHome = v42:Format("CoreScripts.InGameMenu.ExitModal.ActionHome")
        };
        local v48 = {
            v13.createElement(l_EducationalModal_0, {
                bodyContents = {
                    {
                        text = v43.bodyTextOpenMenu, 
                        isSystemMenuIcon = true
                    }, 
                    {
                        icon = l_Images_0["icons/menu/home_off"], 
                        text = v43.bodyTextClickHome
                    }
                }, 
                hasDoNotShow = true, 
                cancelText = v43.actionExit, 
                confirmText = v43.actionHome, 
                doNotShowText = v43.optionDontShow, 
                titleBackgroundImageProps = {
                    image = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground.jpg", 
                    imageHeight = 200, 
                    text = "<font face=\"GothamBlack\" size=\"42\">" .. v43.title .. "</font><font size=\"4\"><br /></font><br />" .. v43.subtitle
                }, 
                screenSize = l_CoreGui_0.RobloxGui.AbsoluteSize, 
                onDismiss = function() --[[ Line: 209 ]] --[[ Name: onDismiss ]]
                    -- upvalues: l_NewPage_0 (ref)
                    l_NewPage_0.DontLeaveFunc(false);
                end, 
                onCancel = function(v44) --[[ Line: 212 ]] --[[ Name: onCancel ]]
                    -- upvalues: l_NewPage_0 (ref)
                    if v44 then
                        l_NewPage_0.DontShowAgain();
                    end;
                    l_NewPage_0.LeaveAppFunc(false);
                end, 
                onConfirm = function(v45) --[[ Line: 218 ]] --[[ Name: onConfirm ]]
                    -- upvalues: l_NewPage_0 (ref), l_Players_0 (ref), l_MessageBus_0 (ref), l_Constants_0 (ref)
                    if v45 then
                        l_NewPage_0.DontShowAgain();
                    end;
                    l_NewPage_0.LeaveGameFunc(false);
                    local v46 = {
                        chromeSeenCount = tostring(0)
                    };
                    local v47 = tostring(l_Players_0.LocalPlayer.UserId);
                    l_MessageBus_0.publish(l_Constants_0.OnSurveyEventDescriptor, {
                        eventType = l_Constants_0.SurveyEventType, 
                        userId = v47, 
                        customProps = v46
                    });
                end
            })
        };
        return v23(v48);
    end;
    local v50 = v13.mount(v49(), l_NewPage_0.Page, "ExitModal");
    local v51 = false;
    local function v52() --[[ Line: 242 ]]
        -- upvalues: v51 (ref), v50 (ref), v13 (ref), v49 (copy)
        if not v51 then
            v51 = true;
            task.delay(1, function() --[[ Line: 245 ]]
                -- upvalues: v51 (ref), v50 (ref), v13 (ref), v49 (ref)
                v51 = false;
                v50 = v13.update(v50, v49());
            end);
        end;
    end;
    l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"):Connect(v52);
    l_CoreGui_0.RobloxGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(v52);
    return l_NewPage_0;
end)();
v24.Displayed.Event:connect(function() --[[ Line: 260 ]]
    -- upvalues: v24 (ref), l_GetFFlagGateEducationalPopupVisibilityViaGUAC_0 (copy), l_InExperienceCapabilities_0 (copy), l_ContextActionService_0 (copy)
    if not v24.ShouldShow() or l_GetFFlagGateEducationalPopupVisibilityViaGUAC_0() and not l_InExperienceCapabilities_0.canViewEducationalPopup then
        v24.LeaveAppFunc(true);
    end;
    v24.dismissedFrom = "Menu";
    l_ContextActionService_0:BindCoreAction("LeaveGameAction", v24.LeaveGameFromHotkey, false, Enum.KeyCode.ButtonA);
    l_ContextActionService_0:BindCoreAction("DontLeaveAction", v24.DontLeaveFromHotkey, false, Enum.KeyCode.ButtonB);
end);
v24.Hidden.Event:connect(function() --[[ Line: 283 ]]
    -- upvalues: v24 (ref), v16 (copy), v0 (copy), l_ContextActionService_0 (copy)
    if v24.dismissedFrom then
        v16(v0.EventContext, v0.DismissName, {
            source = v24.dismissedFrom
        });
        v24.dismissedFrom = nil;
    end;
    l_ContextActionService_0:UnbindCoreAction("LeaveGameAction");
    l_ContextActionService_0:UnbindCoreAction("DontLeaveAction");
end);
return v24;