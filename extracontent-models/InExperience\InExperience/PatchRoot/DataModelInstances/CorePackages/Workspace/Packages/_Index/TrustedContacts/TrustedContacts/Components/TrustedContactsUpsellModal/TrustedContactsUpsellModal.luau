local l_script_FirstAncestor_0 = script:FindFirstAncestor("TrustedContacts");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_PartialPageModal_0 = v3.App.Dialog.Modal.PartialPageModal;
local l_FullPageModal_0 = v3.App.Dialog.Modal.FullPageModal;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_useLayerCollector_0 = v3.Core.Layout.LayerCollector.useLayerCollector;
local v8 = require(l_Parent_0.Foundation);
local l_Text_0 = v8.Text;
local l_useTokens_0 = v8.Hooks.useTokens;
local l_View_0 = v8.View;
local l_ScrollView_0 = v8.ScrollView;
local l_Dialog_0 = v8.Dialog;
local l_DialogSize_0 = v8.Enums.DialogSize;
local l_ButtonVariant_0 = v8.Enums.ButtonVariant;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v18 = require(l_Parent_0.Responsive);
local v19 = require(l_script_FirstAncestor_0.Components.SocialMetadataSection);
local v20 = require(script.Parent.Parent.Parent.Analytics);
local l_useTCAnalytics_0 = v20.useTCAnalytics;
local l_EventNames_0 = v20.EventNames;
local l_FFlagProfilePlatformAddTC_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformAddTC;
return function(v24) --[[ Line: 42 ]]
    -- upvalues: v18 (copy), l_useLayerCollector_0 (copy), l_useNavigation_0 (copy), l_useTokens_0 (copy), l_useLocalization_0 (copy), l_useTCAnalytics_0 (copy), v2 (copy), l_EventNames_0 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_ScrollView_0 (copy), v8 (copy), l_Text_0 (copy), v19 (copy), l_ButtonVariant_0 (copy), l_FullPageModal_0 (copy), l_PartialPageModal_0 (copy), l_ButtonType_0 (copy), l_View_0 (copy), l_FFlagProfilePlatformAddTC_0 (copy)
    local l_isVerticallyConstrained_0 = v24.isVerticallyConstrained;
    local v26 = v18.useOrientation() == v18.BreakpointConfig.Enum.Landscape;
    local v27 = nil;
    local v28 = l_useLayerCollector_0();
    if v28 and v28.absoluteSize then
        v27 = v28.absoluteSize;
    end;
    local v29 = l_useNavigation_0();
    local v30 = l_useTokens_0();
    local v31 = l_useLocalization_0({
        gotIt = "Feature.SettingsHub.Prompt.GotIt", 
        newTrustedConnection = "Feature.Friends.TrustedConnection.Info.Modal.Header", 
        remove = "Feature.Chat.Action.Remove", 
        chatWithoutFilters = "Feature.Friends.TrustedConnection.Info.Modal.Description"
    });
    local l_fireAnalyticsEvent_0 = l_useTCAnalytics_0({
        friendId = v24.userId
    }).fireAnalyticsEvent;
    v2.useEffect(function() --[[ Line: 63 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellModalSeen);
    end, {});
    local v33 = v2.useCallback(function() --[[ Line: 67 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v24 (copy), v29 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellCloseClicked);
        if not v24.shouldOverrideNavigation then
            v29.pop();
        end;
        if v24.onClosed then
            v24.onClosed();
        end;
    end, {
        v29, 
        v24.onClosed, 
        v24.shouldOverrideNavigation
    });
    local v34 = v2.useCallback(function() --[[ Line: 77 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v24 (copy), v29 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellGotItClicked);
        if not v24.shouldOverrideNavigation then
            v29.pop();
        end;
        if v24.onAcknowledged then
            v24.onAcknowledged();
        end;
    end, {
        v29, 
        v24.onClosed, 
        v24.shouldOverrideNavigation, 
        v24.onAcknowledged
    });
    local v35 = v2.useCallback(function() --[[ Line: 87 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v24 (copy), v29 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellRemoveTrustedConnectionClicked);
        if not v24.shouldOverrideNavigation then
            v29.pop();
        end;
        if v24.onRemovedTrustedConnection then
            v24.onRemovedTrustedConnection();
        end;
    end, {
        v29, 
        v24.onRemovedTrustedConnection, 
        v24.shouldOverrideNavigation
    });
    if v26 then
        return v2.createElement(l_Dialog_0.Root, {
            size = l_DialogSize_0.Medium
        }, {
            Contents = v2.createElement(l_ScrollView_0, {
                LayoutOrder = 2, 
                Size = UDim2.fromScale(1, 0), 
                tag = "col size-full-0 auto-y shrink align-x-center padding-top-xlarge\t", 
                scroll = {
                    scrollBarVisibility = v8.Enums.ScrollBarVisibility.Auto, 
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    CanvasSize = UDim2.fromScale(1, 0), 
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    AutomaticSize = not l_isVerticallyConstrained_0 and Enum.AutomaticSize.Y or nil
                }
            }, {
                Title = v2.createElement(l_Text_0, {
                    tag = "text-heading-medium size-full-0 auto-y content-emphasized text-wrap text-align-x-left padding-bottom-xsmall", 
                    LayoutOrder = 1, 
                    Text = v31.newTrustedConnection
                }), 
                TextIntro = v2.createElement(l_Text_0, {
                    LayoutOrder = 2, 
                    tag = "auto-y size-full-0 text-align-x-left text-wrap padding-bottom-large", 
                    Text = v31.chatWithoutFilters
                }), 
                Insights = v2.createElement(v19, {
                    userId = v24.userId, 
                    layoutOrder = 3
                })
            }), 
            DialogActions = v2.createElement(l_Dialog_0.Actions, {
                LayoutOrder = 4, 
                actions = {
                    {
                        text = v31.gotIt, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        onActivated = v34
                    }, 
                    {
                        text = v31.remove, 
                        variant = l_ButtonVariant_0.Standard, 
                        onActivated = v35
                    }
                }
            })
        });
    else
        return v2.createElement(l_isVerticallyConstrained_0 and l_FullPageModal_0 or l_PartialPageModal_0, {
            title = v31.newTrustedConnection, 
            screenSize = v27, 
            onCloseClicked = v33, 
            buttonStackProps = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimaryContextual, 
                        props = {
                            onActivated = v34, 
                            text = v31.gotIt
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v35, 
                            text = v31.remove
                        }
                    }
                }, 
                forcedFillDirection = Enum.FillDirection.Horizontal
            }
        }, {
            Contents = v2.createElement(l_isVerticallyConstrained_0 and l_ScrollView_0 or l_View_0, {
                tag = {
                    ["col size-full-0 auto-y align-x-center"] = true, 
                    ["gap-medium shrink"] = l_isVerticallyConstrained_0, 
                    ["gap-large"] = not l_isVerticallyConstrained_0
                }, 
                scroll = l_isVerticallyConstrained_0 and {
                    scrollBarVisibility = v8.Enums.ScrollBarVisibility.Always, 
                    ScrollingDirection = Enum.ScrollingDirection.Y
                }
            }, {
                OuterPadding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, l_isVerticallyConstrained_0 and v30.Padding.XSmall or v30.Padding.Large), 
                    PaddingBottom = UDim.new(0, l_isVerticallyConstrained_0 and v30.Padding.Small or v30.Padding.XXLarge)
                }), 
                TextIntro = v2.createElement(l_Text_0, {
                    LayoutOrder = 1, 
                    tag = {
                        ["auto-y size-full-0 text-align-x-left text-wrap"] = true, 
                        grow = not l_isVerticallyConstrained_0
                    }, 
                    Text = v31.chatWithoutFilters
                }), 
                Insights = v2.createElement(v19, {
                    userId = v24.userId, 
                    isVerticallyConstrained = l_isVerticallyConstrained_0, 
                    layoutOrder = l_FFlagProfilePlatformAddTC_0 and 2 or nil
                })
            })
        });
    end;
end;