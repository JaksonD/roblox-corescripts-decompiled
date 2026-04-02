local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v5 = require(l_Parent_0.UIBlox);
local l_StyledTextLabel_0 = v5.App.Text.StyledTextLabel;
local l_Button_0 = v5.App.Button.Button;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local v9 = require(l_script_FirstAncestor_0.Components.FullPagePrompt);
local v10 = require(l_script_FirstAncestor_0.Components.ItemList_DEPRECATED);
local v11 = require(l_script_FirstAncestor_0.Components.FullPagePromptTwoPanelLayout);
local v12 = require(l_script_FirstAncestor_0.Components.Divider);
local v13 = require(l_script_FirstAncestor_0.Components.ItemListHeader);
local v14 = require(l_script_FirstAncestor_0.Components.FullPagePromptScrollList);
local v15 = require(l_script_FirstAncestor_0.Components.Box);
local v16 = require(l_script_FirstAncestor_0.Components.PriceBoxLine);
local v17 = require(l_script_FirstAncestor_0.Components.ItemStatus);
local _ = require(l_Parent_0.Style);
local l_ItemCardThumbnail_0 = require(l_Parent_0.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail;
local v20 = require(l_script_FirstAncestor_0.Components.ItemList);
local _ = require(l_Parent_0.AvatarExperienceCommon);
local v22 = require(l_script_FirstAncestor_0.Enums.ItemStatusToItemStatusKey);
local v23 = require(l_script_FirstAncestor_0.Enums.ItemStatusKeyToLocalizationKey);
local v24 = require(l_script_FirstAncestor_0.Flags.FFlagBulkPurchaseUsesCatalogRowItemCard);
local function _(v25, v26) --[[ Line: 34 ]] --[[ Name: toCardPropsWithId ]]
    local v27 = table.clone(v25);
    v27.id = v26;
    return v27;
end;
local v29 = {
    heading = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.Heading", 
    unsuccessfulHeading = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorHeading", 
    notice = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.Notice", 
    itemListSuccessfulCount = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.ItemListSuccessfulCount", 
    itemListUnsuccessfulCount = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.ItemListUnsuccessfulCount", 
    itemListSuccessfulHeading = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.ItemListSuccessfulHeading", 
    itemListUnsuccessfulHeading = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.ItemListUnsuccessfulHeading", 
    robuxSpent = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.PriceBox.RobuxSpent", 
    currentBalance = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.PriceBox.CurrentBalance", 
    dismissCTA = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.PriceBox.DismissCTA"
};
local function v31(v30) --[[ Line: 60 ]] --[[ Name: mapTokens ]]
    return {
        boxBackground = v30.Semantic.Color.Background.Contrast.Color3, 
        boxPadding = v30.Global.Space_300, 
        boxCornerRadius = v30.Semantic.Radius.Medium, 
        buttonMarginTop = v30.Global.Space_200, 
        buttonHeight = v30.Global.Size_450, 
        lineItemSpacing = v30.Global.Space_50, 
        noticeFontStyle = v30.Semantic.Typography.Body, 
        noticeColorStyle = v30.Semantic.Color.Text.Muted, 
        noticeMarginBottom = v30.Global.Space_300, 
        successColor = v30.Semantic.Color.Common.Success, 
        failureColor = v30.Semantic.Color.Common.Alert
    };
end;
local function v36(v32) --[[ Line: 76 ]] --[[ Name: mapBulkPurchasePartialSuccessItemsToPresentation ]]
    -- upvalues: v2 (copy), v17 (copy)
    local v33 = {};
    for _, v35 in v32 do
        table.insert(v33, {
            id = v35.id, 
            image = v35.image, 
            name = v35.name, 
            endSlot = v2.createElement(v17, {
                status = v35.status
            })
        });
    end;
    return v33;
end;
local function v50(v37, v38, v39, v40) --[[ Line: 89 ]] --[[ Name: mapBulkPurchasePartialSuccessItemsToRowPresentation ]]
    -- upvalues: v22 (copy), v2 (copy), l_ItemCardThumbnail_0 (copy)
    local v41 = {};
    for _, v43 in v37 do
        local v44 = v38[v22[v43.status]];
        local v45 = if v43.status == Enum.MarketplaceItemPurchaseStatus.Success then v39 else v40;
        local v46 = {
            type = "text", 
            text = v44, 
            colorStyle = v45
        };
        local v47 = {
            presentationSlot = v2.createElement(l_ItemCardThumbnail_0, {
                url = v43.image
            }), 
            title = v43.name, 
            priceLineContent = {
                v46
            }
        };
        local l_id_0 = v43.id;
        local v49 = table.clone(v47);
        v49.id = l_id_0;
        table.insert(v41, v49);
    end;
    return v41;
end;
return function(v51) --[[ Line: 126 ]] --[[ Name: BulkPurchasePartialSuccess ]]
    -- upvalues: l_useDesignTokens_0 (copy), v31 (copy), l_useLocalization_0 (copy), v29 (copy), v24 (copy), v23 (copy), v2 (copy), v9 (copy), l_StyledTextLabel_0 (copy), v11 (copy), v14 (copy), v13 (copy), v20 (copy), v50 (copy), v10 (copy), v36 (copy), v12 (copy), v15 (copy), v16 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local v52 = l_useDesignTokens_0(v31);
    local v53 = l_useLocalization_0(v29);
    local v54 = {};
    if v24 then
        v54 = l_useLocalization_0(v23);
    end;
    local v55, v56 = v2.useBinding(Vector2.new(0, 0));
    local v57 = #v51.successfulItems > 0;
    return v2.createElement(v9, {
        onClose = v51.onDismiss, 
        title = if v57 then v53.heading else v53.unsuccessfulHeading
    }, v2.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Padding = UDim.new(0, v52.noticeMarginBottom)
    }), v2.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        [v2.Change.AbsoluteSize] = function(v58) --[[ Line: 155 ]]
            -- upvalues: v56 (copy)
            v56(v58.AbsoluteSize);
        end
    }, v2.createElement(l_StyledTextLabel_0, {
        fontStyle = v52.noticeFontStyle, 
        colorStyle = v52.noticeColorStyle, 
        text = v53.notice, 
        layoutOrder = 1, 
        automaticSize = Enum.AutomaticSize.XY
    })), v2.createElement(v11, {
        LayoutOrder = 2, 
        size = v55:map(function(v59) --[[ Line: 169 ]]
            -- upvalues: v52 (copy)
            return UDim2.new(1, 0, 1, -(v59.Y + v52.noticeMarginBottom));
        end), 
        startSlot = v2.createElement(v14, {
            LayoutOrder = 1, 
            size = v2.createBinding(UDim2.fromScale(1, 1))
        }, v2.createElement(v13, {
            heading = v53.itemListUnsuccessfulHeading, 
            itemCount = v53.itemListUnsuccessfulCount:gsub("{.*}", (tostring(#v51.unsuccessfulItems))), 
            LayoutOrder = 1
        }), if v24 then v2.createElement(v20, {
            items = v50(v51.unsuccessfulItems, v54, v52.successColor, v52.failureColor), 
            LayoutOrder = 2
        }) else v2.createElement(v10, {
            items = v36(v51.unsuccessfulItems), 
            LayoutOrder = 2
        }), if v57 then v2.createElement(v12, {
            LayoutOrder = 3
        }) else nil, if v57 then v2.createElement(v13, {
            heading = v53.itemListSuccessfulHeading, 
            itemCount = v53.itemListSuccessfulCount:gsub("{.*}", (tostring(#v51.successfulItems))), 
            LayoutOrder = 4
        }) else nil, if v57 then if v24 then v2.createElement(v20, {
            items = v50(v51.successfulItems, v54, v52.successColor, v52.failureColor), 
            LayoutOrder = 5
        }) else v2.createElement(v10, {
            items = v36(v51.successfulItems), 
            LayoutOrder = 5
        }) else nil), 
        endSlot = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v52.buttonMarginTop)
        }), v2.createElement(v15, {
            padding = v52.boxPadding, 
            cornerRadius = UDim.new(0, v52.boxCornerRadius), 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundColor3 = v52.boxBackground, 
            BorderSizePixel = 0
        }, {
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, v52.lineItemSpacing)
            }), 
            RobuxSpent = v2.createElement(v16, {
                text = v53.robuxSpent, 
                amount = v51.robuxSpent, 
                highlight = true, 
                LayoutOrder = 1
            }), 
            CurrentBalance = v2.createElement(v16, {
                text = v53.currentBalance, 
                amount = v51.currentBalance, 
                LayoutOrder = 2
            })
        }), v2.createElement(l_Button_0, {
            text = v53.dismissCTA, 
            onActivated = v51.onDismiss, 
            buttonType = l_ButtonType_0.PrimarySystem, 
            size = UDim2.new(1, 0, 0, v52.buttonHeight)
        }))
    }));
end;