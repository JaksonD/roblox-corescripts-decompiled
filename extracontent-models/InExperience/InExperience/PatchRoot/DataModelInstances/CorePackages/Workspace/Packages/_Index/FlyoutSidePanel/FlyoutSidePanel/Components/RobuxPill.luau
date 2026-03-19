local l_Parent_0 = script:FindFirstAncestor("FlyoutSidePanel").Parent;
local v1 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v5 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v5.Hooks.useTokens;
local l_Text_0 = v5.Text;
local l_Icon_0 = v5.Icon;
local l_Button_0 = v5.Button;
local l_IconSize_0 = v5.Enums.IconSize;
local l_InputSize_0 = v5.Enums.InputSize;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v13 = require(script.Parent.Parent.Analytics.FlyoutAnalytics);
local v14 = require(script.Parent.Parent.Config.FlyoutContentSettings);
local function _(v15) --[[ Line: 25 ]] --[[ Name: numWithCommas ]]
    return tostring(v15):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "");
end;
return v1.memo(function(v17) --[[ Line: 29 ]] --[[ Name: RobuxPill ]]
    -- upvalues: l_useTokens_0 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), v1 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v14 (copy), v13 (copy), v5 (copy), l_Icon_0 (copy), l_IconSize_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_InputSize_0 (copy)
    local v18 = l_useTokens_0();
    local v19 = l_useDispatch_0();
    local v20 = l_useLocalization_0({
        buyRobux = "IAPExperience.RobuxUpsell.Action.BuyRobux"
    });
    local v22 = v1.useCallback(function() --[[ Line: 35 ]]
        -- upvalues: v17 (copy), v19 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v14 (ref), v13 (ref)
        v17.closeDrawer();
        v19(l_NavigateDown_0({
            name = l_AppPage_0.PurchaseRobux
        }));
        local l_RobuxPill_0 = v14.ItemType.RobuxPill;
        v13.onFlyoutContentItemClicked({
            integrationId = l_RobuxPill_0, 
            source = "click"
        });
    end, {
        v17.closeDrawer, 
        v19
    });
    return v1.createElement(v5.View, {
        tag = "size-full-0 auto-y padding-xlarge", 
        onActivated = v22, 
        LayoutOrder = v17.layoutOrder
    }, {
        RobuxContainer = v1.createElement(v5.View, {
            tag = "position-center-left anchor-center-left auto-xy align-y-center row gap-small"
        }, {
            RobuxIcon = v1.createElement(l_Icon_0, {
                name = "icons/common/goldrobux", 
                size = l_IconSize_0.Medium, 
                LayoutOrder = 1
            }), 
            RobuxAmount = v1.createElement(l_Text_0, {
                Size = UDim2.new(0.5, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                tag = "text-title-large text-align-x-left content-emphasis text-truncate-end", 
                Text = tostring(v17.robuxBalance):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", ""), 
                LayoutOrder = 2
            })
        }), 
        BuyRobuxButton = v1.createElement(l_Button_0, {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            text = v20.buyRobux, 
            size = l_InputSize_0.Small, 
            onActivated = v22
        }), 
        UIStroke = v1.createElement("UIStroke", {
            Color = v18.Color.Stroke.Default.Color3, 
            Transparency = v18.Color.Stroke.Default.Transparency, 
            Thickness = v18.Stroke.Standard
        }), 
        UICorner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0, v18.Radius.Medium)
        })
    });
end);