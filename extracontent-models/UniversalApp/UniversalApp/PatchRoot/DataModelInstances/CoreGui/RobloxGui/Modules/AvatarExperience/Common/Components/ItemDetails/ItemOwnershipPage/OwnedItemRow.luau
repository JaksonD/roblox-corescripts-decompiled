local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.React);
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_ItemTile_0 = v5.Tile.ItemTile;
local l_Button_0 = v5.App.Button.Button;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v11 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v13 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v14 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v15 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local v17 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagL2ControllerSupport);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return (v2.forwardRef(function(v19, v20) --[[ Line: 47 ]]
    -- upvalues: v11 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v13 (copy), l_useStyle_0 (copy), v14 (copy), v15 (copy), l_NumberLocalization_0 (copy), v2 (copy), l_ItemTile_0 (copy), v12 (copy), v17 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_Focusable_0 (copy)
    local v21 = v11.GetRbxThumbType(v19.itemType);
    local v22 = l_getRbxthumbWithTypeSizeAndOptions_0(v19.itemId, v21, 150);
    local v23 = v13({
        holdingLabel = "Feature.Catalog.Label.Holding", 
        offSaleLabel = "Feature.Catalog.Heading.TakeOffSale", 
        sellAction = "Feature.Catalog.Action.Sell", 
        buyPriceLabel = "Feature.Catalog.Label.BuyPrice", 
        salePriceLabel = "Feature.Catalog.Label.SalePrice"
    });
    local v24 = l_useStyle_0();
    local v25 = v14(v15);
    local v26 = v19.buyPrice and string.format("%.0f", v19.buyPrice);
    local v27 = v26 and l_NumberLocalization_0.localize(v26, v25:GetLocale());
    local v28 = v19.salePrice and string.format("%.0f", v19.salePrice);
    local v29 = v28 and l_NumberLocalization_0.localize(v28, v25:GetLocale());
    local v30 = if v19.isOnHold then v23.holdingLabel else if v19.isOnSale then v23.offSaleLabel else v23.sellAction;
    local l_createElement_0 = v2.createElement;
    local v32 = "Frame";
    local v33 = {
        Size = UDim2.new(1, 0, 0, 100), 
        BackgroundTransparency = 1, 
        LayoutOrder = v19.layoutOrder
    };
    local v34 = {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 8)
        }), 
        ItemTileContainer = v2.createElement("Frame", {
            Size = UDim2.fromOffset(100, 100), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            ItemTile = v2.createElement(l_ItemTile_0, {
                thumbnail = v22, 
                name = "", 
                restrictionTypes = v19.restrictionTypes
            })
        })
    };
    local l_createElement_1 = v2.createElement;
    local v36 = "Frame";
    local v37 = {
        Size = UDim2.new(1, -108, 1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = 2
    };
    local v38 = {
        LabelsContainer = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1
        }, {
            Layout = v2.createElement("UIListLayout", {
                Padding = UDim.new(0, 4), 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            ItemTitleLabel = v2.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                Text = v19.title, 
                Font = v24.Font.Header2.Font, 
                TextSize = v24.Font.BaseSize * v24.Font.Header2.RelativeSize, 
                TextColor3 = v24.Theme.TextEmphasis.Color, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }), 
            BuyPriceLabel = v27 and v2.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = v23.buyPriceLabel .. " " .. v12.RobloxEmoji.Robux .. v27, 
                Font = v24.Font.Body.Font, 
                TextSize = v24.Font.BaseSize * v24.Font.Body.RelativeSize, 
                TextColor3 = v24.Theme.TextEmphasis.Color, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }), 
            SalePriceLabel = v29 and v2.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = v23.salePriceLabel .. " " .. v12.RobloxEmoji.Robux .. v29, 
                Font = v24.Font.Body.Font, 
                TextSize = v24.Font.BaseSize * v24.Font.Body.RelativeSize, 
                TextColor3 = v24.Theme.TextEmphasis.Color, 
                BackgroundTransparency = 1, 
                LayoutOrder = 3
            })
        })
    };
    local v39 = false;
    if v19.resaleRestriction ~= v12.ResaleRestriction.Disabled then
        v39 = not v17() and v2.createElement(l_Button_0, {
            buttonType = if v19.isOnSale then l_ButtonType_0.Secondary else l_ButtonType_0.PrimarySystem, 
            size = UDim2.new(1, 0, 0, 28), 
            text = v30, 
            position = UDim2.fromScale(0, 1), 
            anchorPoint = Vector2.new(0, 1), 
            layoutOrder = 2, 
            onActivated = v19.onActivated, 
            isDisabled = v19.isOnHold
        });
    end;
    v38.Button = v39;
    v39 = false;
    if v19.resaleRestriction ~= v12.ResaleRestriction.Disabled then
        v39 = v17() and v2.createElement(l_Focusable_0.Frame, {
            Size = UDim2.new(1, 0, 0, 28), 
            Position = UDim2.fromScale(0, 1), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            NextSelectionUp = if v17() then v19.NextSelectionUp else nil, 
            NextSelectionDown = if v17() then v19.NextSelectionDown else nil, 
            ref = if v17() then v20 else nil
        }, {
            OnSaleButton = v19.isOnSale and v2.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.Secondary, 
                size = UDim2.fromScale(1, 1), 
                text = v30, 
                onActivated = v19.onActivated, 
                isDisabled = v19.isOnHold
            }), 
            OffSaleButton = not v19.isOnSale and v2.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.PrimarySystem, 
                size = UDim2.fromScale(1, 1), 
                text = v30, 
                onActivated = v19.onActivated, 
                isDisabled = v19.isOnHold
            })
        });
    end;
    v38.ButtonContainer = v39;
    v34.DetailsContainer = l_createElement_1(v36, v37, v38);
    return l_createElement_0(v32, v33, v34);
end));