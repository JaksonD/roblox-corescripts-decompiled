local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v3.Focusable;
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemOwnershipPage.OwnedItemRow);
local v8 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v11 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagL2ControllerSupport);
return (v2.forwardRef(function(v12, v13) --[[ Line: 45 ]]
    -- upvalues: l_useStyle_0 (copy), v8 (copy), v3 (copy), v2 (copy), v7 (copy), v11 (copy), l_Focusable_0 (copy), v9 (copy)
    local v14 = l_useStyle_0();
    local v15 = v8({
        itemsOnSaleHeading = "Feature.Catalog.Heading.ItemsOnSale", 
        availableItemsHeading = "Feature.Catalog.Heading.AvailableItems", 
        cannotBeResold = "Feature.Catalog.Message.CannotBeResold"
    });
    local v16 = v3.useRefCache();
    local v17 = {};
    for v18, v19 in v12.items do
        v17[v19.id] = v2.createElement(v7, {
            itemId = v12.itemId, 
            itemType = v12.itemType, 
            title = v19.title, 
            buyPrice = v19.buyPrice, 
            salePrice = v19.salePrice, 
            isOnHold = v19.isOnHold, 
            resaleRestriction = v12.resaleRestriction, 
            isOnSale = v19.isOnSale, 
            restrictionTypes = v12.restrictionTypes, 
            layoutOrder = v18, 
            onActivated = function() --[[ Line: 68 ]] --[[ Name: onActivated ]]
                -- upvalues: v12 (copy), v19 (copy)
                v12.onItemActivated(v19.id, v19.isOnSale);
            end, 
            ref = if v11() then v16[v18] else nil, 
            NextSelectionUp = if v11() and v18 > 1 then v16[v18 - 1] else nil, 
            NextSelectionDown = if v11() and v18 < #v12.items then v16[v18 + 1] else nil
        });
    end;
    local l_createElement_0 = v2.createElement;
    local v21 = if v11() then l_Focusable_0.Frame else "Frame";
    local v22 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = v12.layoutOrder, 
        ref = if v11() then v13 else nil, 
        defaultChild = if v11() then v16[1] else nil, 
        restorePreviousChildFocus = v11() and true or nil
    };
    local v23 = {
        ListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, 24), 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local v24 = false;
    if v12.resaleRestriction == v9.ResaleRestriction.Disabled then
        v24 = v2.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Text = v15.cannotBeResold, 
            Font = v14.Font.Header2.Font, 
            TextSize = v14.Font.BaseSize * v14.Font.Header2.RelativeSize, 
            TextColor3 = v14.Theme.TextEmphasis.Color, 
            BackgroundTransparency = 1, 
            LayoutOrder = 0
        });
    end;
    v23.ResaleRestrictionLabel = v24;
    v23.Rows = v2.createElement(v2.Fragment, nil, v17);
    return l_createElement_0(v21, v22, v23);
end));