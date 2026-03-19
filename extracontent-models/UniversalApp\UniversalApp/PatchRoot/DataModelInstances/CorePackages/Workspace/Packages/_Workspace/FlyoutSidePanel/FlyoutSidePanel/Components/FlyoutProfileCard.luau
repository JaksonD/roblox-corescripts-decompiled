local l_Parent_0 = script:FindFirstAncestor("FlyoutSidePanel").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.BuilderIcons);
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_Parent_0.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
local l_Icon_0 = v3.Icon;
local l_IconSize_0 = v3.Enums.IconSize;
local l_IconName_0 = v3.Enums.IconName;
local l_Text_0 = v3.Text;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_LoadableImage_0 = v2.App.Loading.LoadableImage;
local v12 = require(script.Parent.Parent.Analytics.FlyoutAnalytics);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local v15 = require(script.Parent.ChevronSmallDownButton);
local l_FFlagEnableBlackbirdCheckDev_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdCheckDev;
return function(v17) --[[ Line: 32 ]] --[[ Name: FlyoutProfileCard ]]
    -- upvalues: l_useTokens_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), v1 (copy), v12 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), v3 (copy), l_LoadableImage_0 (copy), l_Text_0 (copy), l_Icon_0 (copy), v4 (copy), l_IconSize_0 (copy), l_IconName_0 (copy), v15 (copy)
    local v18 = l_useTokens_0();
    local v19 = l_useRoactService_0(l_AppEventIngestService_0);
    local l_localUserModel_0 = v17.localUserModel;
    local v22 = v1.useCallback(function() --[[ Line: 36 ]]
        -- upvalues: v17 (copy), l_localUserModel_0 (copy), v12 (ref), v19 (copy)
        v17.closeDrawer();
        if v17.onProfileActivated then
            v17.onProfileActivated();
            local v21 = l_localUserModel_0 and l_localUserModel_0.id or "";
            v12.sendMoreLegacyAndFlyoutItemClickEvent(v19, "Profile", v21);
        end;
    end, {
        l_localUserModel_0, 
        v17.onProfileActivated, 
        v17.closeDrawer, 
        v19
    });
    local v23 = v1.useCallback(function() --[[ Line: 44 ]]
        -- upvalues: v17 (copy)
        v17.closeDrawer();
        if v17.onSwitchAccountActivated then
            v17.onSwitchAccountActivated();
        end;
    end, {
        v17.onSwitchAccountActivated, 
        v17.closeDrawer
    });
    local v24 = v1.useMemo(function() --[[ Line: 51 ]]
        -- upvalues: l_localUserModel_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (ref)
        if l_localUserModel_0 and l_localUserModel_0.id then
            return l_getStandardSizeAvatarHeadShotRbxthumb_0(l_localUserModel_0.id);
        else
            return nil;
        end;
    end, {
        l_localUserModel_0
    });
    local v25 = v1.useMemo(function() --[[ Line: 58 ]]
        -- upvalues: l_localUserModel_0 (copy)
        return l_localUserModel_0 and l_localUserModel_0.membership == Enum.MembershipType.Premium;
    end, {
        l_localUserModel_0
    });
    local v26 = if l_FFlagEnableBlackbirdCheckDev_0 then v17.isRobloxSubscriber else false;
    local v27 = v25 and not l_FFlagEnableBlackbirdCheckDev_0;
    local v28 = l_localUserModel_0 and l_localUserModel_0.name or "";
    local v29 = l_localUserModel_0 and l_localUserModel_0.displayName or "";
    return v1.createElement(v3.View, {
        tag = "auto-y size-full-0", 
        LayoutOrder = v17.layoutOrder
    }, {
        ProfileCardButton = v1.createElement("TextButton", {
            AutoButtonColor = false, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Text = "", 
            AutomaticSize = Enum.AutomaticSize.XY, 
            [v1.Event.Activated] = v22
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, v18.Gap.Medium)
            }), 
            UserAvatar = v1.createElement(l_LoadableImage_0, {
                Size = UDim2.new(0, v18.Size.Size_1600, 0, v18.Size.Size_1600), 
                BackgroundColor3 = v18.Semantic.Color.Common.Placeholder.Color3, 
                BackgroundTransparency = v18.Semantic.Color.Common.Placeholder.Transparency, 
                Image = v24, 
                useShimmerAnimationWhileLoading = true, 
                cornerRadius = UDim.new(0.5, 0), 
                shouldHandleReloads = true, 
                LayoutOrder = 1
            }), 
            UserInfoContainer = v1.createElement(v3.View, {
                tag = "position-center-left anchor-center-left auto-xy col", 
                LayoutOrder = 2
            }, {
                UsernameContainer = v1.createElement(v3.View, {
                    tag = "position-center-left anchor-center-left auto-xy row gap-xsmall", 
                    LayoutOrder = 1
                }, {
                    DisplayNameText = v1.createElement(l_Text_0, {
                        tag = "auto-xy text-title-medium content-emphasis text-align-x-left", 
                        Text = v29, 
                        LayoutOrder = 1
                    }), 
                    PremiumIcon = if v27 then v1.createElement(l_Icon_0, {
                        style = v18.Color.Content.Emphasis, 
                        name = v4.Icon.Premium, 
                        size = l_IconSize_0.Small, 
                        LayoutOrder = 2
                    }) else nil, 
                    SubscriberBadge = if l_FFlagEnableBlackbirdCheckDev_0 and v26 then v1.createElement(l_Icon_0, {
                        style = v18.Color.Content.Emphasis, 
                        name = l_IconName_0.PaperAirplane, 
                        size = l_IconSize_0.Small, 
                        LayoutOrder = 3
                    }) else nil
                }), 
                UserName = v1.createElement(l_Text_0, {
                    tag = "auto-xy text-body-medium content-default text-align-x-left", 
                    Text = "@" .. v28, 
                    LayoutOrder = 2
                })
            })
        }), 
        SwitchAccountButton = if v17.onSwitchAccountActivated then v1.createElement(v15, {
            onActivated = v23
        }) else nil
    });
end;