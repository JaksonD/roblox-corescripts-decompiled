local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_StyledTextLabel_0 = require(l_Parent_0.UIBlox).App.Text.StyledTextLabel;
local v6 = require(l_Parent_0.ReactFocusNavigation);
local v7 = require(l_script_FirstAncestor_0.Components.FullPagePrompt);
local v8 = require(l_script_FirstAncestor_0.Components.ItemList);
local v9 = require(l_script_FirstAncestor_0.Components.PriceBox);
local v10 = require(l_script_FirstAncestor_0.Components.Price);
local v11 = require(l_script_FirstAncestor_0.Components.LineItemLayout);
local v12 = require(l_script_FirstAncestor_0.Components.FullPagePromptTwoPanelLayout);
local v13 = require(l_script_FirstAncestor_0.Components.Divider);
local v14 = require(l_script_FirstAncestor_0.Components.FullPagePromptScrollList);
local v15 = require(l_script_FirstAncestor_0.Components.ItemStatus);
local v16 = require(l_script_FirstAncestor_0.Flags.FFlagFixVP8143);
local v17 = {
    heading = "CoreScripts.BulkPurchasePrompt.RequestPrompt.Heading", 
    listHeading = "CoreScripts.BulkPurchasePrompt.RequestPrompt.ItemListPurchaseHeading", 
    itemCount = "CoreScripts.BulkPurchasePrompt.RequestPrompt.ItemListPurchaseCount", 
    itemOwned = "CoreScripts.BulkPurchasePrompt.RequestPrompt.ItemOwned"
};
local function v24(v18, v19, v20) --[[ Line: 28 ]] --[[ Name: mapItemsToPresentation ]]
    -- upvalues: v2 (copy), v10 (copy)
    local v21 = {};
    for _, v23 in v18 do
        table.insert(v21, {
            id = v23.id, 
            name = v23.name, 
            image = v23.image, 
            endSlot = v2.createElement(v10, {
                amount = v23.cost, 
                fontStyle = v19, 
                colorStyle = v20
            })
        });
    end;
    return v21;
end;
local function v32(v25, v26, v27, v28) --[[ Line: 44 ]] --[[ Name: mapOwnedItemsToPresentation ]]
    -- upvalues: v2 (copy), l_StyledTextLabel_0 (copy)
    local v29 = {};
    for _, v31 in v25 do
        table.insert(v29, {
            id = v31.id, 
            name = v31.name, 
            image = v31.image, 
            endSlot = v2.createElement(l_StyledTextLabel_0, {
                fontStyle = v26, 
                colorStyle = v27, 
                textXAlignment = Enum.TextXAlignment.Right, 
                textYAlignment = Enum.TextYAlignment.Top, 
                lineHeight = v26.LineHeight, 
                size = UDim2.fromScale(1, 1), 
                text = v28.itemOwned:gsub("{.*}", (tostring(v31.ownedCount)))
            })
        });
    end;
    return v29;
end;
local function v37(v33) --[[ Line: 65 ]] --[[ Name: mapUnpurchasableItemsToPresentation ]]
    -- upvalues: v2 (copy), v15 (copy)
    local v34 = {};
    for _, v36 in v33 do
        table.insert(v34, {
            id = v36.id, 
            name = v36.name, 
            image = v36.image, 
            endSlot = v2.createElement(v15, {
                status = v36.status
            })
        });
    end;
    return v34;
end;
return function(v38) --[[ Line: 113 ]] --[[ Name: BulkPurchaseRequest ]]
    -- upvalues: l_useLocalization_0 (copy), v17 (copy), v6 (copy), v16 (copy), v2 (copy), l_useDesignTokens_0 (copy), v24 (copy), v32 (copy), v37 (copy), v7 (copy), v12 (copy), v11 (copy), l_StyledTextLabel_0 (copy), v14 (copy), v8 (copy), v13 (copy), v9 (copy)
    local v39 = l_useLocalization_0(v17);
    local v40, v41 = v6.useDefaultFocusBehavior();
    local v43 = if v16 then v2.useCallback(function(v42) --[[ Line: 117 ]]
        -- upvalues: v38 (copy), v40 (copy)
        if typeof(v38.purchaseButtonRef) == "table" then
            v38.purchaseButtonRef.current = v42;
        end;
        if typeof(v40) == "function" then
            v40(v42);
            return;
        else
            if typeof(v40) == "table" then
                v40.current = v42;
            end;
            return;
        end;
    end, {
        v38.purchaseButtonRef
    }) else nil;
    local v44 = l_useDesignTokens_0();
    local l_Body_0 = v44.Semantic.Typography.Body;
    local v46 = {
        LineHeight = v44.Semantic.Typography.Body.LineHeight, 
        Font = v44.Semantic.Typography.Subheader.Font, 
        FontSize = v44.Semantic.Typography.Body.FontSize, 
        LetterSpacing = v44.Semantic.Typography.Body.LetterSpacing
    };
    local l_Emphasis_0 = v44.Semantic.Color.Text.Emphasis;
    local v48, v49 = v2.useBinding(Vector2.new(0, 0));
    local v50 = v24(v38.items, v46, l_Emphasis_0);
    local v51 = v32(v38.ownedItems, l_Body_0, l_Emphasis_0, v39);
    local v52 = v37(v38.unpurchasableItems);
    local v53 = {};
    table.move(v51, 1, #v51, #v53 + 1, v53);
    table.move(v52, 1, #v52, #v53 + 1, v53);
    local v54 = #v53 > 0;
    return v2.createElement(v7, {
        onClose = v38.onClose, 
        title = v39.heading, 
        ref = v41
    }, v2.createElement(v12, {
        size = v2.createBinding(UDim2.fromScale(1, 1)), 
        startSlot = v2.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1)
        }, v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, v44.Global.Space_300)
        }), v2.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 1, 
            [v2.Change.AbsoluteSize] = function(v55) --[[ Line: 175 ]]
                -- upvalues: v49 (copy)
                v49(v55.AbsoluteSize);
            end
        }, v2.createElement("UIPadding", {
            PaddingRight = UDim.new(0, v44.Global.Space_125)
        }), v2.createElement(v11, {
            startSlot = v2.createElement(l_StyledTextLabel_0, {
                fontStyle = v46, 
                colorStyle = l_Emphasis_0, 
                text = v39.listHeading
            }), 
            endSlot = v2.createElement(l_StyledTextLabel_0, {
                fontStyle = v46, 
                colorStyle = l_Emphasis_0, 
                text = v39.itemCount:gsub("{.*}", (tostring(#v38.items)))
            }), 
            LayoutOrder = 1
        })), v2.createElement(v14, {
            LayoutOrder = 2, 
            size = v48:map(function(v56) --[[ Line: 197 ]]
                -- upvalues: v44 (copy)
                return UDim2.new(1, 0, 1, -(v56.Y + v44.Global.Space_300));
            end)
        }, v2.createElement(v8, {
            items = v50
        }), if v54 then v2.createElement(v13) else nil, if v54 then v2.createElement(v8, {
            items = v53
        }) else nil)), 
        endSlot = v2.createElement(v9, {
            currentBalance = v38.currentBalance, 
            totalCost = v38.totalCost, 
            missingRobux = v38.currentBalance - v38.totalCost < 0, 
            onAccept = v38.onAccept, 
            buttonRef = if v16 then v43 else v40, 
            isDisabled = v38.isDisabled
        })
    }));
end;