local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Localization);
local v5 = require(l_Parent_0.SharedFlags);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_ControlState_0 = v3.Core.Control.Enum.ControlState;
local l_NavigationTab_0 = v3.App.Navigation.NavigationTab;
local l_NavigationTabLayout_0 = v3.App.Navigation.Enum.NavigationTabLayout;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_FFlagAppNavLabelScaling_0 = v5.FFlagAppNavLabelScaling;
return v2.memo(function(v12) --[[ Line: 50 ]] --[[ Name: AppNavItem ]]
    -- upvalues: l_useStyle_0 (copy), l_useLocalization_0 (copy), v2 (copy), l_ControlState_0 (copy), l_FFlagAppNavLabelScaling_0 (copy), l_NavigationTab_0 (copy), l_NavigationTabLayout_0 (copy)
    local l_Tokens_0 = l_useStyle_0().Tokens;
    local v14 = l_useLocalization_0({
        labelText = v12.item.labelText
    });
    local v15, v16 = v2.useState(l_ControlState_0.Initialize);
    local l_Footer_0 = l_Tokens_0.Semantic.Typography.Footer;
    local v18 = v12.systemBarLabelTextSizeBinding.default:getBinding();
    v2.useEffect(function() --[[ Line: 59 ]]
        -- upvalues: l_FFlagAppNavLabelScaling_0 (ref), v12 (copy), v14 (copy), l_Footer_0 (copy), l_Tokens_0 (copy)
        if l_FFlagAppNavLabelScaling_0 then
            v12.systemBarLabelTextSizeBinding.default:setTextToMaxSize(v14.labelText or "", l_Footer_0.Font, Vector2.new(l_Tokens_0.Global.Space_600, l_Tokens_0.Global.Space_600), l_Tokens_0.Global.FontSize_50);
            return;
        else
            v12.systemBarLabelTextSizeBinding.default:getMinTextSize(v14.labelText or "", l_Footer_0.Font, Vector2.new(l_Tokens_0.Global.Space_600, l_Tokens_0.Global.Space_600));
            return;
        end;
    end, {
        v18, 
        v14.labelText, 
        l_Tokens_0
    });
    return v2.createElement(l_NavigationTab_0, {
        iconImage = v12.item.iconImage, 
        iconCheckedImage = v12.item.iconCheckedImage, 
        renderIcon = v12.item.renderIcon and function(v19) --[[ Line: 80 ]]
            -- upvalues: v12 (copy), v15 (copy)
            return v12.item.renderIcon(v19, v15);
        end or nil, 
        hasLabel = v12.hasLabel, 
        labelText = v14.labelText, 
        labelTypography = {
            Font = l_Footer_0.Font, 
            FontSize = v18, 
            LineHeight = l_Footer_0.LineHeight, 
            LetterSpacing = l_Footer_0.LetterSpacing
        }, 
        isChecked = v12.isChecked, 
        badgeVariant = v12.item.badgeVariant, 
        badgeValue = v12.item.badgeValue, 
        layout = l_NavigationTabLayout_0.Stacked, 
        anchorPoint = if v12.isCenterPositioned then Vector2.new(0.5, 0.5) else nil, 
        position = if v12.isCenterPositioned then UDim2.fromScale(0.5, 0.5) else nil, 
        onActivated = v12.item.onActivated, 
        onStateChanged = v12.item.renderIcon and function(_, v21) --[[ Line: 100 ]]
            -- upvalues: v16 (copy)
            v16(v21);
        end or nil
    });
end, function(v22, v23) --[[ Line: 41 ]] --[[ Name: arePropsEqual ]]
    -- upvalues: v1 (copy)
    return v1.Dictionary.equals(v22.item, v23.item) and v22.systemBarLabelTextSizeBinding == v23.systemBarLabelTextSizeBinding and v22.isChecked == v23.isChecked and v22.isCenterPositioned == v23.isCenterPositioned and v22.hasLabel == v23.hasLabel;
end);