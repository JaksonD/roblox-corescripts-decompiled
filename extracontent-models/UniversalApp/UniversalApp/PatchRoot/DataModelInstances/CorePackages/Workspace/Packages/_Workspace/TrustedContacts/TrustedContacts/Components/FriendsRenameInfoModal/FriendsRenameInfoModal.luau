local l_Parent_0 = script:FindFirstAncestor("TrustedContacts").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.PeekView);
local l_PeekView_0 = v2.PeekView;
local l_PeekViewState_0 = v2.PeekViewState;
local v5 = require(l_Parent_0.RoactUtils);
local l_dependencyArray_0 = v5.Hooks.dependencyArray;
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local v8 = require(l_Parent_0.UIBlox);
local l_InteractiveAlert_0 = v8.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v8.App.Button.Enum.ButtonType;
local v11 = require(l_Parent_0.Foundation);
local l_View_0 = v11.View;
local l_Text_0 = v11.Text;
local l_InputLabel_0 = v11.InputLabel;
local l_InputLabelSize_0 = v11.Enums.InputLabelSize;
local v16 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v16.usePreferredInput;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v24 = require(script.Parent.Parent.Parent.Analytics);
local l_useTCAnalytics_0 = v24.useTCAnalytics;
local l_EventNames_0 = v24.EventNames;
local v27 = game:DefineFastFlag("FriendsRenameModalUnboldText", false);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function() --[[ Line: 47 ]] --[[ Name: FriendsRenameInfoModal ]]
    -- upvalues: l_usePreferredInput_0 (copy), l_useDispatch_0 (copy), l_useScreenSize_0 (copy), l_useNavigation_0 (copy), l_useTCAnalytics_0 (copy), v1 (copy), l_EventNames_0 (copy), v16 (copy), l_useLocalization_0 (copy), l_PeekViewState_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_useAppPolicy_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_Text_0 (copy), l_View_0 (copy), v27 (copy), l_InputLabel_0 (copy), l_InputLabelSize_0 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy), l_PeekView_0 (copy)
    local v29 = l_usePreferredInput_0();
    local v30 = l_useDispatch_0();
    local v31 = l_useScreenSize_0();
    local v32 = l_useNavigation_0();
    local l_fireAnalyticsEvent_0 = l_useTCAnalytics_0().fireAnalyticsEvent;
    v1.useEffect(function() --[[ Line: 55 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref)
        l_fireAnalyticsEvent_0(l_EventNames_0.FriendsRenameInfoModalSeen);
    end, {});
    local v34 = v29 ~= v16.Input.Touch;
    local v35 = l_useLocalization_0({
        gotIt = "Feature.Avatar.Action.GotIt", 
        learnMore = "Feature.Chat.Action.LearnMore", 
        introducingConnections = "Feature.Friends.Label.IntroducingConnections", 
        renameInfoText = "Feature.Friends.Label.RenameInfoText"
    });
    local v36 = v1.useCallback(function() --[[ Line: 69 ]]
        -- upvalues: v32 (copy)
        v32.pop();
    end, {
        v32
    });
    local v39 = v1.useCallback(function(v37, _) --[[ Line: 73 ]]
        -- upvalues: l_PeekViewState_0 (ref), v32 (copy)
        if v37 == l_PeekViewState_0.Closed or v37 == l_PeekViewState_0.Hidden then
            v32.goBack();
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v32
    } else l_dependencyArray_0(v32));
    local v41 = l_useAppPolicy_0(function(v40) --[[ Line: 79 ]]
        return v40.getWebViewSupport();
    end);
    local v42 = v1.useCallback(function() --[[ Line: 83 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v30 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        l_fireAnalyticsEvent_0(l_EventNames_0.FriendsRenameLearnMoreClicked);
        v30(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = "https://en.help.roblox.com/hc/en-us/articles/37725513985812", 
            extraProps = {
                title = ""
            }
        }, nil));
    end, {
        v30
    });
    local l_introducingConnections_0 = v35.introducingConnections;
    local v44 = v1.useMemo(function() --[[ Line: 95 ]]
        -- upvalues: v1 (ref), l_Text_0 (ref), l_introducingConnections_0 (copy)
        return v1.createElement(l_Text_0, {
            LayoutOrder = 1, 
            tag = "auto-y size-full-0 text-align-x-left text-wrap text-heading-small", 
            Text = l_introducingConnections_0
        });
    end, {
        l_introducingConnections_0
    });
    local v45 = v1.useCallback(function() --[[ Line: 104 ]]
        -- upvalues: v1 (ref), l_View_0 (ref), v34 (copy), v27 (ref), l_Text_0 (ref), l_InputLabel_0 (ref), l_InputLabelSize_0 (ref), v35 (copy), v41 (copy), v42 (copy)
        return v1.createElement(l_View_0, {
            tag = "col size-full-0 auto-y gap-small padding-0", 
            ["align-x-left"] = not v34, 
            ["align-x-center"] = v34, 
            LayoutOrder = 2
        }, {
            BodyText = v1.createElement(if v27 then l_Text_0 else l_InputLabel_0, {
                LayoutOrder = 1, 
                tag = v27 and "auto-y size-full-0 text-wrap grow text-align-x-left" or "auto-y size-full-0 text-wrap grow", 
                RichText = true, 
                size = if v27 then nil else l_InputLabelSize_0.Large, 
                Text = v35.renameInfoText
            }), 
            LearnMoreWebLink = v41 and v1.createElement(if v27 then l_Text_0 else l_InputLabel_0, {
                LayoutOrder = 2, 
                tag = v27 and "auto-y size-full-0 text-align-x-left" or "auto-y size-full-0", 
                RichText = true, 
                Text = ("<u>%*</u>"):format(v35.learnMore), 
                size = if v27 then nil else l_InputLabelSize_0.Large, 
                onActivated = v42
            })
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v42, 
        v35, 
        v34
    } else l_dependencyArray_0(v42, v35, v34));
    if v34 then
        return (v1.createElement(l_InteractiveAlert_0, {
            richText = true, 
            screenSize = v31, 
            title = l_introducingConnections_0, 
            middleContent = v45, 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v36, 
                            text = v35.gotIt
                        }
                    }
                }
            }
        }));
    else
        return (v1.createElement(l_PeekView_0, {
            briefViewContentHeight = UDim.new(0, 0), 
            hasScrim = true, 
            mountAsFullView = true, 
            returnToFullView = true, 
            showDraggerInClosedState = false, 
            thumbstickScrollEnabled = true, 
            viewStateChanged = v39
        }, {
            Contents = v1.createElement(l_View_0, {
                tag = "col size-full-0 auto-y gap-small padding-xxlarge align-x-left"
            }, {
                Title = v44, 
                TextContent = v45()
            })
        }));
    end;
end;