local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v9 = require(l_CorePackages_0.Packages.React);
local v10 = require(l_CorePackages_0.Packages.RoactGamepad);
local v11 = require(l_CorePackages_0.Packages.UIBlox);
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_PeekView_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekView;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useProperty_0 = require(l_CorePackages_0.Workspace.Packages.GuiObjectUtils).useProperty;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_Focusable_0 = v10.Focusable;
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.SellPage.SellItemInfo);
local v23 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.SellPage.SellItemSetPrice);
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.SellPage.SellItemOverview);
local v25 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v26 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.GetMarketplaceFee);
local v27 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.GetCollectibleMarketplaceResaleParameters);
local v28 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.RemoveAvailableToSellAsset);
local v29 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.UpdateCollectibleInstanceResaleState);
local v30 = require(l_Modules_0.AvatarExperience.Common.Components.CenteredModalView);
local v31 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v32 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v34 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v35 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v36 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v37 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v38 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v39 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v40 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v41 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v42 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v40.FocusNavigationEventNameEnum;
local v44 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagL2ControllerSupport);
local l_FFlagAXMigrateItemOwnershipSellPagesInputBindingsToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateItemOwnershipSellPagesInputBindingsToFocusNavigation;
local l_ButtonStack_0 = v11.App.Button.ButtonStack;
local l_ButtonType_0 = v11.App.Button.Enum.ButtonType;
local l_LoadingStateContainer_0 = v11.App.Container.LoadingStateContainer;
local l_RetrievalStatus_1 = v11.App.Loading.Enum.RetrievalStatus;
local l_useStyle_0 = v11.Core.Style.useStyle;
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v53 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
local function v59(v54, v55) --[[ Line: 90 ]] --[[ Name: useSellItemPeekViewFocusNavigationBindings ]]
    -- upvalues: v41 (copy), v53 (copy), v9 (copy), l_FocusNavigationEventNameEnum_0 (copy), v42 (copy)
    local v56 = v41.useEventMap(v53, v54);
    local v58 = v9.useMemo(function() --[[ Line: 92 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v42 (ref), v55 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v42.onRelease(function(v57) --[[ Line: 95 ]]
                    -- upvalues: v55 (ref)
                    v57.cancelled = true;
                    v55();
                end)
            }
        };
    end, {
        v55
    });
    return v41.useEventHandlerMap(v58, v56);
end;
local function _(v60, v61) --[[ Line: 105 ]] --[[ Name: isConfirmButtonDisabled ]]
    if v60 then
        local v62 = tonumber(v60);
        return not v62 or v62 < (v61 or 0);
    else
        return true;
    end;
end;
local function _(v64, v65, v66, v67) --[[ Line: 119 ]] --[[ Name: getWhitespaceOffsetForPeekView ]]
    local v68 = false;
    if v64 ~= nil then
        v68 = false;
        if v65 ~= nil then
            v68 = v66 ~= nil;
        end;
    end;
    if not v68 then
        return -1;
    else
        local v69 = math.clamp(if v67 ~= nil then v67 else 0.8, 0, 1);
        return v64.Y * v69 - 25 - 20 - v65.Y - 30 - v66.Y - 30 - 30;
    end;
end;
local function _(v71, v72) --[[ Line: 145 ]] --[[ Name: getItemSubTypeName ]]
    -- upvalues: v34 (copy)
    if not v72 then
        return nil;
    elseif v71 == v34.ItemType.Bundle then
        return v34.BundleTypeIdStringToNameForBackend[v72] or v34.BundleTypeIdStringToName[v72];
    elseif v71 == v34.ItemType.Asset then
        return v34.AssetTypeIdStringToName[v72];
    else
        return nil;
    end;
