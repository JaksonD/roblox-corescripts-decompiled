local l_Parent_0 = script:FindFirstAncestor("TrustedContacts").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_PartialPageModal_0 = v2.App.Dialog.Modal.PartialPageModal;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v9 = require(l_Parent_0.Foundation);
local l_Skeleton_0 = v9.Skeleton;
local l_Text_0 = v9.Text;
local l_Icon_0 = v9.Icon;
local l_IconSize_0 = v9.Enums.IconSize;
local l_useTokens_0 = v9.Hooks.useTokens;
local l_AmpApiProvider_0 = require(l_Parent_0.AmpUpsell).AmpApiProvider;
local l_AccessResponseEnum_0 = require(l_Parent_0.AmpUpsell).AmpEnums.AccessResponseEnum;
local v17 = require(script.Parent.Parent.Parent.Analytics);
local l_useTCAnalytics_0 = v17.useTCAnalytics;
local l_EventNames_0 = v17.EventNames;
local l_FStringCanAccessTrustedContactsAmpNameSpace_0 = require(l_Parent_0.SharedFlags).FStringCanAccessTrustedContactsAmpNameSpace;
local l_FStringIsVerified18PlusAmpFeature_0 = require(l_Parent_0.SharedFlags).FStringIsVerified18PlusAmpFeature;
local l_FFlagCreateConnectionsHub_0 = require(l_Parent_0.SharedFlags).FFlagCreateConnectionsHub;
local v23 = game:DefineFastFlag("ConsoleFriendsPageNavigation", false);
local function v25(v24) --[[ Line: 38 ]] --[[ Name: TextWithIcon ]]
    -- upvalues: v1 (copy), l_Icon_0 (copy), l_IconSize_0 (copy), l_Text_0 (copy)
    return v1.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = v24.layoutOrder
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v24.iconPadding), 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        Icon = v1.createElement(l_Icon_0, {
            name = v24.icon, 
            size = l_IconSize_0.Small, 
            LayoutOrder = 1
        }), 
        Text = v1.createElement(l_Text_0, {
            tag = "auto-y grow size-full-0 text-align-x-left text-wrap", 
            Text = v24.text, 
            LayoutOrder = 2
        })
    });
