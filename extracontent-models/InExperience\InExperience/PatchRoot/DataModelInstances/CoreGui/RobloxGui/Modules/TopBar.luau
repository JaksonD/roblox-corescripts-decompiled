local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_IXPService_0 = game:GetService("IXPService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v6 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v7 = require(script.Flags.FFlagAddTopBarScrim);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local l_DesignTokenProvider_0 = require(l_CorePackages_0.Workspace.Packages.Style).DesignTokenProvider;
local v11 = require(l_CorePackages_0.Workspace.Packages.CrossExperienceVoice);
local v12 = require(l_CorePackages_0.Packages.ReactSceneUnderstanding);
local v13 = require(l_CorePackages_0.Packages.React);
local v14 = require(l_CorePackages_0.Packages.Roact);
local v15 = require(l_CorePackages_0.Packages.Rodux);
local v16 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Constants_0 = require(l_CorePackages_0.Packages.UIBlox).App.Style.Constants;
local v18 = require(l_CorePackages_0.Workspace.Packages.Display);
local l_UiModeStyleProvider_0 = require(l_CorePackages_0.Workspace.Packages.Style).UiModeStyleProvider;
local v20 = require(l_CorePackages_0.Workspace.Packages.Songbird);
local v21 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceStateContext);
local v22 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v23 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v24 = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
local v25 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled();
local v26 = nil;
local v27 = nil;
if v25 then
    v26 = require(l_RobloxGui_0.Modules.Chrome.Service);
    v27 = require(script.Components.TopBarScrim);
end;
local v28 = require(script.Constants);
local v29 = require(script.TokenMappers.MenuNavigationPromptTokenMapper);
local l_GetFFlagSimpleChatUnreadMessageCount_0 = v6.GetFFlagSimpleChatUnreadMessageCount;
local v31 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon);
local l_FFlagTopBarSignalizeSetCores_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceTopBar).Flags.FFlagTopBarSignalizeSetCores;
local l_FFlagTopBarSignalizeMenuOpen_0 = v31.Flags.FFlagTopBarSignalizeMenuOpen;
local v34 = require(script.Flags.FFlagTopBarDeprecateGameInfoRodux);
local v35 = require(script.Flags.FFlagTopBarDeprecateGamepadNavigationDialogRodux);
local v36 = require(script.Flags.FFlagTopBarDeprecateChatRodux);
local v37 = require(script.Flags.FFlagTopBarDeprecateDisplayOptionsRodux);
local l_FFlagTopBarRefactor_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceTopBar).Flags.FFlagTopBarRefactor;
if v25 then
    (function() --[[ Line: 59 ]] --[[ Name: SetGlobalGuiInset ]]
        -- upvalues: l_GuiService_0 (copy), v28 (copy), v18 (copy)
        local l_l_GuiService_0_GuiInset_0, v40 = l_GuiService_0:GetGuiInset();
        l_GuiService_0:SetGlobalGuiInset(l_l_GuiService_0_GuiInset_0.X, v28.ApplyDisplayScale(v28.TopBarHeight), v40.X, v40.Y);
        v18.GetDisplayStore().setGuiInset({
            left = l_l_GuiService_0_GuiInset_0.X, 
            top = v28.ApplyDisplayScale(v28.TopBarHeight), 
            right = v40.X, 
            bottom = v40.Y
        });
    end)();
