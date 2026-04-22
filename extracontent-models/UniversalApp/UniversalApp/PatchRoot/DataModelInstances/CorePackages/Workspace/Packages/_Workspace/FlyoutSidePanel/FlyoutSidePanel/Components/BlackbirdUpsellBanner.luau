local l_Parent_0 = script:FindFirstAncestor("FlyoutSidePanel").Parent;
local v1 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v5 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v5.Hooks.useTokens;
local l_Text_0 = v5.Text;
local l_Icon_0 = v5.Icon;
local l_IconSize_0 = v5.Enums.IconSize;
local l_IconName_0 = v5.Enums.IconName;
local v11 = require(script.Parent.Parent.Hooks.usePlaceholderLocalization);
local v12 = require(script.Parent.Parent.Analytics.FlyoutAnalytics);
local v13 = require(script.Parent.Parent.Config.FlyoutContentSettings);
local v14 = require(l_Parent_0.SharedFlags);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_FFlagBlackbirdUpdateStringFlyoutMenu_0 = v14.FFlagBlackbirdUpdateStringFlyoutMenu;
local v17 = game:DefineFastFlag("FixFlyoutMenuTextWrap", false);
return function(v18) --[[ Line: 27 ]] --[[ Name: BlackbirdUpsellBanner ]]
    -- upvalues: l_useTokens_0 (copy), l_useDispatch_0 (copy), l_FFlagBlackbirdUpdateStringFlyoutMenu_0 (copy), l_useLocalization_0 (copy), v11 (copy), v1 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v13 (copy), v12 (copy), v5 (copy), l_Icon_0 (copy), l_IconName_0 (copy), l_IconSize_0 (copy), l_Text_0 (copy), v17 (copy)
    local v19 = l_useTokens_0();
    local v20 = l_useDispatch_0();
    local v21 = if l_FFlagBlackbirdUpdateStringFlyoutMenu_0 then l_useLocalization_0({
        bannerText = "Feature.RobloxSubscription.Description.ExclusiveBenefits"
    }) else v11({
        bannerText = "Feature.RobloxSubscription.Description.ExclusiveBenefits"
    });
    local v23 = v1.useCallback(function() --[[ Line: 39 ]]
        -- upvalues: v18 (copy), v20 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v13 (ref), v12 (ref)
        v18.closeDrawer();
        v20(l_NavigateDown_0({
            name = l_AppPage_0.Blackbird
        }));
        local l_Blackbird_0 = v13.ItemType.Blackbird;
        if l_Blackbird_0 then
            v12.onFlyoutContentItemClicked({
                integrationId = l_Blackbird_0, 
                source = "click"
            });
        end;
    end, {
        v18.closeDrawer
    });
    return v1.createElement(v5.View, {
        tag = "size-full-0 auto-y padding-x-medium padding-y-xlarge", 
        onActivated = v23, 
        LayoutOrder = v18.layoutOrder
    }, {
        ContentContainer = v1.createElement(v5.View, {
            tag = "position-center-left anchor-center-left auto-xy align-y-center row gap-medium"
        }, {
            BlackbirdIcon = v1.createElement(l_Icon_0, {
                style = v19.Color.Content.Emphasis, 
                name = l_IconName_0.RobloxPlus, 
                size = l_IconSize_0.Medium, 
                LayoutOrder = 1
            }), 
            BannerText = v1.createElement(l_Text_0, {
                Size = if v17 then UDim2.new(0.75, 0, 0, 0) else UDim2.new(0.65, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                tag = "text-body-small text-align-x-left text-wrap content-emphasis", 
                Text = v21.bannerText, 
                LayoutOrder = 2
            })
        }), 
        ChevronIcon = v1.createElement(l_Icon_0, {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            name = l_IconName_0.ChevronLargeRight, 
            size = l_IconSize_0.Medium, 
            style = v19.Color.Content.Default
        })
    });
end;