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
return function(v14) --[[ Line: 22 ]] --[[ Name: BlackbirdUpsellBanner ]]
    -- upvalues: l_useTokens_0 (copy), l_useDispatch_0 (copy), v11 (copy), v1 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v13 (copy), v12 (copy), v5 (copy), l_Icon_0 (copy), l_IconName_0 (copy), l_IconSize_0 (copy), l_Text_0 (copy)
    local v15 = l_useTokens_0();
    local v16 = l_useDispatch_0();
    local v17 = v11({
        bannerText = "Feature.RobloxSubscription.Description.ExclusiveBenefits", 
        subscribe = "Feature.RobloxSubscription.Action.Subscribe"
    });
    local v19 = v1.useCallback(function() --[[ Line: 31 ]]
        -- upvalues: v14 (copy), v16 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v13 (ref), v12 (ref)
        v14.closeDrawer();
        v16(l_NavigateDown_0({
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
        v14.closeDrawer
    });
    return v1.createElement(v5.View, {
        tag = "size-full-0 auto-y padding-x-medium padding-y-xlarge", 
        onActivated = v19, 
        LayoutOrder = v14.layoutOrder
    }, {
        ContentContainer = v1.createElement(v5.View, {
            tag = "position-center-left anchor-center-left auto-xy align-y-center row gap-medium"
        }, {
            BlackbirdIcon = v1.createElement(l_Icon_0, {
                style = v15.Color.Content.Emphasis, 
                name = l_IconName_0.PaperAirplane, 
                size = l_IconSize_0.Medium, 
                LayoutOrder = 1
            }), 
            BannerText = v1.createElement(l_Text_0, {
                Size = UDim2.new(0.65, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                tag = "text-body-medium text-align-x-left text-wrap content-emphasis", 
                Text = v17.bannerText, 
                LayoutOrder = 2
            })
        }), 
        SubscribeText = v1.createElement(l_Text_0, {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            tag = "auto-xy text-body-medium content-default", 
            Text = "<u>" .. v17.subscribe .. "</u>", 
            RichText = true
        }), 
        UIStroke = v1.createElement("UIStroke", {
            Color = v15.Color.Stroke.Default.Color3, 
            Transparency = v15.Color.Stroke.Default.Transparency, 
            Thickness = v15.Stroke.Standard
        }), 
        UICorner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0, v15.Radius.Medium)
        })
    });
end;