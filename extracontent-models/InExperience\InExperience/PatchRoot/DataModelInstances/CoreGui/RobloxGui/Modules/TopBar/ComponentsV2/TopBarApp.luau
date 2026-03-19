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
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
local l_View_0 = v13.View;
local l_SelectionCursorProvider_0 = v22.App.SelectionImage.SelectionCursorProvider;
local v33 = require(l_Components_0.GamepadConnector);
local v34 = require(l_Presentation_0.GamepadNavigationDialog);
local l_HealthBar_0 = v11.Components.HealthBar;
local _ = v11.Components.HurtOverlay;
local _ = v11.Components.HeadsetDisconnectDialog;
local v38 = require(l_Parent_0.ComponentsV2.MenuIcon);
local v39 = require(l_Components_0.MenuIconContext);
local v40 = require(l_Presentation_0.GamepadMenu.MenuNavigationToggleDialog);
local v41 = require(l_Components_0.TraversalBackButton);
local v42 = if l_isInExperienceUIVREnabled_0 then require(l_Components_0.VRBottomUnibar) else require(l_Parent_1.VR.VRBottomBar.VRBottomBar);
local v43 = if game:GetEngineFeature("InGameChromeSignalAPI") then require(l_Chrome_0.ChromeShared.Analytics) else nil;
local v44 = if game:GetEngineFeature("VoiceChatSupported") and l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() then require(l_Chrome_0.Integrations.JoinVoiceBinder) else nil;
local v45 = require(l_Chrome_0.Integrations.Party.PartyMicBinder);
local v46 = require(l_Chrome_0.ChromeShared.Unibar);
local l_default_0 = require(l_Parent_1.VoiceChat.VoiceChatServiceManager).default;
local v48 = require(l_Parent_1.VoiceChat.VoiceStateContext);
return function(_) --[[ Line: 73 ]] --[[ Name: TopBarApp ]]
    -- upvalues: v13 (copy), v23 (copy), v18 (copy), v11 (copy), v14 (copy), v15 (copy), v33 (copy), v8 (copy), l_View_0 (copy), v9 (copy), v20 (copy), l_FFlagAddMenuNavigationToggleDialog_0 (copy), v40 (copy), v25 (copy), v34 (copy), v44 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), v45 (copy), v43 (copy), l_SelectionCursorProvider_0 (copy), v38 (copy), l_FFlagAddTraversalBackButton_0 (copy), v41 (copy), v39 (copy), v46 (copy), l_HealthBar_0 (copy), l_VRService_0 (copy), v48 (copy), v42 (copy), l_default_0 (copy), l_isInExperienceUIVREnabled_0 (copy)
    local _ = v13.Hooks.useTokens;
    local v52 = v23.useAppPolicy(function(v51) --[[ Line: 75 ]]
        return v51.ShowBadgeOver12 or false;
    end);
    local v54 = v18.useSignalState(function(v53) --[[ Line: 79 ]]
        -- upvalues: v11 (ref)
        return v11.Stores.GetKeepOutAreasStore(v53);
    end);
    local v56 = v18.useSignalState(function(v55) --[[ Line: 82 ]]
        -- upvalues: v14 (ref)
        return v14.GetDisplayStore(v55).getUIScale(v55);
    end);
    local v57 = v15.useRef(nil);
    local v58 = v15.useRef(nil);
    local v59 = v33:getShowTopBar();
    local v60, v61 = v15.useBinding(v59:get());
    v15.useEffect(function() --[[ Line: 92 ]]
        -- upvalues: v33 (ref), v59 (copy), v61 (copy), v54 (copy)
        v33:connectToTopbar();
        local v62 = v59:connect(function() --[[ Line: 94 ]]
            -- upvalues: v61 (ref), v59 (ref)
            v61(v59:get());
        end);
        return function() --[[ Line: 97 ]]
            -- upvalues: v33 (ref), v54 (ref), v62 (copy)
            v33:disconnectFromTopbar();
            if v54 then
                v54.cleanup();
            end;
            v62:disconnect();
        end;
    end, {});
    local v64 = v15.useCallback(function(v63) --[[ Line: 106 ]]
        -- upvalues: v54 (copy), v8 (ref)
        v54.setKeepOutArea(v8.TopBarKeepOutAreaId, v63.AbsolutePosition, v63.AbsoluteSize);
    end, {
        v54
    });
    local v65 = v8.ScreenSideOffset * v56;
    local v66 = v8.TopBarHeight * v56;
    local v67 = v8.TopBarButtonHeight * v56;
    local v68 = v8.TopBarTopMargin * v56;
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
            MenuNavigationToggleDialog = if l_FFlagAddMenuNavigationToggleDialog_0 then v15.createElement(v40, {
                Position = UDim2.fromScale(0.5, 0.1), 
                GamepadConnector = v33
            }) else nil, 
            GamepadNavigationDialog = if v25 then v15.createElement(v34) else nil
        }), 
        Binders = v15.createElement(v15.Fragment, {}, {
            JoinVoiceBinder = if v44 then v15.createElement(v44) else nil, 
            PartyMicBinder = if l_GetFFlagEnableCrossExpVoice_0() then v15.createElement(v45) else nil, 
            ChromeAnalytics = if v43 then v15.createElement(v43) else nil
        }), 
        TopBarFrame = v15.createElement(l_View_0, {
            Size = UDim2.new(1, 0, 0, v66)
        }, {
            TopLeftFrame = v15.createElement(l_View_0, {
                tag = "anchor-top-left auto-x row gap-small", 
                Size = UDim2.fromOffset(0, v67), 
                onAbsoluteSizeChanged = v64, 
                onAbsolutePositionChanged = v64, 
                Position = UDim2.new(0, v65, 0, v68), 
                Visible = v60
            }, {
                MenuIcon = v15.createElement(l_SelectionCursorProvider_0, {}, {
                    Icon = v15.createElement(v38, {
                        showBadgeOver12 = v52, 
                        menuIconRef = v58, 
                        unibarMenuRef = v57
                    })
                }), 
                TraversalBackButton = if l_FFlagAddTraversalBackButton_0 then v15.createElement(v41) else nil, 
                UnibarFrame = v15.createElement(v39.Provider, {
                    value = {
                        menuIconRef = v58
                    }
                }, {
                    v15.createElement(v46, {
                        layoutOrder = 2, 
                        onMinWidthChanged = function() --[[ Line: 175 ]] --[[ Name: onMinWidthChanged ]]

                        end, 
                        onAreaChanged = function() --[[ Line: 176 ]] --[[ Name: onAreaChanged ]]

                        end, 
                        menuRef = v57
                    })
                })
            }), 
            TopRightFrame = v15.createElement(l_View_0, {
                tag = "anchor-top-right auto-x", 
                Size = UDim2.fromOffset(0, v67), 
                Position = UDim2.new(1, -v65, 0, v68)
            }, {
                HealthBar = v15.createElement(l_HealthBar_0)
            })
        }), 
        VRBottomBar = if l_VRService_0.VREnabled then v15.createElement(v48.Provider, {}, {
            VRBottomBar = v48.withVoiceState(function(v69) --[[ Line: 191 ]]
                -- upvalues: v15 (ref), v42 (ref), l_default_0 (ref), l_isInExperienceUIVREnabled_0 (ref), v52 (copy)
                return v15.createElement(v42, {
                    voiceChatServiceManager = l_default_0, 
                    voiceEnabled = v69.voiceEnabled, 
                    voiceState = v69.voiceState, 
                    showBadgeOver12 = if l_isInExperienceUIVREnabled_0 then v52 else nil
                });
            end)
        }) else nil
    });
end;