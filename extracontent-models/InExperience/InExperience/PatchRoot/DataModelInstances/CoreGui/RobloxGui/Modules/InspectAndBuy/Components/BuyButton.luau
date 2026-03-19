local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local l_GuiService_0 = game:GetService("GuiService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Colors);
local v9 = require(l_Parent_0.Thunks.PromptPurchase);
local v10 = require(l_Parent_0.getSelectionImageObjectRounded);
local v11 = require(l_Parent_0.UtilityFunctions);
local v12 = v4.PureComponent:extend("BuyButton");
v12.init = function(v13) --[[ Line: 21 ]] --[[ Name: init ]]
    -- upvalues: v10 (copy), l_GuiService_0 (copy)
    v13.selectedImage = v10();
    v13.connections = {};
    v13.lastGamepadFocus = nil;
    v13.onPromptPurchaseFinished = function() --[[ Line: 26 ]]
        -- upvalues: v13 (copy), l_GuiService_0 (ref)
        if v13.props.gamepadEnabled and v13.props.visible then
            l_GuiService_0.SelectedCoreObject = v13.lastGamepadFocus;
        end;
    end;
end;
v12.render = function(v14) --[[ Line: 34 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), v4 (copy), v8 (copy), l_GuiService_0 (copy), l_AppFonts_0 (copy)
    local l_itemType_0 = v14.props.itemType;
    local l_itemId_0 = v14.props.itemId;
    local l_showRobuxIcon_0 = v14.props.showRobuxIcon;
    local l_forSale_0 = v14.props.forSale;
    local l_promptPurchase_0 = v14.props.promptPurchase;
    local l_buyText_0 = v14.props.buyText;
    local l_buyButtonRef_0 = v14.props.buyButtonRef;
    local l_collectibleItemId_0 = v14.props.collectibleItemId;
    local l_collectibleLowestAvailableResaleProductId_0 = v14.props.collectibleLowestAvailableResaleProductId;
    local l_collectibleLowestAvailableResaleItemInstanceId_0 = v14.props.collectibleLowestAvailableResaleItemInstanceId;
    local l_collectibleLowestResalePrice_0 = v14.props.collectibleLowestResalePrice;
    local v26 = v11.isLimited2Point0_Or_LimitedCollectible(v14.props.assetInfo);
    local v27 = UDim2.new(0, v14:getBuyButtonTextSize(l_buyText_0), 1, 0);
    local v28 = 0;
    if not l_forSale_0 then
        v28 = 0.5;
    end;
    return v4.createElement("ImageButton", {
        AnchorPoint = Vector2.new(0.5, 0), 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0.5, -32, 0, 44), 
        Image = "rbxasset://textures/ui/InspectMenu/Button_white.png", 
        ImageColor3 = v8.Green, 
        SelectionImageObject = v14.selectedImage, 
        LayoutOrder = 3, 
        ImageTransparency = v28, 
        [v4.Ref] = l_buyButtonRef_0, 
        [v4.Event.Activated] = function() --[[ Line: 66 ]]
            -- upvalues: l_forSale_0 (copy), v14 (copy), l_GuiService_0 (ref), l_promptPurchase_0 (copy), l_itemId_0 (copy), l_itemType_0 (copy), l_collectibleItemId_0 (copy), l_collectibleLowestAvailableResaleProductId_0 (copy), l_collectibleLowestAvailableResaleItemInstanceId_0 (copy), l_collectibleLowestResalePrice_0 (copy), v26 (copy)
            if l_forSale_0 then
                if v14.props.gamepadEnabled and v14.props.visible then
                    v14.lastGamepadFocus = l_GuiService_0.SelectedCoreObject;
                    l_GuiService_0.SelectedCoreObject = nil;
                end;
                l_promptPurchase_0(l_itemId_0, l_itemType_0, l_collectibleItemId_0, l_collectibleLowestAvailableResaleProductId_0, l_collectibleLowestAvailableResaleItemInstanceId_0, l_collectibleLowestResalePrice_0, v26);
            end;
        end
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        RobuxIcon = v4.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 16, 0, 16), 
            Image = "rbxasset://textures/ui/common/robux_small.png", 
            ImageTransparency = v28, 
            ImageColor3 = v8.White, 
            LayoutOrder = 1, 
            Visible = l_showRobuxIcon_0
        }), 
        BuyText = v4.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Size = v27, 
            Text = tostring(l_buyText_0), 
            Font = l_AppFonts_0.default:getDefault(), 
            TextSize = 16, 
            TextColor3 = v8.White, 
            TextTransparency = v28, 
            LayoutOrder = 2, 
            TextXAlignment = Enum.TextXAlignment.Center
        })
    });
end;
v12.didMount = function(v29) --[[ Line: 114 ]] --[[ Name: didMount ]]
    -- upvalues: l_MarketplaceService_0 (copy)
    local v30 = l_MarketplaceService_0.PromptPurchaseFinished:Connect(v29.onPromptPurchaseFinished);
    local v31 = l_MarketplaceService_0.PromptBundlePurchaseFinished:Connect(v29.onPromptPurchaseFinished);
    table.insert(v29.connections, v30);
    table.insert(v29.connections, v31);
end;
v12.willUnmount = function(v32) --[[ Line: 122 ]] --[[ Name: willUnmount ]]
    for _, v34 in pairs(v32.connections) do
        v34:Disconnect();
    end;
end;
v12.getBuyButtonTextSize = function(v35, v36) --[[ Line: 128 ]] --[[ Name: getBuyButtonTextSize ]]
    -- upvalues: l_TextService_0 (copy), l_AppFonts_0 (copy)
    if v35.props.buyButtonRef.current then
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(tostring(v36), 16, l_AppFonts_0.default:getDefault(), Vector2.new(v35.props.buyButtonRef.current.AbsoluteSize.X, 5000));
        v35.props.buyButtonRef.Size = UDim2.new(0, 1, 0, l_l_TextService_0_TextSize_0.Y);
        return l_l_TextService_0_TextSize_0.X > 32 and l_l_TextService_0_TextSize_0.X or 32;
    else
        return 0;
    end;
end;
return v5.UNSTABLE_connect2(function(v38, _) --[[ Line: 143 ]]
    local l_assetId_0 = v38.detailsInformation.assetId;
    return {
        locale = v38.locale, 
        view = v38.view, 
        assetInfo = v38.assets[l_assetId_0], 
        gamepadEnabled = v38.gamepadEnabled, 
        visible = v38.visible
    };
end, function(v41) --[[ Line: 153 ]]
    -- upvalues: v9 (copy)
    return {
        promptPurchase = function(v42, v43, v44, v45, v46, v47, v48) --[[ Line: 155 ]] --[[ Name: promptPurchase ]]
            -- upvalues: v41 (copy), v9 (ref)
            v41(v9(v42, v43, v44, v45, v46, v47, v48));
        end
    };
end)(v12);