local _ = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_VRService_0 = game:GetService("VRService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Components_0 = l_Parent_0.Components;
local l_Presentation_0 = l_Components_0.Presentation;
local l_Chrome_0 = l_Parent_0.Parent.Chrome;
local v8 = require(l_Parent_0.Constants);
local v9 = require(l_Chrome_0.Integrations.MusicUtility.Constants);
local _ = require(l_CorePackages_0.Workspace.Packages.Analytics).Analytics;
local v11 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon);
local v12 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon);
local v13 = require(l_CorePackages_0.Packages.Foundation);
local v14 = require(l_CorePackages_0.Workspace.Packages.Display);
local v15 = require(l_CorePackages_0.Packages.React);
local v16 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local _ = require(l_CorePackages_0.Packages.Signals);
local v18 = require(l_CorePackages_0.Packages.SignalsReact);
local _ = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal;
local v20 = require(l_CorePackages_0.Workspace.Packages.Songbird);
local l_Traversal_0 = v12.Traversal;
local v22 = require(l_CorePackages_0.Packages.UIBlox);
local v23 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy);
local l_FFlagAddMenuNavigationToggleDialog_0 = v16.FFlagAddMenuNavigationToggleDialog;
local v25 = require(l_Parent_0.Flags.FFlagGamepadNavigationDialogABTest);
local l_FFlagAddTraversalBackButton_0 = l_Traversal_0.Flags.FFlagAddTraversalBackButton;
local l_GetFFlagEnableCrossExpVoice_0 = v16.GetFFlagEnableCrossExpVoice;
local l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 = v16.GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice;
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local l_isSpatial_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
local l_FFlagDisableGamepadConnectorInVR_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Flags.FFlagDisableGamepadConnectorInVR;
local l_View_0 = v13.View;
local l_SelectionCursorProvider_0 = v22.App.SelectionImage.SelectionCursorProvider;
local v34 = require(l_Components_0.GamepadConnector);
local v35 = require(l_Presentation_0.GamepadNavigationDialog);
local l_HealthBar_0 = v11.Components.HealthBar;
local _ = v11.Components.HurtOverlay;
local _ = v11.Components.HeadsetDisconnectDialog;
local v39 = require(l_Parent_0.ComponentsV2.MenuIcon);
local v40 = require(l_Components_0.MenuIconContext);
local v41 = require(l_Presentation_0.GamepadMenu.MenuNavigationToggleDialog);
local v42 = require(l_Components_0.TraversalBackButton);
local v43 = if l_isInExperienceUIVREnabled_0 then require(l_Components_0.VRBottomUnibar) else require(l_Parent_1.VR.VRBottomBar.VRBottomBar);
local v44 = if game:GetEngineFeature("InGameChromeSignalAPI") then require(l_Chrome_0.ChromeShared.Analytics) else nil;
local v45 = if game:GetEngineFeature("VoiceChatSupported") and l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() then require(l_Chrome_0.Integrations.JoinVoiceBinder) else nil;
local v46 = require(l_Chrome_0.Integrations.Party.PartyMicBinder);
local v47 = require(l_Chrome_0.ChromeShared.Unibar);
local l_default_0 = require(l_Parent_1.VoiceChat.VoiceChatServiceManager).default;
local v49 = require(l_Parent_1.VoiceChat.VoiceStateContext);
return function(_) --[[ Line: 74 ]] --[[ Name: TopBarApp ]]
    -- upvalues: v13 (copy), v23 (copy), v18 (copy), v11 (copy), v14 (copy), v15 (copy), v34 (copy), l_FFlagDisableGamepadConnectorInVR_0 (copy), l_isSpatial_0 (copy), l_VRService_0 (copy), v8 (copy), l_View_0 (copy), v9 (copy), v20 (copy), l_FFlagAddMenuNavigationToggleDialog_0 (copy), v41 (copy), v25 (copy), v35 (copy), v45 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), v46 (copy), v44 (copy), l_SelectionCursorProvider_0 (copy), v39 (copy), l_FFlagAddTraversalBackButton_0 (copy), v42 (copy), v40 (copy), v47 (copy), l_HealthBar_0 (copy), v49 (copy), v43 (copy), l_default_0 (copy), l_isInExperienceUIVREnabled_0 (copy)
    local _ = v13.Hooks.useTokens;
    local v53 = v23.useAppPolicy(function(v52) --[[ Line: 76 ]]
        return v52.ShowBadgeOver12 or false;
    end);
    local v55 = v18.useSignalState(function(v54) --[[ Line: 80 ]]
        -- upvalues: v11 (ref)
        return v11.Stores.GetKeepOutAreasStore(v54);
    end);
    local v57 = v18.useSignalState(function(v56) --[[ Line: 83 ]]
        -- upvalues: v14 (ref)
        return v14.GetDisplayStore(v56).getUIScale(v56);
    end);
    local v58 = v15.useRef(nil);
    local v59 = v15.useRef(nil);
    local v60 = v34:getShowTopBar();
    local v61, v62 = v15.useBinding(v60:get());
    v15.useEffect(function() --[[ Line: 93 ]]
        -- upvalues: l_FFlagDisableGamepadConnectorInVR_0 (ref), l_isSpatial_0 (ref), v34 (ref), l_VRService_0 (ref), v60 (copy), v62 (copy), v55 (copy)
        local v63 = nil;
        if l_FFlagDisableGamepadConnectorInVR_0 then
            if not l_isSpatial_0() then
                v34:connectToTopbar();
            end;
            v63 = l_VRService_0:GetPropertyChangedSignal("VREnabled"):Connect(function() --[[ Line: 99 ]]
                -- upvalues: l_isSpatial_0 (ref), v34 (ref)
                if l_isSpatial_0() then
                    v34:disconnectFromTopbar();
                    return;
                else
                    v34:connectToTopbar();
                    return;
                end;
            end);
        else
            v34:connectToTopbar();
        end;
        local v64 = v60:connect(function() --[[ Line: 110 ]]
            -- upvalues: v62 (ref), v60 (ref)
            v62(v60:get());
        end);
        return function() --[[ Line: 113 ]]
            -- upvalues: l_FFlagDisableGamepadConnectorInVR_0 (ref), v63 (ref), v34 (ref), v55 (ref), v64 (copy)
            if l_FFlagDisableGamepadConnectorInVR_0 and v63 then
                v63:Disconnect();
            end;
            v34:disconnectFromTopbar();
            if v55 then
                v55.cleanup();
            end;
            v64:disconnect();
        end;
    end, {});
    local v66 = v15.useCallback(function(v65) --[[ Line: 125 ]]
        -- upvalues: v55 (copy), v8 (ref)
        v55.setKeepOutArea(v8.TopBarKeepOutAreaId, v65.AbsolutePosition, v65.AbsoluteSize);
    end, {
        v55
    });
    local v67 = v8.ScreenSideOffset * v57;
    local v68 = v8.TopBarHeight * v57;
    local v69 = v8.TopBarButtonHeight * v57;
    local v70 = v8.TopBarTopMargin * v57;
    return v15.createElement("ScreenGui", {
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        DisplayOrder = 6
    }, {
        Popups = v15.createElement(l_View_0, {
            tag = "size-full"
        }, {
            SongbirdReportAudioFrame = v15.createElement(l_View_0, {
                tag = "anchor-center-center position-center-center", 
                Size = UDim2.new(1, 0, 0, v9.AUDIO_REPORTING_WINDOW_MIN_HEIGHT)
            }, {
                ReportAudioPopup = v15.createElement(v20.ReportAudioPopup)
            }), 
            MenuNavigationToggleDialog = if l_FFlagAddMenuNavigationToggleDialog_0 then v15.createElement(v41, {
                Position = UDim2.fromScale(0.5, 0.1), 
                GamepadConnector = v34
            }) else nil, 
            GamepadNavigationDialog = if v25 then v15.createElement(v35) else nil
        }), 
        Binders = v15.createElement(v15.Fragment, {}, {
            JoinVoiceBinder = if v45 then v15.createElement(v45) else nil, 
            PartyMicBinder = if l_GetFFlagEnableCrossExpVoice_0() then v15.createElement(v46) else nil, 
            ChromeAnalytics = if v44 then v15.createElement(v44) else nil
        }), 
        TopBarFrame = v15.createElement(l_View_0, {
            Size = UDim2.new(1, 0, 0, v68)
        }, {
            TopLeftFrame = v15.createElement(l_View_0, {
                tag = "anchor-top-left auto-x row gap-small", 
                Size = UDim2.fromOffset(0, v69), 
                onAbsoluteSizeChanged = v66, 
                onAbsolutePositionChanged = v66, 
                Position = UDim2.new(0, v67, 0, v70), 
                Visible = v61
            }, {
                MenuIcon = v15.createElement(l_SelectionCursorProvider_0, {}, {
                    Icon = v15.createElement(v39, {
                        showBadgeOver12 = v53, 
                        menuIconRef = v59, 
                        unibarMenuRef = v58
                    })
                }), 
                TraversalBackButton = if l_FFlagAddTraversalBackButton_0 then v15.createElement(v42) else nil, 
                UnibarFrame = v15.createElement(v40.Provider, {
                    value = {
                        menuIconRef = v59
                    }
                }, {
                    v15.createElement(v47, {
                        layoutOrder = 2, 
                        onMinWidthChanged = function() --[[ Line: 194 ]] --[[ Name: onMinWidthChanged ]]

                        end, 
                        onAreaChanged = function() --[[ Line: 195 ]] --[[ Name: onAreaChanged ]]

                        end, 
                        menuRef = v58
                    })
                })
            }), 
            TopRightFrame = v15.createElement(l_View_0, {
                tag = "anchor-top-right auto-x", 
                Size = UDim2.fromOffset(0, v69), 
                Position = UDim2.new(1, -v67, 0, v70)
            }, {
                HealthBar = v15.createElement(l_HealthBar_0)
            })
        }), 
        VRBottomBar = if l_VRService_0.VREnabled then v15.createElement(v49.Provider, {}, {
            VRBottomBar = v49.withVoiceState(function(v71) --[[ Line: 210 ]]
                -- upvalues: v15 (ref), v43 (ref), l_default_0 (ref), l_isInExperienceUIVREnabled_0 (ref), v53 (copy)
                return v15.createElement(v43, {
                    voiceChatServiceManager = l_default_0, 
                    voiceEnabled = v71.voiceEnabled, 
                    voiceState = v71.voiceState, 
                    showBadgeOver12 = if l_isInExperienceUIVREnabled_0 then v53 else nil
                });
            end)
        }) else nil
    });
end;