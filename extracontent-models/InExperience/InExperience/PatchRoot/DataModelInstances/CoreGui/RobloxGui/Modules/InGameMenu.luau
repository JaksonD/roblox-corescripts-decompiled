local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v5.Roact;
local l_RoactRodux_0 = v5.RoactRodux;
local l_UIBlox_0 = v5.UIBlox;
local l_FeedbackManagerInjectionContextProvider_0 = require(l_CorePackages_0.Workspace.Packages.InteractionFeedback).FeedbackManagerInjectionContextProvider;
local l_AppInteractionFeedbackProvider_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppInteractionFeedbackConfig).AppInteractionFeedbackProvider;
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local l_SelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.SelectionCursorProvider;
local v14 = require(l_RobloxGui_0.Modules.Common.renderWithCoreScriptsStyleProvider);
local v15 = require(script.SetupFunctions.bindMenuActions);
local v16 = require(script.SetupFunctions.registerSetCores);
local v17 = require(script.SetupFunctions.requestGameNameAndDescription);
local v18 = require(script.createStore);
local v19 = require(script.Components.App);
local v20 = require(script.Components.Connection.FocusHandlerUtils.FocusHandlerContextProvider);
local v21 = require(l_RobloxGui_0.Modules.VoiceChat.initVoiceChatStore);
local v22 = require(l_RobloxGui_0.Modules.TrustAndSafety);
local v23 = require(script.Actions.SetLocaleId);
local v24 = require(script.Actions.SetInspectMenuEnabled);
local v25 = require(script.Actions.SetCurrentPage);
local v26 = require(script.Actions.SetScreenSize);
local v27 = require(script.Actions.SetMenuIconTooltipOpen);
local v28 = require(script.Actions.SetRespawning);
local v29 = require(script.Thunks.OpenMenu);
local v30 = require(script.Thunks.CloseMenu);
local v31 = require(script.InGameMenuPolicy);
local v32 = require(script.GlobalConfig);
local v33 = require(script.Resources.Constants);
local v34 = require(script.Flags.GetFFlagIGMGamepadSelectionHistory);
local l_BindableEvent_0 = Instance.new("BindableEvent");
local l_BindableEvent_1 = Instance.new("BindableEvent");
local v37 = v18();
return {
    mountInGameMenu = function() --[[ Line: 56 ]] --[[ Name: mountInGameMenu ]]
        -- upvalues: v16 (copy), v37 (copy), v15 (copy), v17 (copy), v32 (copy), l_Roact_0 (copy), l_BindableEvent_0 (copy), l_BindableEvent_1 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v23 (copy), v24 (copy), l_GuiService_0 (copy), v21 (copy), v14 (copy), l_LocalizationProvider_0 (copy), l_SelectionCursorProvider_0 (copy), v34 (copy), v20 (copy), v19 (copy), l_AppInteractionFeedbackProvider_0 (copy), l_FeedbackManagerInjectionContextProvider_0 (copy), v33 (copy), v26 (copy), l_RoactRodux_0 (copy), v31 (copy), l_CoreGui_0 (copy)
        v16(v37);
        v15(v37);
        v17(v37);
        if v32.propValidation then
            l_Roact_0.setGlobalConfig({
                propValidation = true
            });
        end;
        if v32.elementTracing then
            l_Roact_0.setGlobalConfig({
                elementTracing = true
            });
        end;
        v37.changed:connect(function(v38, v39) --[[ Line: 72 ]]
            -- upvalues: l_BindableEvent_0 (ref), l_BindableEvent_1 (ref)
            if v38.isMenuOpen ~= v39.isMenuOpen then
                l_BindableEvent_0:Fire(v38.isMenuOpen);
            end;
            local l_enabled_0 = v38.respawn.enabled;
            local l_enabled_1 = v39.respawn.enabled;
            local l_customCallback_0 = v38.respawn.customCallback;
            local l_customCallback_1 = v39.respawn.customCallback;
            if l_enabled_0 ~= l_enabled_1 and l_customCallback_0 ~= l_customCallback_1 then
                l_BindableEvent_1:Fire(l_enabled_0, l_customCallback_0);
            end;
        end);
        local v44 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
        v37:dispatch(v23(l_LocalizationService_0.RobloxLocaleId));
        l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function() --[[ Line: 90 ]]
            -- upvalues: v44 (copy), l_LocalizationService_0 (ref), v37 (ref), v23 (ref)
            v44:SetLocale(l_LocalizationService_0.RobloxLocaleId);
            v37:dispatch(v23(l_LocalizationService_0.RobloxLocaleId));
        end);
        v37:dispatch(v24(l_GuiService_0:GetInspectMenuEnabled()));
        l_GuiService_0.InspectMenuEnabledChangedSignal:Connect(function(v45) --[[ Line: 96 ]]
            -- upvalues: v37 (ref), v24 (ref)
            v37:dispatch(v24(v45));
        end);
        v21(v37);
        local v46 = v14({
            LocalizationProvider = l_Roact_0.createElement(l_LocalizationProvider_0, {
                localization = v44
            }, {
                CursorProvider = l_Roact_0.createElement(l_SelectionCursorProvider_0, {}, {
                    FocusHandlerContextProvider = v34() and l_Roact_0.createElement(v20, {}, {
                        InGameMenu = l_Roact_0.createElement(v19)
                    }) or nil, 
                    InGameMenu = not v34() and l_Roact_0.createElement(v19) or nil
                })
            })
        });
        v46 = l_Roact_0.createElement(l_AppInteractionFeedbackProvider_0, {}, {
            tree = l_Roact_0.createElement(l_FeedbackManagerInjectionContextProvider_0, nil, {
                tree = v46
            })
        });
        local v48 = l_Roact_0.createElement("ScreenGui", {
            ResetOnSpawn = false, 
            IgnoreGuiInset = true, 
            DisplayOrder = v33.DisplayOrder.RootMenu, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            AutoLocalize = false, 
            [l_Roact_0.Change.AbsoluteSize] = function(v47) --[[ Line: 128 ]]
                -- upvalues: v37 (ref), v26 (ref)
                v37:dispatch(v26(v47.AbsoluteSize));
            end
        }, {
            StoreProvider = l_Roact_0.createElement(l_RoactRodux_0.StoreProvider, {
                store = v37
            }, {
                PolicyProvider = l_Roact_0.createElement(v31.Provider, {
                    policy = {
                        v31.Mapper
                    }
                }, {
                    ThemeProvider = v46
                })
            })
        });
        l_Roact_0.mount(v48, l_CoreGui_0, "InGameMenu");
    end, 
    openInGameMenu = function(v49) --[[ Line: 145 ]] --[[ Name: openInGameMenu ]]
        -- upvalues: v37 (copy), v29 (copy), v33 (copy)
        v37:dispatch(v29(v33.AnalyticsMenuOpenTypes.TopbarButton, v49));
    end, 
    closeInGameMenu = function() --[[ Line: 149 ]] --[[ Name: closeInGameMenu ]]
        -- upvalues: v30 (copy), v37 (copy)
        v30(v37);
    end, 
    openReportDialog = function(v50, v51) --[[ Line: 153 ]] --[[ Name: openReportDialog ]]
        -- upvalues: v37 (copy), v29 (copy), v33 (copy), v22 (copy)
        v37:dispatch(v29(v33.AnalyticsMenuOpenTypes.ReportAbuseTriggered, v33.ReportDialogKey));
        local v52 = if v51 ~= nil then v51 else v33.AnalyticsInGameMenuName;
        v22.openReportDialogForPlayer(v50, v52);
    end, 
    openGameSettingsPage = function() --[[ Line: 159 ]] --[[ Name: openGameSettingsPage ]]
        -- upvalues: v37 (copy), v29 (copy), v33 (copy), v25 (copy)
        v37:dispatch(v29(v33.AnalyticsMenuOpenTypes.SettingsTriggered));
        v37:dispatch(v25("GameSettings"));
    end, 
    openGameLeavePage = function() --[[ Line: 164 ]] --[[ Name: openGameLeavePage ]]
        -- upvalues: v37 (copy), v29 (copy), v33 (copy), v25 (copy)
        v37:dispatch(v29(v33.AnalyticsMenuOpenTypes.GamepadLeaveGame));
        v37:dispatch(v25(v33.LeaveGamePromptPageKey));
    end, 
    openCharacterResetPage = function() --[[ Line: 169 ]] --[[ Name: openCharacterResetPage ]]
        -- upvalues: v37 (copy), v29 (copy), v33 (copy), v25 (copy), v28 (copy)
        v37:dispatch(v29(v33.AnalyticsMenuOpenTypes.GamepadResetCharacter));
        v37:dispatch(v25(v33.MainPagePageKey));
        v37:dispatch(v28(true));
    end, 
    openPlayersPage = function() --[[ Line: 175 ]] --[[ Name: openPlayersPage ]]
        -- upvalues: v37 (copy), v29 (copy), v33 (copy), v25 (copy)
        v37:dispatch(v29(v33.AnalyticsMenuOpenTypes.PlayersTriggered));
        v37:dispatch(v25("Players"));
    end, 
    getOpenChangedEvent = function() --[[ Line: 180 ]] --[[ Name: getOpenChangedEvent ]]
        -- upvalues: l_BindableEvent_0 (copy)
        return l_BindableEvent_0;
    end, 
    getOpen = function() --[[ Line: 184 ]] --[[ Name: getOpen ]]
        -- upvalues: v37 (copy)
        return v37:getState().isMenuOpen;
    end, 
    getRespawnBehaviour = function() --[[ Line: 188 ]] --[[ Name: getRespawnBehaviour ]]
        -- upvalues: v37 (copy)
        local v53 = v37:getState();
        return v53.respawn.enabled, v53.respawn.customCallback;
    end, 
    getRespawnBehaviourChangedEvent = function() --[[ Line: 193 ]] --[[ Name: getRespawnBehaviourChangedEvent ]]
        -- upvalues: l_BindableEvent_1 (copy)
        return l_BindableEvent_1;
    end, 
    setMenuIconTooltipOpen = function(v54) --[[ Line: 197 ]] --[[ Name: setMenuIconTooltipOpen ]]
        -- upvalues: v37 (copy), v27 (copy)
        v37:dispatch(v27(v54));
    end
};