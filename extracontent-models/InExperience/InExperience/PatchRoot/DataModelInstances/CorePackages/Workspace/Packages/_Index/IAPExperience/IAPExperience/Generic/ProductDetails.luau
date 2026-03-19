local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.Utility.formatNumber);
local v3 = require(l_Parent_0.Utility.logger);
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.UIBlox);
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local v8 = require(l_Parent_1.Foundation);
local l_useTokens_0 = v8.Hooks.useTokens;
local l_Text_0 = v8.Text;
local l_View_0 = v8.View;
local v12 = require(l_Parent_0.Enums.VirtualItemBadgeType);
local v13 = require(l_Parent_0.Generic.ModelViewport);
local v14 = require(l_Parent_0.Generic.YellowBadge);
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_useLocalization_0 = require(l_Parent_1.Localization).Hooks.useLocalization;
local l_default_0 = require(l_Parent_1.LoggingProtocol).default;
local l_VirtualItemBadgeShownCounter_0 = require(l_Parent_0.Generic.Events.VirtualItemBadgeCounter).VirtualItemBadgeShownCounter;
local v19 = l_Images_0["icons/status/imageunavailable"];
local function _(v20) --[[ Line: 41 ]] --[[ Name: withMaxLength ]]
    if #v20 > 50 then
        return v20:sub(1, 50) .. "...";
    else
        return v20;
    end;
end;
return function(v22) --[[ Line: 57 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useTokens_0 (copy), v4 (copy), v13 (copy), l_ImageSetLabel_0 (copy), v19 (copy), v12 (copy), v14 (copy), v3 (copy), l_default_0 (copy), l_VirtualItemBadgeShownCounter_0 (copy), l_View_0 (copy), l_Text_0 (copy), v2 (copy), l_LocalizationService_0 (copy)
    local v23 = l_useLocalization_0({
        Popular = "IAPExperience.RobuxUpsell.Text.PopularItem"
    });
    local v24 = l_useTokens_0();
    local v25 = v22.isPortrait and 128 or 80;
    local v26, v27 = v4.useState(0);
    local function v30(v28) --[[ Line: 66 ]] --[[ Name: updateComponentWidth ]]
        -- upvalues: v25 (copy), v26 (copy), v27 (copy)
        if not v28 then
            return;
        else
            local v29 = v28.AbsoluteSize.X - v25 - 6;
            if v29 ~= v26 then
                v27(v29);
            end;
            return;
        end;
    end;
    local v31 = if v22.model ~= nil then v4.createElement(v13, {
        model = v22.model, 
        Position = UDim2.fromOffset(5, 5), 
        Size = UDim2.fromOffset(v25, v25)
    }) else v4.createElement(l_ImageSetLabel_0, {
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 5, 0, 5), 
        Size = UDim2.new(0, v25, 0, v25), 
        ScaleType = Enum.ScaleType.Stretch, 
        Image = if v22.itemIcon then v22.itemIcon else v19, 
        ImageColor3 = if v22.itemIcon then nil else v24.Color.Content.Default.Color3, 
        ImageTransparency = if v22.itemIcon then nil else v24.Color.Content.Default.Transparency
    });
    local v32 = if v22.badgeType and v22.badgeType == v12.Popular then v4.createElement(v14, {
        LayoutOrder = 2, 
        Text = v23.Popular, 
        Icon = "icons/menu/fire_fill"
    }) else nil;
    v4.useEffect(function() --[[ Line: 102 ]]
        -- upvalues: v32 (copy), v3 (ref), v22 (copy), l_default_0 (ref), l_VirtualItemBadgeShownCounter_0 (ref)
        if not v32 then
            return;
        else
            v3.debug({
                message = "Virtual Item Badge Shown", 
                badgeType = v22.badgeType
            });
            l_default_0:logRobloxTelemetryCounter(l_VirtualItemBadgeShownCounter_0, 1, {
                badgeType = v22.badgeType
            });
            return;
        end;
    end, {});
    local l_createElement_0 = v4.createElement;
    local l_l_View_0_0 = l_View_0;
    local v35 = {
        LayoutOrder = v22.layoutOrder, 
        Size = UDim2.new(1, 0, 0, 0), 
        tag = "auto-y row gap-small align-y-center align-x-left"
    };
    local v36 = {
        ItemIcon = v31
    };
    local l_createElement_1 = v4.createElement;
    local l_l_View_0_1 = l_View_0;
    local v39 = {
        LayoutOrder = 2, 
        onAbsoluteSizeChanged = v30, 
        Size = UDim2.new(1, 0, 0, 0), 
        tag = "col auto-y gap-small"
    };
    local v40 = {};
    local l_createElement_2 = v4.createElement;
    local l_l_Text_0_0 = l_Text_0;
    local v43 = {
        LayoutOrder = 1, 
        Size = UDim2.new(0, v26, 0, 0)
    };
    local l_itemName_0 = v22.itemName;
    v43.Text = if #l_itemName_0 > 50 then l_itemName_0:sub(1, 50) .. "..." else l_itemName_0;
    v43.tag = "auto-y text-align-x-left text-wrap text-title-medium content-emphasis";
    v40.ItemName = l_createElement_2(l_l_Text_0_0, v43);
    v40.ItemDetails = v4.createElement(l_View_0, {
        LayoutOrder = 2, 
        tag = v22.isPortrait and "auto-xy col gap-small align-y-center" or "auto-xy row gap-small align-y-center"
    }, {
        ItemCost = if v22.itemRobuxCost then v4.createElement(l_Text_0, {
            LayoutOrder = 1, 
            Text = utf8.char(57346) .. " " .. v2(l_LocalizationService_0.RobloxLocaleId, v22.itemRobuxCost), 
            tag = "auto-xy text-align-x-left text-wrap text-title-medium content-emphasis"
        }) else nil, 
        ItemBadge = v32
    });
    v36.ItemDetailsFrame = l_createElement_1(l_l_View_0_1, v39, v40);
    return l_createElement_0(l_l_View_0_0, v35, v36);
end;