end;
return function(_) --[[ Line: 65 ]] --[[ Name: TrustedContactsEducationModal ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useNavigation_0 (copy), l_useTokens_0 (copy), v1 (copy), l_AccessResponseEnum_0 (copy), l_AmpApiProvider_0 (copy), l_FStringIsVerified18PlusAmpFeature_0 (copy), l_FStringCanAccessTrustedContactsAmpNameSpace_0 (copy), l_useTCAnalytics_0 (copy), l_EventNames_0 (copy), l_FFlagCreateConnectionsHub_0 (copy), l_AppPage_0 (copy), v23 (copy), l_useLocalization_0 (copy), l_PartialPageModal_0 (copy), l_ButtonType_0 (copy), l_Skeleton_0 (copy), l_Text_0 (copy), v25 (copy)
    local v27 = l_useScreenSize_0();
    local v28 = l_useNavigation_0();
    local v29 = l_useTokens_0();
    local v30, v31 = v1.useState(l_AccessResponseEnum_0.Pending);
    v1.useEffect(function() --[[ Line: 71 ]]
        -- upvalues: l_AmpApiProvider_0 (ref), l_FStringIsVerified18PlusAmpFeature_0 (ref), l_FStringCanAccessTrustedContactsAmpNameSpace_0 (ref), v31 (copy)
        local v32 = l_AmpApiProvider_0.upsellFeatureAccess(l_FStringIsVerified18PlusAmpFeature_0, {}, l_FStringCanAccessTrustedContactsAmpNameSpace_0);
        v31(v32.access);
    end, {});
    local l_fireAnalyticsEvent_0 = l_useTCAnalytics_0().fireAnalyticsEvent;
    v1.useEffect(function() --[[ Line: 78 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCEducationModalSeen);
    end, {});
    local v34 = v1.useCallback(function() --[[ Line: 82 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v28 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCEducationCloseClicked);
        v28.pop();
    end, {
        v28
    });
    local v35 = v1.useCallback(function() --[[ Line: 87 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v28 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCEducationGotItClicked);
        v28.pop();
    end, {
        v28
    });
    local v36 = v1.useCallback(function() --[[ Line: 92 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), l_FFlagCreateConnectionsHub_0 (ref), v28 (copy), l_AppPage_0 (ref), v23 (ref)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCEducationManageConnectionsClicked);
        if l_FFlagCreateConnectionsHub_0 then
            v28.navigate(l_AppPage_0.CoHubMyConnections);
            return;
        elseif v23 then
            v28.navigate(l_AppPage_0.ViewFriends);
            return;
        else
            v28.replace(l_AppPage_0.ViewFriends);
            return;
        end;
    end, {
        v28
    });
    local v37 = l_useLocalization_0({
        title = "Feature.Friends.TCEducation.Title", 
        textIntro = "Feature.Friends.TCEducation.Modal.TextIntro", 
        textIntro18Plus = "Feature.Friends.TCEducation.Modal.TextIntro.EighteenPlus", 
        textChatWithoutFilters = "Feature.Friends.TCFeature.ChatWithoutFilters", 
        textPartyVoice = "Feature.Friends.TCFeature.PartyVoice", 
        textAndMore = "Feature.Friends.TCFeature.AndMore", 
        textOutro = "Feature.Friends.TCEducation.Modal.TextOutro", 
        textOutro18Plus = "Feature.Friends.TCEducation.Modal.TextOutro.EighteenPlus", 
        buttonManage = "Feature.Avatar.Heading.Manage", 
        buttonGotIt = "Feature.Friends.Button.GotIt"
    });
    return v1.createElement(l_PartialPageModal_0, {
        title = v37.title, 
        screenSize = v27, 
        onCloseClicked = v34, 
        buttonStackProps = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    props = {
                        onActivated = v35, 
                        text = v37.buttonGotIt
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        onActivated = v36, 
                        text = v37.buttonManage
                    }
                }
            }, 
            forcedFillDirection = Enum.FillDirection.Horizontal
        }
    }, {
        ViewContainer = v1.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            TextContainer = v1.createElement("Frame", {
                LayoutOrder = 2, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                BackgroundTransparency = 1
            }, {
                UIListLayout = v1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v29.Padding.Large), 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                OuterPadding = v1.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v29.Padding.Medium), 
                    PaddingBottom = UDim.new(0, v29.Padding.Large)
                }), 
                ConnectTextIntro = if v30 == l_AccessResponseEnum_0.Pending then v1.createElement(l_Skeleton_0, {
                    Size = UDim2.new(1, 0, 0, 30), 
                    LayoutOrder = 1
                }) else v1.createElement(l_Text_0, {
                    LayoutOrder = 1, 
                    tag = "auto-y grow size-full-0 text-align-x-left text-wrap", 
                    Text = if v30 == l_AccessResponseEnum_0.Granted then v37.textIntro18Plus else v37.textIntro
                }), 
                ConnectOptionText1 = v1.createElement(v25, {
                    layoutOrder = 2, 
                    icon = "icons/menu/platformChatOff_small", 
                    text = v37.textChatWithoutFilters, 
                    iconPadding = v29.Padding.Medium
                }), 
                ConnectOptionText2 = v1.createElement(v25, {
                    layoutOrder = 3, 
                    icon = "icons/controls/microphone_small", 
                    text = v37.textPartyVoice, 
                    iconPadding = v29.Padding.Medium
                }), 
                ConnectOptionText3 = v1.createElement(v25, {
                    layoutOrder = 4, 
                    icon = "icons/actions/edit/add_small", 
                    text = v37.textAndMore, 
                    iconPadding = v29.Padding.Medium
                }), 
                ConnectTextOutro = if v30 == l_AccessResponseEnum_0.Pending then v1.createElement(l_Skeleton_0, {
                    Size = UDim2.new(1, 0, 0, 60), 
                    LayoutOrder = 5
                }) else v1.createElement(l_Text_0, {
                    LayoutOrder = 5, 
                    tag = "auto-y grow size-full-0 text-align-x-left text-wrap", 
                    Text = if v30 == l_AccessResponseEnum_0.Granted then v37.textOutro18Plus else v37.textOutro
                })
            })
        })
    });
end;