end;
return function(_) --[[ Line: 169 ]] --[[ Name: SellItemPeekView ]]
    -- upvalues: v36 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), v38 (copy), v39 (copy), l_useNavigation_0 (copy), v9 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v10 (copy), l_useProperty_0 (copy), l_useSelector_0 (copy), v32 (copy), l_getUseSelectorDeepEquals_0 (copy), v35 (copy), v34 (copy), l_PerformFetch_0 (copy), v25 (copy), l_RetrievalStatus_0 (copy), v27 (copy), v26 (copy), l_PeekViewState_0 (copy), l_FFlagAXMigrateItemOwnershipSellPagesInputBindingsToFocusNavigation_0 (copy), v59 (copy), v29 (copy), v28 (copy), v22 (copy), v23 (copy), v44 (copy), v24 (copy), l_ButtonType_0 (copy), v30 (copy), l_Focusable_0 (copy), v37 (copy), v31 (copy), l_PeekView_0 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_1 (copy), l_ButtonStack_0 (copy)
    local v75 = v36({
        sellItemText = "Feature.Catalog.Heading.SellItem", 
        sellButtonText = "Feature.Catalog.Action.Sell", 
        cancelButtonText = "Feature.Catalog.Action.Cancel"
    });
    local v76 = l_useStyle_0();
    local l_Theme_0 = v76.Theme;
    local v78 = l_useDispatch_0();
    local v79 = v38(v39);
    local v80 = l_useNavigation_0();
    local l_params_0 = v80.state.params;
    local v82, v83 = v9.useState("");
    local v84 = v9.useRef(nil);
    local v85 = v9.useRef(nil);
    local v86 = v9.useRef(nil);
    local v87 = v9.useRef(nil);
    local v88 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v10.useRootFocusController();
    local v89 = l_useProperty_0(v84, "AbsoluteSize") or nil;
    local v90 = l_useProperty_0(v85, "AbsoluteSize") or nil;
    local v91 = l_useProperty_0(v86, "AbsoluteSize") or nil;
    local l_peekViewFillPercentage_0 = v80.state.params.peekViewFillPercentage;
    local v93 = false;
    if v89 ~= nil then
        v93 = false;
        if v90 ~= nil then
            v93 = v91 ~= nil;
        end;
    end;
    local v94;
    if not v93 then
        v94 = -1;
    else
        local v95 = math.clamp(if l_peekViewFillPercentage_0 ~= nil then l_peekViewFillPercentage_0 else 0.8, 0, 1);
        v94 = v89.Y * v95 - 25 - 20 - v90.Y - 30 - v91.Y - 30 - 30;
    end;
    l_peekViewFillPercentage_0 = v80.state.params.collectibleItemId;
    v93 = l_useSelector_0(function(v96) --[[ Line: 206 ]]
        -- upvalues: v32 (ref), l_params_0 (copy)
        return v32(v96.AvatarExperience.Common, l_params_0.itemId, l_params_0.itemType);
    end, l_getUseSelectorDeepEquals_0());
    local v97 = v35.GetItemSubType(l_params_0.itemType, v93);
    local l_itemType_0 = l_params_0.itemType;
    local v99 = if not v97 then nil else if l_itemType_0 == v34.ItemType.Bundle then v34.BundleTypeIdStringToNameForBackend[v97] or v34.BundleTypeIdStringToName[v97] else if l_itemType_0 == v34.ItemType.Asset then v34.AssetTypeIdStringToName[v97] else nil;
    l_itemType_0 = l_useSelector_0(function(v100) --[[ Line: 212 ]]
        -- upvalues: v80 (copy), v32 (ref)
        local l_itemId_0 = v80.state.params.itemId;
        local l_itemType_1 = v80.state.params.itemType;
        local l_userAssetId_0 = v80.state.params.userAssetId;
        local v104 = v32(v100.AvatarExperience.Common, l_itemId_0, l_itemType_1);
        local v105 = v104 and v104.averagePrice;
        local v106 = v100.AvatarExperience.Catalog.UserAssets[l_userAssetId_0];
        return {
            id = l_itemId_0, 
            averagePrice = v105, 
            serialNumber = if v106 ~= nil then v106.serialNumber else nil
        };
    end, l_getUseSelectorDeepEquals_0());
    local v109 = l_useSelector_0(function(v107) --[[ Line: 229 ]]
        -- upvalues: l_peekViewFillPercentage_0 (copy), l_peekViewFillPercentage_0 (copy)
        if l_peekViewFillPercentage_0 then
            local v108 = v107.AvatarExperience.Common.Collectibles.CollectiblesMarketplaceResaleParameters[l_peekViewFillPercentage_0];
            if v108 ~= nil then
                return {
                    taxRate = v108.resalePercentageFee / 100, 
                    minimumFee = v108.minimumFee
                };
            else
                return {};
            end;
        else
            return v107.AvatarExperience.Catalog.MarketplaceFee;
        end;
    end, l_getUseSelectorDeepEquals_0());
    local v112 = l_useSelector_0(function(v110) --[[ Line: 245 ]]
        -- upvalues: v80 (copy), l_PerformFetch_0 (ref), v25 (ref)
        local l_userAssetId_1 = v80.state.params.userAssetId;
        return l_PerformFetch_0.GetStatus(v110, v25.RemoveAvailableToSellAssetKey .. tostring(l_userAssetId_1));
    end, l_getUseSelectorDeepEquals_0());
    local v114 = l_useSelector_0(function(v113) --[[ Line: 250 ]]
        -- upvalues: l_PerformFetch_0 (ref), v25 (ref)
        return l_PerformFetch_0.GetStatus(v113, v25.GetMarketplaceFeeKey);
    end, l_getUseSelectorDeepEquals_0());
    local v117 = l_useSelector_0(function(v115) --[[ Line: 254 ]]
        -- upvalues: v25 (ref), l_peekViewFillPercentage_0 (copy), l_PerformFetch_0 (ref)
        local v116 = v25.GetCollectibleMarketplaceResaleParametersKey .. tostring(l_peekViewFillPercentage_0);
        return l_PerformFetch_0.GetStatus(v115, v116);
    end, l_getUseSelectorDeepEquals_0());
    local v120 = l_useSelector_0(function(v118) --[[ Line: 259 ]]
        -- upvalues: l_peekViewFillPercentage_0 (copy)
        local v119 = v118.AvatarExperience.Common.Collectibles.CollectiblesMarketplaceResaleParameters[l_peekViewFillPercentage_0];
        return v119 and v119.priceFloor or 0;
    end, l_getUseSelectorDeepEquals_0());
    v9.useEffect(function() --[[ Line: 266 ]]
        -- upvalues: l_peekViewFillPercentage_0 (copy), v117 (copy), l_RetrievalStatus_0 (ref), v78 (copy), v27 (ref), v79 (copy), l_peekViewFillPercentage_0 (copy), v99 (copy), v114 (copy), v26 (ref)
        if l_peekViewFillPercentage_0 and (v117 == l_RetrievalStatus_0.NotStarted or v117 == l_RetrievalStatus_0.Failed) then
            v78(v27(v79, l_peekViewFillPercentage_0, v99));
            return;
        else
            if v114 == l_RetrievalStatus_0.NotStarted or v114 == l_RetrievalStatus_0.Failed then
                v78(v26(v79));
            end;
            return;
        end;
    end, {
        v114, 
        v117, 
        l_peekViewFillPercentage_0, 
        v99
    });
    local v122 = v9.useCallback(function() --[[ Line: 288 ]]
        -- upvalues: v80 (copy)
        v80.goBack();
        local l_onPeekViewClosed_0 = v80.state.params.onPeekViewClosed;
        if l_onPeekViewClosed_0 then
            l_onPeekViewClosed_0();
        end;
    end, {
        v80
    });
    local v125 = v9.useCallback(function(v123, _) --[[ Line: 296 ]]
        -- upvalues: l_PeekViewState_0 (ref), v122 (copy)
        if v123 == l_PeekViewState_0.Closed then
            v122();
        end;
    end, {
        v122
    });
    local v126 = if l_FFlagAXMigrateItemOwnershipSellPagesInputBindingsToFocusNavigation_0 then v59(nil, v122) else nil;
    local v131 = v9.useCallback(function() --[[ Line: 308 ]]
        -- upvalues: v82 (copy), v120 (copy), l_itemType_0 (copy), v80 (copy), l_peekViewFillPercentage_0 (copy), v78 (copy), v29 (ref), v79 (copy), l_peekViewFillPercentage_0 (copy), v28 (ref), v122 (copy)
        local l_v82_0 = v82;
        local l_v120_0 = v120;
        local v129;
        if l_v82_0 then
            local v130 = tonumber(l_v82_0);
            v129 = not v130 or v130 < (l_v120_0 or 0);
        else
            v129 = true;
        end;
        if v129 then
            return;
        else
            v129 = l_itemType_0.id;
            l_v82_0 = v80.state.params.userAssetId;
            l_v120_0 = tonumber(v82);
            if l_peekViewFillPercentage_0 then
                v78(v29(v79, l_peekViewFillPercentage_0, l_v82_0, true, l_v120_0));
            else
                v78(v28(v79, v129, l_v82_0, l_v120_0));
            end;
            v122();
            return;
        end;
    end, {
        v122, 
        v82, 
        l_itemType_0, 
        v80, 
        v79, 
        l_peekViewFillPercentage_0, 
        v120
    });
    local v135 = v9.useCallback(function() --[[ Line: 346 ]]
        -- upvalues: v76 (copy), v9 (ref), v75 (copy), l_Theme_0 (copy), v22 (ref), l_itemType_0 (copy), v23 (ref), v120 (copy), v82 (copy), v83 (copy), v44 (ref), v87 (copy), v86 (copy), v24 (ref), v109 (copy)
        local l_Font_0 = v76.Font;
        local l_Header1_0 = l_Font_0.Header1;
        local v134 = l_Header1_0.RelativeSize * l_Font_0.BaseSize;
        return v9.createElement("Frame", {
            LayoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v9.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 30)
            }), 
            SellItemHeader = v9.createElement("TextLabel", {
                LayoutOrder = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Text = v75.sellItemText, 
                Font = l_Header1_0.Font, 
                Size = UDim2.fromScale(1, 0), 
                TextSize = v134, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                TextWrapped = true, 
                BackgroundTransparency = 1
            }), 
            ItemInfoContent = v9.createElement(v22, {
                layoutOrder = 2, 
                itemIdPriceSerialNumber = l_itemType_0
            }), 
            SetPriceContent = v9.createElement(v23, {
                layoutOrder = 3, 
                priceFloor = v120, 
                priceInRobux = v82, 
                setPriceInRobux = v83, 
                ref = if v44() then v87 else nil, 
                NextSelectionDown = if v44() then v86 else nil
            }), 
            OverviewContent = v9.createElement(v24, {
                layoutOrder = 4, 
                marketplaceFee = v109, 
                priceInRobux = v82
            })
        });
    end, {
        v76, 
        l_Theme_0, 
        v75, 
        l_itemType_0, 
        v82, 
        v83, 
        v109
    });
    local v136 = v9.useCallback(function() --[[ Line: 404 ]]
        -- upvalues: v114 (copy), l_RetrievalStatus_0 (ref), v78 (copy), v26 (ref), v79 (copy)
        if v114 ~= l_RetrievalStatus_0.Fetching then
            v78(v26(v79));
        end;
    end, {
        v114, 
        v79
    });
    local v137 = v9.useCallback(function() --[[ Line: 410 ]]
        -- upvalues: v117 (copy), l_RetrievalStatus_0 (ref), v78 (copy), v27 (ref), v79 (copy), l_peekViewFillPercentage_0 (copy), v99 (copy)
        if v117 ~= l_RetrievalStatus_0.Fetching then
            v78(v27(v79, l_peekViewFillPercentage_0, v99));
        end;
    end, {
        v117, 
        v79, 
        l_peekViewFillPercentage_0, 
        v99
    });
    local v138 = {};
    local v139 = {};
    local v140 = {
        props = {
            onActivated = v122, 
            text = v75.cancelButtonText
        }, 
        isDefaultChild = true
    };
    local v141 = {
        buttonType = l_ButtonType_0.PrimarySystem
    };
    local v142 = {};
    local v143;
    if v82 then
        local v144 = tonumber(v82);
        v143 = not v144 or v144 < (v120 or 0);
    else
        v143 = true;
    end;
    v142.isDisabled = v143;
    v143 = true;
    if v112 ~= l_RetrievalStatus_0.Fetching then
        v143 = true;
        if v114 ~= l_RetrievalStatus_0.Fetching then
            v143 = v117 == l_RetrievalStatus_0.Fetching;
        end;
    end;
    v142.isLoading = v143;
    v142.onActivated = v131;
    v142.text = v75.sellButtonText;
    v141.props = v142;
    v141.isDefaultChild = false;
    v6(v139, 1, v140, v141);
    v138.buttons = v139;
    v139 = v9.createElement;
    v140 = v30;
    v141 = {
        backgroundTransparency = 1
    };
    v142 = {};
    v143 = v9.createElement;
    local v145 = if v44() then l_Focusable_0.Frame else "Frame";
    local v146 = {
        LayoutOrder = 1, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if v44() then v88 else nil, 
        defaultChild = if v44() then v87 else nil, 
        inputBindings = if not l_FFlagAXMigrateItemOwnershipSellPagesInputBindingsToFocusNavigation_0 and v44() then {
            NavigateBack = v10.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 465 ]]
                -- upvalues: v37 (ref), v80 (copy)
                v37.closeFocusedScreen(v80);
            end)
        } else nil, 
        ref = v84
    };
    local v147 = {
        GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v44() and v9.createElement(v31, {
            focusController = v88, 
            captureFocusOnMount = true
        })
    };
    local l_createElement_0 = v9.createElement;
    local l_l_PeekView_0_0 = l_PeekView_0;
    local v150 = {
        mountAsFullView = true, 
        isScrollingEnabled = false, 
        showDraggerInClosedState = false, 
        peekHeaderClose = true, 
        viewStateChanged = v125, 
        canDragFullViewToBrief = false, 
        thumbstickScrollEnabled = false, 
        backgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        backgroundTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
        shouldCaptureFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 and nil
    };
    local v151 = {};
    local l_createElement_1 = v9.createElement;
    local v153 = "Frame";
    local v154 = {
        LayoutOrder = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1, 
        ref = if l_FFlagAXMigrateItemOwnershipSellPagesInputBindingsToFocusNavigation_0 then v126 else nil
    };
    local v155 = {
        UIListLayout = v9.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 30)
        }), 
        UIPadding = v9.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 20), 
            PaddingRight = UDim.new(0, 20), 
            PaddingTop = UDim.new(0, 20), 
            PaddingBottom = UDim.new(0, 30)
        }), 
        ItemInfoContentFrame = v9.createElement("Frame", {
            LayoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1, 
            ref = v85
        }, {
            Content = v9.createElement(l_LoadingStateContainer_0, {
                dataStatus = if l_peekViewFillPercentage_0 then l_RetrievalStatus_1.fromRawValue(v117) else l_RetrievalStatus_1.fromRawValue(v114), 
                onRetry = if l_peekViewFillPercentage_0 then v137 else v136, 
                renderOnLoaded = v135
            })
        })
    };
    local v156 = false;
    if v94 >= 0 then
        v156 = v9.createElement("Frame", {
            LayoutOrder = 2, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, v94), 
            BackgroundTransparency = 1
        });
    end;
    v155.WhiteSpaceFrame = v156;
    v155.Footer = v9.createElement(l_Focusable_0.Frame, {
        LayoutOrder = 3, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1, 
        ref = v86, 
        NextSelectionUp = if v44() then v87 else nil
    }, {
        Buttons = v138 and v9.createElement(l_ButtonStack_0, v138)
    });
    v151.ContentContainer = l_createElement_1(v153, v154, v155);
    v147.PeekView = l_createElement_0(l_l_PeekView_0_0, v150, v151);
    v142.FullSizeFrame = v143(v145, v146, v147);
    return v139(v140, v141, v142);
end;