end;
local v41 = if l_FFlagTopBarRefactor_0 then require(script.ComponentsV2.TopBarApp) else require(script.Components.TopBarApp);
local v42 = require(script.Reducer);
local v43 = require(script.TopBarAppPolicy);
local v44 = require(script.Actions.SetSmallTouchDevice);
local v45 = require(script.Actions.SetInspectMenuOpen);
local v46 = require(script.Actions.SetGamepadMenuOpen);
local v47 = require(script.Actions.SetGamepadNavigationDialogOpen);
local v48 = require(script.Actions.UpdateUnreadMessagesBadge);
local v49 = require(script.Thunks.GetCanChat);
local v50 = require(script.Thunks.GetGameName);
local v51 = require(script.registerSetCores);
local v52 = require(script.GlobalConfig);
local v53 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_FFlagAddMenuNavigationToggleDialog_0 = v6.FFlagAddMenuNavigationToggleDialog;
local v55 = require(script.Flags.FFlagGamepadNavigationDialogABTest);
local l_GetFFlagEnableCrossExpVoice_0 = v6.GetFFlagEnableCrossExpVoice;
local l_Component_0 = v11.Component;
local l_FTUX_0 = l_RobloxGui_0.Modules.FTUX;
local v59 = require(l_FTUX_0.Flags.GetFFlagEnableVRFTUXExperience);
local v60 = require(l_FTUX_0.Flags.GetFFlagDebugEnableVRFTUXExperienceInStudio);
local v61 = require(l_FTUX_0.Enums.PlatformEnum);
local v62 = require(l_FTUX_0.Utility.IsFTUXExperience);
local v63 = require(script.Parent.FTUX);
local l_isRunningInStudio_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isRunningInStudio;
local v65 = {};
v65.__index = v65;
v65.new = function() --[[ Line: 115 ]] --[[ Name: new ]]
    -- upvalues: v65 (copy), v52 (copy), v14 (copy), v23 (copy), v25 (copy), l_GuiService_0 (copy), v28 (copy), v15 (copy), v42 (copy), l_FFlagTopBarSignalizeSetCores_0 (copy), v51 (copy), v36 (copy), v49 (copy), v34 (copy), v50 (copy), v60 (copy), l_isRunningInStudio_0 (copy), v63 (copy), v61 (copy), v59 (copy), v62 (copy), v24 (copy), l_RobloxGui_0 (copy), v37 (copy), v44 (copy), v22 (copy), l_Constants_0 (copy), l_UiModeStyleProvider_0 (copy), v41 (copy), l_FFlagAddMenuNavigationToggleDialog_0 (copy), v55 (copy), l_DesignTokenProvider_0 (copy), v29 (copy), v26 (ref), v7 (copy), v13 (copy), v27 (ref), v16 (copy), v43 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v53 (copy), l_IXPService_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), l_Component_0 (copy), v12 (copy), v20 (copy), v21 (copy), l_CoreGui_0 (copy), l_GetFFlagSimpleChatUnreadMessageCount_0 (copy), v48 (copy), v35 (copy)
    local v66 = setmetatable({}, v65);
    if v52.propValidation then
        v14.setGlobalConfig({
            propValidation = true
        });
    end;
    if v52.elementTracing then
        v14.setGlobalConfig({
            elementTracing = true
        });
    end;
    if not v23:IsEnabled() and not v25 then
        l_GuiService_0:SetGlobalGuiInset(0, v28.TopBarHeight, 0, 0);
    end;
    v66.store = v15.Store.new(v42, nil, {
        v15.thunkMiddleware
    });
    if not l_FFlagTopBarSignalizeSetCores_0 then
        v51(v66.store);
    end;
    if not v36 then
        v66.store:dispatch(v49);
    end;
    if not v34 then
        v66.store:dispatch(v50);
    end;
    if v60() and l_isRunningInStudio_0() then
        v63.mountFtuxMenu(v61.QuestVR);
    end;
    if v59() and v62(v61.QuestVR) then
        v63.mountFtuxMenu(v61.QuestVR);
    end;
    if v24() then
        require(l_RobloxGui_0.Modules.InGameMenuInit).mountInGameMenu();
    end;
    if not v37 then
        coroutine.wrap(function() --[[ Line: 167 ]]
            -- upvalues: v66 (copy), v44 (ref), v22 (ref)
            v66.store:dispatch(v44(v22:IsSmallTouchScreen()));
        end)();
    end;
    local v67 = {
        themeName = l_Constants_0.ThemeName.Dark, 
        fontName = l_Constants_0.FontName.Gotham
    };
    local function v69(v68) --[[ Line: 177 ]] --[[ Name: wrapWithUiModeStyleProvider ]]
        -- upvalues: v14 (ref), l_UiModeStyleProvider_0 (ref), v67 (copy)
        return {
            UiModeStyleProvider = v14.createElement(l_UiModeStyleProvider_0, {
                style = v67
            }, v68)
        };
    end;
    local v70 = v14.createElement(v41);
    if l_FFlagAddMenuNavigationToggleDialog_0 or v55 then
        v70 = v14.createElement(l_DesignTokenProvider_0, {
            tokenMappers = {
                MenuNavigationPrompt = if v55 then v29 else nil
            }
        }, {
            TopBarApp = v70
        });
    end;
    local v71 = v26 and v7 and v13.createElement("ScreenGui", {
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        DisplayOrder = -2
    }, {
        TopBarScrim = v13.createElement(v27)
    });
    v66.root = v14.createElement(v16.StoreProvider, {
        store = v66.store
    }, {
        PolicyProvider = v14.createElement(v43.Provider, {
            policy = {
                v43.Mapper
            }
        }, (v69({
            LocalizationProvider = v14.createElement(l_LocalizationProvider_0, {
                localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
            }, {
                ExperimentProvider = v14.createFragment({
                    RoactAppExperimentProvider = v14.createElement(v53.Provider, {
                        value = l_IXPService_0
                    }, {
                        TopBarApp = v70, 
                        TopBarScrim = v71
                    }), 
                    CrossExperienceVoice = l_GetFFlagEnableCrossExpVoice_0() and v14.createElement(l_Component_0) or nil
                })
            })
        })))
    });
    v66.root = v14.createElement(v12.SceneAnalysisProvider, nil, v66.root);
    v66.root = v14.createElement(v20.ReportAudioPopupContext.Provider, nil, v66.root);
    v66.root = v14.createElement(v21.Provider, nil, v66.root);
    v66.root = v14.createElement("Folder", {
        Name = "TopBarApp"
    }, v66.root);
    v66.element = v14.mount(v66.root, l_CoreGui_0, "TopBar");
    if not l_GetFFlagSimpleChatUnreadMessageCount_0() and not v36 then
        game:GetService("TextChatService").MessageReceived:Connect(function() --[[ Line: 254 ]]
            -- upvalues: v66 (copy), v48 (ref)
            v66.store:dispatch(v48(1));
        end);
    end;
    if v55 and not v35 then
        local l_UserInputService_0 = game:GetService("UserInputService");
        local v73 = nil;
        do
            local l_v73_0 = v73;
            local function v75() --[[ Line: 262 ]] --[[ Name: disconnectGamepadConnected ]]
                -- upvalues: l_v73_0 (ref)
                if l_v73_0 then
                    l_v73_0:Disconnect();
                    l_v73_0 = nil;
                end;
            end;
            if l_UserInputService_0:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
                v66:setGamepadNavigationDialogOpen(true);
            else
                l_v73_0 = l_UserInputService_0.GamepadConnected:Connect(function() --[[ Line: 271 ]]
                    -- upvalues: v66 (copy), l_v73_0 (ref)
                    v66:setGamepadNavigationDialogOpen(true);
                    if l_v73_0 then
                        l_v73_0:Disconnect();
                        l_v73_0 = nil;
                    end;
                end);
            end;
            l_GuiService_0:GetPropertyChangedSignal("MenuIsOpen"):Connect(v75);
        end;
    end;
    return v66;
end;
v65.setInspectMenuOpen = function(v76, v77) --[[ Line: 283 ]] --[[ Name: setInspectMenuOpen ]]
    -- upvalues: l_FFlagTopBarSignalizeMenuOpen_0 (copy), v45 (copy)
    if l_FFlagTopBarSignalizeMenuOpen_0 then
        return;
    else
        v76.store:dispatch(v45(v77));
        return;
    end;
end;
v65.setGamepadMenuOpen = function(v78, v79) --[[ Line: 290 ]] --[[ Name: setGamepadMenuOpen ]]
    -- upvalues: v46 (copy)
    v78.store:dispatch(v46(v79));
end;
v65.setGamepadNavigationDialogOpen = function(v80, v81) --[[ Line: 294 ]] --[[ Name: setGamepadNavigationDialogOpen ]]
    -- upvalues: v37 (copy), v47 (copy)
    if not v37 then
        v80.store:dispatch(v47(v81));
    end;
end;
return v65.new();