local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_StyledTextLabel_0 = require(l_Parent_0.UIBlox).App.Text.StyledTextLabel;
local v6 = require(l_Parent_0.ReactFocusNavigation);
local v7 = require(l_script_FirstAncestor_0.Components.FullPagePrompt);
local v8 = require(l_script_FirstAncestor_0.Components.ItemList_DEPRECATED);
local v9 = require(l_script_FirstAncestor_0.Components.PriceBox);
local v10 = require(l_script_FirstAncestor_0.Components.LineItemLayout);
local v11 = require(l_script_FirstAncestor_0.Components.FullPagePromptTwoPanelLayout);
local v12 = require(l_script_FirstAncestor_0.Components.Divider);
local v13 = require(l_script_FirstAncestor_0.Components.FullPagePromptScrollList);
local v14 = require(l_script_FirstAncestor_0.Flags.FFlagFixVP8143);
local v15 = require(l_script_FirstAncestor_0.Components.ItemList);
local _ = require(l_Parent_0.AvatarExperienceCommon);
local v17 = require(l_script_FirstAncestor_0.Enums.ItemStatusKeyToLocalizationKey);
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagBulkPurchaseUsesCatalogRowItemCard);
local _ = require(script.Parent.BulkPurchaseRequestItem);
local _ = require(script.Parent.BulkPurchaseRequestOwnedItem);
local _ = require(script.Parent.BulkPurchaseRequestUnpurchasableItem);
local v22 = require(script.Parent.ItemPresentationMapper_DEPRECATED);
local l_mapItemsToPresentation_DEPRECATED_0 = v22.mapItemsToPresentation_DEPRECATED;
local l_mapOwnedItemsToPresentation_DEPRECATED_0 = v22.mapOwnedItemsToPresentation_DEPRECATED;
local l_mapUnpurchasableItemsToPresentation_DEPRECATED_0 = v22.mapUnpurchasableItemsToPresentation_DEPRECATED;
local v26 = require(script.Parent.ItemPresentationMapper);
local l_mapItemsToRowPresentation_0 = v26.mapItemsToRowPresentation;
local l_mapOwnedItemsToRowPresentation_0 = v26.mapOwnedItemsToRowPresentation;
local l_mapUnpurchasableItemsToRowPresentation_0 = v26.mapUnpurchasableItemsToRowPresentation;
local v30 = {
    heading = "CoreScripts.BulkPurchasePrompt.RequestPrompt.Heading", 
    listHeading = "CoreScripts.BulkPurchasePrompt.RequestPrompt.ItemListPurchaseHeading", 
    itemCount = "CoreScripts.BulkPurchasePrompt.RequestPrompt.ItemListPurchaseCount", 
    itemOwned = "CoreScripts.BulkPurchasePrompt.RequestPrompt.ItemOwned"
};
return function(v31) --[[ Line: 65 ]] --[[ Name: BulkPurchaseRequest ]]
    -- upvalues: l_useLocalization_0 (copy), v30 (copy), v6 (copy), v14 (copy), v2 (copy), l_useDesignTokens_0 (copy), v18 (copy), v17 (copy), l_mapItemsToRowPresentation_0 (copy), l_mapOwnedItemsToRowPresentation_0 (copy), l_mapUnpurchasableItemsToRowPresentation_0 (copy), l_mapItemsToPresentation_DEPRECATED_0 (copy), l_mapOwnedItemsToPresentation_DEPRECATED_0 (copy), l_mapUnpurchasableItemsToPresentation_DEPRECATED_0 (copy), v7 (copy), v11 (copy), v10 (copy), l_StyledTextLabel_0 (copy), v13 (copy), v15 (copy), v8 (copy), v12 (copy), v9 (copy)
    local v32 = l_useLocalization_0(v30);
    local v33, v34 = v6.useDefaultFocusBehavior();
    local v36 = if v14 then v2.useCallback(function(v35) --[[ Line: 69 ]]
        -- upvalues: v31 (copy), v33 (copy)
        if typeof(v31.purchaseButtonRef) == "table" then
            v31.purchaseButtonRef.current = v35;
        end;
        if typeof(v33) == "function" then
            v33(v35);
            return;
        else
            if typeof(v33) == "table" then
                v33.current = v35;
            end;
            return;
        end;
    end, {
        v31.purchaseButtonRef
    }) else nil;
    local v37 = l_useDesignTokens_0();
    local l_Body_0 = v37.Semantic.Typography.Body;
    local v39 = {
        LineHeight = v37.Semantic.Typography.Body.LineHeight, 
        Font = v37.Semantic.Typography.Subheader.Font, 
        FontSize = v37.Semantic.Typography.Body.FontSize, 
        LetterSpacing = v37.Semantic.Typography.Body.LetterSpacing
    };
    local l_Emphasis_0 = v37.Semantic.Color.Text.Emphasis;
    local v41, v42 = v2.useBinding(Vector2.new(0, 0));
    local v43 = {};
    local v44 = {};
    local v45 = {};
    local v46 = {};
    local v47 = false;
    if v18 then
        local v48 = l_useLocalization_0(v17);
        local l_Success_0 = v37.Semantic.Color.Common.Success;
        local l_Alert_0 = v37.Semantic.Color.Common.Alert;
        v43 = l_mapItemsToRowPresentation_0(v31.items);
        local v51 = l_mapOwnedItemsToRowPresentation_0(v31.ownedItems, l_Emphasis_0, v32);
        local v52 = l_mapUnpurchasableItemsToRowPresentation_0(v31.unpurchasableItems, v48, l_Success_0, l_Alert_0);
        table.move(v51, 1, #v51, #v44 + 1, v44);
        table.move(v52, 1, #v52, #v44 + 1, v44);
        v47 = #v44 > 0;
    else
        v45 = l_mapItemsToPresentation_DEPRECATED_0(v31.items, v39, l_Emphasis_0);
        local v53 = l_mapOwnedItemsToPresentation_DEPRECATED_0(v31.ownedItems, l_Body_0, l_Emphasis_0, v32);
        local v54 = l_mapUnpurchasableItemsToPresentation_DEPRECATED_0(v31.unpurchasableItems);
        table.move(v53, 1, #v53, #v46 + 1, v46);
        table.move(v54, 1, #v54, #v46 + 1, v46);
        v47 = #v46 > 0;
    end;
    return v2.createElement(v7, {
        onClose = v31.onClose, 
        title = v32.heading, 
        ref = v34
    }, v2.createElement(v11, {
        size = v2.createBinding(UDim2.fromScale(1, 1)), 
        startSlot = v2.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1)
        }, v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, v37.Global.Space_300)
        }), v2.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 1, 
            [v2.Change.AbsoluteSize] = function(v55) --[[ Line: 157 ]]
                -- upvalues: v42 (copy)
                v42(v55.AbsoluteSize);
            end
        }, v2.createElement("UIPadding", {
            PaddingRight = UDim.new(0, v37.Global.Space_125)
        }), v2.createElement(v10, {
            startSlot = v2.createElement(l_StyledTextLabel_0, {
                fontStyle = v39, 
                colorStyle = l_Emphasis_0, 
                text = v32.listHeading
            }), 
            endSlot = v2.createElement(l_StyledTextLabel_0, {
                fontStyle = v39, 
                colorStyle = l_Emphasis_0, 
                text = v32.itemCount:gsub("{.*}", (tostring(#v31.items)))
            }), 
            LayoutOrder = 1
        })), v2.createElement(v13, {
            LayoutOrder = 2, 
            size = v41:map(function(v56) --[[ Line: 179 ]]
                -- upvalues: v37 (copy)
                return UDim2.new(1, 0, 1, -(v56.Y + v37.Global.Space_300));
            end)
        }, if v18 then v2.createElement(v15, {
            items = v43
        }) else v2.createElement(v8, {
            items = v45
        }), if v47 then v2.createElement(v12) else nil, if v47 then if v18 then v2.createElement(v15, {
            items = v44
        }) else v2.createElement(v8, {
            items = v46
        }) else nil)), 
        endSlot = v2.createElement(v9, {
            currentBalance = v31.currentBalance, 
            totalCost = v31.totalCost, 
            missingRobux = v31.currentBalance - v31.totalCost < 0, 
            onAccept = v31.onAccept, 
            buttonRef = if v14 then v36 else v33, 
            isDisabled = v31.isDisabled
        })
    }));
end;