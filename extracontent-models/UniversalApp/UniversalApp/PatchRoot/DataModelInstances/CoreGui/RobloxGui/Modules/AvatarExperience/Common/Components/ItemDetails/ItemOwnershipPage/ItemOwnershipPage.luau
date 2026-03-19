local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useProperty_0 = require(l_CorePackages_0.Workspace.Packages.GuiObjectUtils).useProperty;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_wasLastInputGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).wasLastInputGamepad;
local v8 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v8.Focusable;
local v10 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local l_useMostRecentFocusBehavior_0 = require(l_CorePackages_0.Packages.ReactFocusNavigation).useMostRecentFocusBehavior;
local v12 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_useTableWrappedCallbackRef_0 = v12.Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local l_getUseSelectorDeepEquals_0 = v12.Utils.getUseSelectorDeepEquals;
local l_useRedirectFocusIntoGuiObject_0 = v12.Hooks.useRedirectFocusIntoGuiObject;
local v16 = require(l_CorePackages_0.Packages.UIBlox);
local l_IconButton_0 = v16.App.Button.IconButton;
local l_IconSize_0 = v16.App.ImageSet.Enum.IconSize;
local l_Images_0 = v16.App.ImageSet.Images;
local l_VerticalScrollViewWithMargin_0 = v16.App.Container.VerticalScrollViewWithMargin;
local l_useStyle_0 = v16.Core.Style.useStyle;
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.CenteredModalView);
local v23 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v25 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v26 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v27 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemOwnershipPage.OwnedItemList);
local v28 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchSellPageData);
local v29 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibleResellableInstances);
local v30 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v31 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v32 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v33 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local _ = require(l_Modules_0.AvatarExperience.Common.Models.CollectibleInstance);
local v36 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v37 = require(l_Modules_0.Common.Text);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v39 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_useFocusNavigableSurfaceRegistryConnection_0 = v39.useFocusNavigableSurfaceRegistryConnection;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v39.FocusNavigableSurfaceIdentifierEnum;
local v42 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v43 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagL2ControllerSupport);
local l_FFlagAXMigrateItemOwnershipSellPagesInputBindingsToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateItemOwnershipSellPagesInputBindingsToFocusNavigation;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v46 = l_FFlagAXMigrateAXToGlobalAutofocus_0 and game:DefineFastFlag("AXMigrateItemOwnerShipPageToAutofocus", false);
local v47 = l_Images_0["icons/actions/info_small"];
return function(v48) --[[ Line: 79 ]] --[[ Name: ItemOwnershipPage ]]
    -- upvalues: l_useStyle_0 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), v33 (copy), v42 (copy), v2 (copy), v10 (copy), v25 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v8 (copy), v31 (copy), v32 (copy), l_useDispatch_0 (copy), v29 (copy), v28 (copy), l_AvatarScreen_0 (copy), l_wasLastInputGamepad_0 (copy), v36 (copy), v43 (copy), l_useNavigation_0 (copy), v30 (copy), v37 (copy), l_useProperty_0 (copy), v46 (copy), l_useFocusNavigableSurfaceRegistryConnection_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_useRedirectFocusIntoGuiObject_0 (copy), l_useMostRecentFocusBehavior_0 (copy), l_useTableWrappedCallbackRef_0 (copy), v22 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateItemOwnershipSellPagesInputBindingsToFocusNavigation_0 (copy), v24 (copy), v23 (copy), v26 (copy), l_VerticalScrollViewWithMargin_0 (copy), v27 (copy), l_IconButton_0 (copy), v47 (copy), l_IconSize_0 (copy)
    local l_params_0 = v48.navigation.state.params;
    local v50 = l_useStyle_0();
    local v52 = l_useSelector_0(function(v51) --[[ Line: 83 ]]
        return v51.LocalUserId;
    end);
    local v54 = l_useSelector_0(function(v53) --[[ Line: 87 ]]
        return v53.AvatarExperience.Catalog.UserAssets;
    end);
    local v56 = l_useSelector_0(function(v55) --[[ Line: 91 ]]
        -- upvalues: l_params_0 (copy)
        return v55.AvatarExperience.Catalog.Sell.AvailableToSellAssets[l_params_0.itemId];
    end, l_getUseSelectorDeepEquals_0());
    local v58 = l_useSelector_0(function(v57) --[[ Line: 95 ]]
        -- upvalues: l_params_0 (copy)
        return v57.AvatarExperience.Catalog.Sell.CurrentlySellingAssets[l_params_0.itemId];
    end, l_getUseSelectorDeepEquals_0());
    local v60 = l_useSelector_0(function(v59) --[[ Line: 99 ]]
        -- upvalues: v33 (ref), l_params_0 (copy)
        return v33(v59.AvatarExperience.Common, l_params_0.itemId, l_params_0.itemType);
    end, l_getUseSelectorDeepEquals_0());
    local l_collectibleItemId_0 = l_params_0.collectibleItemId;
    local v62 = v42.IsResellable(v60);
    local v64 = l_useSelector_0(function(v63) --[[ Line: 107 ]]
        -- upvalues: v62 (copy), l_params_0 (copy)
        if not v62 then
            return {};
        elseif l_params_0.collectibleItemId then
            return v63.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[l_params_0.collectibleItemId];
        else
            return {};
        end;
    end, l_getUseSelectorDeepEquals_0());
    local v66 = v2.useCallback(function(v65) --[[ Line: 119 ]]
        -- upvalues: l_collectibleItemId_0 (copy)
        if l_collectibleItemId_0 then
            return v65.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[l_collectibleItemId_0];
        else
            return nil;
        end;
    end, {
        l_collectibleItemId_0
    });
    local v67 = l_useSelector_0(v66, l_getUseSelectorDeepEquals_0());
    if v10(function(v68) --[[ Line: 126 ]]
        return v68.getDisableResellingCollectiblesForCompliance();
    end) and v67 then
        v67.resaleRestriction = v25.ResaleRestriction.Disabled;
    end;
    local v73 = l_useSelector_0(function(v69) --[[ Line: 133 ]]
        local v70 = v69.Users[v69.LocalUserId];
        local v71 = if v70 then v70.membership else nil;
        local v72 = false;
        if v71 ~= nil then
            v72 = v71 ~= Enum.MembershipType.None;
        end;
        return v72;
    end, l_getUseSelectorDeepEquals_0());
    local v74 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v8.useRootFocusController();
    local v75 = v31(v32);
    local v76 = l_useDispatch_0();
    v2.useEffect(function() --[[ Line: 142 ]]
        -- upvalues: l_params_0 (copy), v76 (copy), v29 (ref), v75 (copy), v52 (copy), v28 (ref)
        if l_params_0.collectibleItemId then
            v76(v29(v75, l_params_0.collectibleItemId, v52));
            return;
        else
            v76(v28(v75, l_params_0.itemId, v52));
            return;
        end;
    end, {});
    local l_SellItemPeekView_0 = l_AvatarScreen_0.SellItemPeekView;
    local v79 = v2.useCallback(function(v78) --[[ Line: 153 ]]
        -- upvalues: v73 (copy), v48 (copy), l_AvatarScreen_0 (ref), l_SellItemPeekView_0 (copy), l_params_0 (copy), l_collectibleItemId_0 (copy)
        if not v73 then
            v48.navigation.navigate(l_AvatarScreen_0.PremiumSellOnlyPrompt);
            return;
        else
            v48.navigation.navigate(l_SellItemPeekView_0, {
                itemId = l_params_0.itemId, 
                itemType = l_params_0.itemType, 
                collectibleItemId = l_collectibleItemId_0, 
                userAssetId = v78
            });
            return;
        end;
    end, {
        l_params_0.itemId, 
        l_params_0.itemType, 
        l_params_0.collectibleItemId, 
        l_collectibleItemId_0
    });
    local v81 = v2.useCallback(function() --[[ Line: 174 ]]
        -- upvalues: l_wasLastInputGamepad_0 (ref), v36 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v74 (copy)
        local v80 = l_wasLastInputGamepad_0();
        v36("ItemOwnershipPage", v80);
        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v80 then
            v74.captureFocus();
        end;
    end);
    local v83 = v2.useCallback(function(v82) --[[ Line: 184 ]]
        -- upvalues: v48 (copy), l_AvatarScreen_0 (ref), l_params_0 (copy), v43 (ref), v81 (copy)
        v48.navigation.navigate(l_AvatarScreen_0.RemoveCurrentlySellingItemPrompt, {
            itemId = l_params_0.itemId, 
            collectibleItemId = l_params_0.collectibleItemId, 
            userAssetId = v82, 
            onOverlayClosed = if v43() then v81 else nil
        });
    end, {
        v48.navigation, 
        l_params_0.itemId, 
        l_params_0.collectibleItemId, 
        v81
    });
    local v86 = v2.useCallback(function(v84, v85) --[[ Line: 200 ]]
        -- upvalues: v83 (copy), v79 (copy)
        if v85 then
            v83(v84);
            return;
        else
            v79(v84);
            return;
        end;
    end);
    local v87 = if v60 then v60.name else nil;
    local v97 = v2.useCallback(function(v88, v89, v90) --[[ Line: 211 ]]
        -- upvalues: v54 (copy), v87 (copy)
        if v89 == nil then
            return;
        else
            for _, v92 in v89 do
                local v93 = v54[v92];
                if v93 then
                    local v94 = if v93.serialNumber then "#" .. v93.serialNumber else v87;
                    local v95 = if v90 then v93.priceInRobux else nil;
                    local v96 = if v90 then nil else v93.isOnHold;
                    table.insert(v88, {
                        id = v92, 
                        title = v94, 
                        salePrice = v95, 
                        isOnHold = v96, 
                        isOnSale = v90, 
                        order = if v93.serialNumber then v93.serialNumber else v92
                    });
                end;
            end;
            return;
        end;
    end, {
        v54
    });
    local v98 = if v67 then v67.resaleRestriction else v25.ResaleRestriction.None;
    local v99 = false;
    local v100 = {};
    if l_collectibleItemId_0 then
        if v64 then
            for _, v102 in v64 do
                if v102.isHeld then
                    v99 = true;
                end;
                table.insert(v100, {
                    id = v102.collectibleInstanceId, 
                    title = if v102.serialNumber then "#" .. v102.serialNumber else v67 and v67.name or "N/A", 
                    salePrice = if v102.saleState == "OnSale" then v102.price else nil, 
                    isOnHold = v102.isHeld, 
                    isOnSale = v102.saleState == "OnSale", 
                    order = if v102.serialNumber then v102.serialNumber else 0
                });
            end;
        end;
    else
        v97(v100, v58, true);
        v97(v100, v56, false);
        for _, v104 in v100 do
            if v104.isOnHold then
                v99 = true;
                break;
            end;
        end;
    end;
    table.sort(v100, function(v105, v106) --[[ Line: 270 ]]
        return v105.order < v106.order;
    end);
    if v98 == v25.ResaleRestriction.Disabled then
        v99 = false;
    end;
    local v107 = l_useNavigation_0();
    local v108 = v30({
        headerText = {
            "Feature.Catalog.Label.ItemOwnedCount"; 
            itemCount = #v100
        }, 
        holdingMessageText = "Feature.Catalog.Label.ItemInAHold", 
        holdingPromptTitleText = "Feature.Catalog.Heading.HoldingPolicy", 
        holdingPromptBodyText = if l_params_0.collectibleItemId then {
            "Feature.Catalog.Message.HoldingPolicyL2"; 
            purchaseDays = 30, 
            resaleDays = 7
        } else {
            "Feature.Catalog.Message.HoldingPolicyL1"; 
            days = 7
        }, 
        holdingPromptButtonText = "Feature.Avatar.Action.GotIt"
    });
    local function v111(_, _) --[[ Line: 296 ]] --[[ Name: onHoldingPolicyButtonActivated ]]
        -- upvalues: v107 (copy), l_AvatarScreen_0 (ref), v108 (copy)
        v107.navigate(l_AvatarScreen_0.GenericPrompt, {
            titleText = v108.holdingPromptTitleText, 
            bodyText = v108.holdingPromptBodyText, 
            buttonText = v108.holdingPromptButtonText
        });
    end;
    local v112 = v37.GetTextBounds(v108.holdingMessageText, v50.Font.SubHeader1.Font, v50.Font.BaseSize * v50.Font.SubHeader1.RelativeSize, Vector2.new(10000, 10000));
    local v113 = v2.useRef(nil);
    local v114 = v2.useRef(nil);
    local v115 = v2.useRef(nil);
    local v116 = l_useProperty_0(v113, "AbsoluteSize") or nil;
    local v117 = l_useProperty_0(v114, "AbsoluteSize") or nil;
    local v118 = 0;
    if v116 ~= nil and v117 ~= nil then
        v118 = v116.Y - v117.Y - 24;
    elseif v116 ~= nil then
        v118 = v116.Y - 24;
    end;
    local v119 = nil;
    local v120 = nil;
    if v46 then
        v120 = v2.useRef(nil);
        l_useFocusNavigableSurfaceRegistryConnection_0(v120.current, l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay);
        local v121 = v2.useRef(nil);
        l_useRedirectFocusIntoGuiObject_0(v121);
        local v122 = l_useMostRecentFocusBehavior_0(v121);
        v119 = l_useTableWrappedCallbackRef_0(v122);
    end;
    local v123 = if v60 then v60.tileRestrictionsMap else nil;
    local l_createElement_0 = v2.createElement;
    local l_v22_0 = v22;
    local v126 = {};
    local v127 = {};
    local l_createElement_1 = v2.createElement;
    local v129 = if v43() then l_Focusable_0.Frame else "Frame";
    local v130 = {
        ref = if v46 then v120 else nil, 
        SelectionGroup = v46 and true or nil, 
        SelectionBehaviorLeft = if v46 then Enum.SelectionBehavior.Stop else nil, 
        SelectionBehaviorRight = if v46 then Enum.SelectionBehavior.Stop else nil, 
        SelectionBehaviorUp = if v46 then Enum.SelectionBehavior.Stop else nil, 
        SelectionBehaviorDown = if v46 then Enum.SelectionBehavior.Stop else nil, 
        BackgroundColor3 = v50.Theme.BackgroundDefault.Color, 
        BackgroundTransparency = v50.Theme.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        Size = UDim2.fromScale(1, 1), 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if v43() then v74 else nil, 
        defaultChild = if v43() then v115 else nil, 
        restorePreviousChildFocus = v43() and true or nil, 
        inputBindings = if not l_FFlagAXMigrateItemOwnershipSellPagesInputBindingsToFocusNavigation_0 and v43() then {
            NavigateBack = v8.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 374 ]]
                -- upvalues: v24 (ref), v107 (copy)
                v24.closeFocusedScreen(v107);
            end)
        } else nil, 
        Active = true
    };
    local v131 = {
        GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v43() and v2.createElement(v23, {
            focusController = v74, 
            captureFocusOnMount = true
        }), 
        TopBar = v2.createElement(v26.Container, {
            ZIndex = 2, 
            titleText = v108.headerText, 
            leftItem = v26.BackButton
        })
    };
    local l_createElement_2 = v2.createElement;
    local l_PageContent_0 = v26.PageContent;
    local v134 = {
        ZIndex = 2
    };
    local v135 = {};
    local l_createElement_3 = v2.createElement;
    local v137 = "Frame";
    local v138 = {
        LayoutOrder = 1, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        ref = v113
    };
    local v139 = {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 24)
        })
    };
    local l_createElement_4 = v2.createElement;
    local l_l_VerticalScrollViewWithMargin_0_0 = l_VerticalScrollViewWithMargin_0;
    local v142 = {
        useAutomaticCanvasSize = true, 
        canvasSizeY = UDim.new(1, 0), 
        size = UDim2.new(1, 0, 0, v118), 
        Selectable = not v46 and nil, 
        ref = if v46 then v119 else nil
    };
    local v143 = {
        ListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, 24), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 24)
        })
    };
    local v144 = false;
    if #v100 > 0 then
        v144 = v2.createElement(v27, {
            itemsOnSale = true, 
            itemId = l_params_0.itemId, 
            itemType = l_params_0.itemType, 
            restrictionTypes = v123, 
            onItemActivated = v86, 
            resaleRestriction = v98, 
            items = v100, 
            layoutOrder = 1, 
            ref = if v43() then v115 else nil
        });
    end;
    v143.ItemsList = v144;
    v139.ScrollView = l_createElement_4(l_l_VerticalScrollViewWithMargin_0_0, v142, v143);
    v139.HoldingPolicyInfoContainer = v99 and v2.createElement("Frame", {
        LayoutOrder = 2, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1, 
        ref = v114
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 24)
        }), 
        HoldingPromptTextButton = v2.createElement("TextButton", {
            LayoutOrder = 1, 
            Text = v108.holdingMessageText, 
            Font = v50.Font.SubHeader1.Font, 
            Size = UDim2.new(0, v112.X, 0, v112.Y), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextSize = v50.Font.BaseSize * v50.Font.SubHeader1.RelativeSize, 
            TextColor3 = v50.Theme.TextEmphasis.Color, 
            TextTransparency = v50.Theme.TextEmphasis.Transparency, 
            BackgroundTransparency = 1, 
            Selectable = not v46 and nil, 
            [v2.Event.Activated] = v111
        }), 
        HoldingPromptIconButton = v2.createElement(l_IconButton_0, {
            layoutOrder = 2, 
            icon = v47, 
            iconSize = l_IconSize_0.Small, 
            iconColor3 = v50.Theme.IconEmphasis.Color, 
            iconTransparency = v50.Theme.IconEmphasis.Transparency, 
            backgroundTransparency = 1, 
            onActivated = v111
        })
    });
    v135.PageContentFrame = l_createElement_3(v137, v138, v139);
    v131.Contents = l_createElement_2(l_PageContent_0, v134, v135);
    v127.Background = l_createElement_1(v129, v130, v131);
    return l_createElement_0(l_v22_0, v126, v127);
end;