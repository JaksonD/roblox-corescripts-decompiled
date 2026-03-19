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
return function() --[[ Line: 45 ]] --[[ Name: FriendsRenameInfoModal ]]
    -- upvalues: l_usePreferredInput_0 (copy), l_useDispatch_0 (copy), l_useScreenSize_0 (copy), l_useNavigation_0 (copy), l_useTCAnalytics_0 (copy), v1 (copy), l_EventNames_0 (copy), v16 (copy), l_useLocalization_0 (copy), l_PeekViewState_0 (copy), l_dependencyArray_0 (copy), l_useAppPolicy_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_Text_0 (copy), l_View_0 (copy), v27 (copy), l_InputLabel_0 (copy), l_InputLabelSize_0 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy), l_PeekView_0 (copy)
    local v28 = l_usePreferredInput_0();
    local v29 = l_useDispatch_0();
    local v30 = l_useScreenSize_0();
    local v31 = l_useNavigation_0();
    local l_fireAnalyticsEvent_0 = l_useTCAnalytics_0().fireAnalyticsEvent;
    v1.useEffect(function() --[[ Line: 53 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref)
        l_fireAnalyticsEvent_0(l_EventNames_0.FriendsRenameInfoModalSeen);
    end, {});
    local v33 = v28 ~= v16.Input.Touch;
    local v34 = l_useLocalization_0({
        gotIt = "Feature.Avatar.Action.GotIt", 
        learnMore = "Feature.Chat.Action.LearnMore", 
        introducingConnections = "Feature.Friends.Label.IntroducingConnections", 
        renameInfoText = "Feature.Friends.Label.RenameInfoText"
    });
    local v35 = v1.useCallback(function() --[[ Line: 67 ]]
        -- upvalues: v31 (copy)
        v31.pop();
    end, {
        v31
    });
    local v38 = v1.useCallback(function(v36, _) --[[ Line: 71 ]]
        -- upvalues: l_PeekViewState_0 (ref), v31 (copy)
        if v36 == l_PeekViewState_0.Closed or v36 == l_PeekViewState_0.Hidden then
            v31.goBack();
        end;
    end, l_dependencyArray_0(v31));
    local v40 = l_useAppPolicy_0(function(v39) --[[ Line: 77 ]]
        return v39.getWebViewSupport();
    end);
    local v41 = v1.useCallback(function() --[[ Line: 81 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v29 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        l_fireAnalyticsEvent_0(l_EventNames_0.FriendsRenameLearnMoreClicked);
        v29(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = "https://en.help.roblox.com/hc/en-us/articles/37725513985812", 
            extraProps = {
                title = ""
            }
        }, nil));
    end, {
        v29
    });
    local l_introducingConnections_0 = v34.introducingConnections;
    local v43 = v1.useMemo(function() --[[ Line: 93 ]]
        -- upvalues: v1 (ref), l_Text_0 (ref), l_introducingConnections_0 (copy)
        return v1.createElement(l_Text_0, {
            LayoutOrder = 1, 
            tag = "auto-y size-full-0 text-align-x-left text-wrap text-heading-small", 
            Text = l_introducingConnections_0
        });
    end, {
        l_introducingConnections_0
    });
    local v44 = v1.useCallback(function() --[[ Line: 101 ]]
        -- upvalues: v1 (ref), l_View_0 (ref), v33 (copy), v27 (ref), l_Text_0 (ref), l_InputLabel_0 (ref), l_InputLabelSize_0 (ref), v34 (copy), v40 (copy), v41 (copy)
        return v1.createElement(l_View_0, {
            tag = "col size-full-0 auto-y gap-small padding-0", 
            ["align-x-left"] = not v33, 
            ["align-x-center"] = v33, 
            LayoutOrder = 2
        }, {
            BodyText = v1.createElement(if v27 then l_Text_0 else l_InputLabel_0, {
                LayoutOrder = 1, 
                tag = v27 and "auto-y size-full-0 text-wrap grow text-align-x-left" or "auto-y size-full-0 text-wrap grow", 
                RichText = true, 
                size = if v27 then nil else l_InputLabelSize_0.Large, 
                Text = v34.renameInfoText
            }), 
            LearnMoreWebLink = v40 and v1.createElement(if v27 then l_Text_0 else l_InputLabel_0, {
                LayoutOrder = 2, 
                tag = v27 and "auto-y size-full-0 text-align-x-left" or "auto-y size-full-0", 
                RichText = true, 
                Text = ("<u>%*</u>"):format(v34.learnMore), 
                size = if v27 then nil else l_InputLabelSize_0.Large, 
                onActivated = v41
            })
        });
    end, l_dependencyArray_0(v41, v34, v33));
    if v33 then
        return (v1.createElement(l_InteractiveAlert_0, {
            richText = true, 
            screenSize = v30, 
            title = l_introducingConnections_0, 
            middleContent = v44, 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v35, 
                            text = v34.gotIt
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
            viewStateChanged = v38
        }, {
            Contents = v1.createElement(l_View_0, {
                tag = "col size-full-0 auto-y gap-small padding-xxlarge align-x-left"
            }, {
                Title = v43, 
                TextContent = v44()
            })
        }));
    end;
end;