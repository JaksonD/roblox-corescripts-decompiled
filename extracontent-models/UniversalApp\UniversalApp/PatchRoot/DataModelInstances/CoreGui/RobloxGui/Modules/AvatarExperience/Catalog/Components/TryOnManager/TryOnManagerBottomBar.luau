local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_withNavigation_0 = require(l_CorePackages_0.Packages.RoactNavigation).withNavigation;
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local v8 = require(l_CorePackages_0.Packages.t);
local v9 = require(l_CorePackages_0.Packages.Cryo);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local v14 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_withStyle_0 = v7.Core.Style.withStyle;
local l_Images_0 = v7.App.ImageSet.Images;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v20 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v21 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v22 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v23 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v24 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v26 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v27 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v28 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v29 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.ActionBar);
local v30 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.ActionButton);
local v31 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v32 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v33 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.ReportLook);
local v34 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v35 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v36 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v37 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v38 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_getTryOnItemReducerKey_0 = v14.Utils.getTryOnItemReducerKey;
local v41 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXRemovePurchaseOutfitPrompt_0 = v41.FFlagAXRemovePurchaseOutfitPrompt;
local l_ActionBarHeight_0 = v27.ActionBar.ActionBarHeight;
local v45 = l_Images_0["icons/common/robux"];
local v46 = l_Images_0["icons/actions/block"];
local v47 = l_Images_0["icons/menu/avatar_on"];
local v48 = l_Images_0["icons/actions/feedback"];
local v49 = l_Images_0["icons/actions/info"];
local v50 = v3.PureComponent:extend("TryOnManagerBottomBar");
v50.validateProps = v8.strictInterface({
    tryOnItems = v8.optional(v8.table), 
    lookId = v8.optional(v8.string), 
    lookType = v8.optional(v8.string), 
    assetInfos = v8.optional(v8.table), 
    bundleInfos = v8.optional(v8.table), 
    userRobux = v8.optional(v8.number), 
    collectiblesItemInfo = v8.table, 
    collectiblesResellersInstances = v8.table, 
    resellableInstances = v8.table, 
    showMoreButton = v8.optional(v8.boolean), 
    peekViewState = v8.userdata, 
    navigateWithLock = v8.callback, 
    reportLook = v8.callback, 
    setFullView = v8.callback, 
    setTryOnManagerPeekViewState = v8.callback, 
    catalogAnalytics = v8.table, 
    localization = v8.table, 
    networking = v8.callback, 
    navigation = v8.table, 
    avatarRoute = v8.table, 
    focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v8.optional(v8.table)
});
v50.getPriceForItem = function(v51, v52) --[[ Line: 114 ]] --[[ Name: getPriceForItem ]]
    -- upvalues: v28 (copy)
    local l_collectiblesItemInfo_0 = v51.props.collectiblesItemInfo;
    local l_collectiblesResellersInstances_0 = v51.props.collectiblesResellersInstances;
    local l_resellableInstances_0 = v51.props.resellableInstances;
    local v56 = v52.lowestPrice or v52.priceInRobux;
    if v52.collectibleItemId then
        local v57 = v28.findCheapestCollectiblePurchaseInfoV2(v52.collectibleItemId, v28.IsResellable(v52), l_collectiblesItemInfo_0, l_collectiblesResellersInstances_0, l_resellableInstances_0);
        if v57.price then
            v56 = v57.price;
        end;
    end;
    return v56;
end;
v50.getItemInfo = function(v58, v59, v60) --[[ Line: 138 ]] --[[ Name: getItemInfo ]]
    -- upvalues: v35 (copy)
    local _ = nil;
    if v60 == v35.ItemType.Asset then
        return v58.props.assetInfos[v59];
    else
        return v58.props.bundleInfos[v59];
    end;
end;
v50.getBottomBarInfo = function(v62, _) --[[ Line: 148 ]] --[[ Name: getBottomBarInfo ]]
    -- upvalues: v9 (copy)
    local v64 = 0;
    local v65 = 0;
    local v66 = {};
    local v67 = false;
    for _, v69 in v62.props.tryOnItems do
        if v69.selectedInTryOnManager then
            v64 = v64 + 1;
            local v70 = v62:getItemInfo(v69.itemId, v69.itemType);
            local v71 = nil;
            if not v70 or not v70.receivedCatalogData then
                v67 = true;
            elseif not v70.isOwned then
                v71 = v62:getPriceForItem(v70);
                if v71 ~= nil then
                    v65 = v65 + v71;
                    v66[v69.itemId] = v9.Dictionary.join(v69, {
                        expectedPrice = v71
                    });
                end;
            end;
        end;
    end;
    return v65, v64, v66, v67;
end;
v50.areAllSelectedTryOnsOwned = function(v72) --[[ Line: 191 ]] --[[ Name: areAllSelectedTryOnsOwned ]]
    local v73 = 0;
    for _, v75 in v72.props.tryOnItems do
        if v75.selectedInTryOnManager then
            local v76 = v72:getItemInfo(v75.itemId, v75.itemType);
            if not v76 or not v76.receivedCatalogData then
                return false;
            elseif not v76.isOwned then
                return false;
            else
                v73 = v73 + 1;
            end;
        end;
    end;
    return v73 > 0;
end;
v50.getAvatarEditorCategoryIndexesByName = function(_, v78, v79) --[[ Line: 219 ]] --[[ Name: getAvatarEditorCategoryIndexesByName ]]
    -- upvalues: v21 (copy)
    local v80 = v21();
    local v81 = nil;
    local v82 = nil;
    for v83, v84 in v80 do
        if v84.Name == v78 then
            v81 = v83;
            if v79 and v84.Subcategories then
                for v85, v86 in v84.Subcategories do
                    if v86.Name == v79 then
                        return v81, v85;
                    end;
                end;
                return v81, v82;
            else
                break;
            end;
        end;
    end;
    return v81, v82;
end;
v50.init = function(v87) --[[ Line: 240 ]] --[[ Name: init ]]
    -- upvalues: l_UserInputService_0 (copy), l_isGamepadInput_0 (copy), l_AvatarScreen_0 (copy), v31 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v9 (copy), v20 (copy), l_getTryOnItemReducerKey_0 (copy), l_FFlagAXRemovePurchaseOutfitPrompt_0 (copy), v35 (copy), v38 (copy), l_PeekViewState_0 (copy), v34 (copy), v49 (copy), v48 (copy)
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    v87:setState({
        lastInputIsGamepad = l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_0)
    });
    v87.lastInputTypeChangedCallback = function(v89) --[[ Line: 246 ]]
        -- upvalues: l_isGamepadInput_0 (ref), v87 (copy)
        local v90 = l_isGamepadInput_0(v89);
        if v90 ~= v87.state.lastInputIsGamepad then
            v87:setState({
                lastInputIsGamepad = v90
            });
        end;
    end;
    v87.onOverlayClosed = function(v91) --[[ Line: 255 ]]
        -- upvalues: v87 (copy), l_AvatarScreen_0 (ref), v31 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref)
        return function() --[[ Line: 256 ]]
            -- upvalues: v87 (ref), l_AvatarScreen_0 (ref), v31 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v91 (copy)
            if v87.state.lastInputIsGamepad and v87.props.avatarRoute.current.name == l_AvatarScreen_0.TryOnManager then
                v31("TryOnManager");
                if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                    v91.captureFocus();
                end;
            end;
        end;
    end;
    v87.onButtonPress = function() --[[ Line: 269 ]]
        -- upvalues: v87 (copy), l_AvatarScreen_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v9 (ref), v20 (ref), l_getTryOnItemReducerKey_0 (ref), l_FFlagAXRemovePurchaseOutfitPrompt_0 (ref)
        local l_navigation_0 = v87.props.navigation;
        local v93, _, v95 = v87:getBottomBarInfo();
        local v96 = nil;
        local v97 = nil;
        if v87.props.userRobux < v93 then
            v96 = l_AvatarScreen_0.InsufficientRobuxPrompt;
            v97 = {
                onOverlayClosed = v87.onOverlayClosed(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v87.props.focusController)
            };
        elseif v9.isEmpty(v95) and v87.props.lookId ~= nil then
            local v98, v99 = v87:getAvatarEditorCategoryIndexesByName(v20.CharacterKey);
            v96 = l_AvatarScreen_0.LeaveCatalogToAvatarPrompt;
            v97 = {
                onOverlayClosed = v87.onOverlayClosed(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v87.props.focusController), 
                categoryOverride = v98, 
                subcategoryOverride = v99
            };
        else
            local v100 = {};
            for _, v102 in v87.props.tryOnItems do
                if v102.selectedInTryOnManager then
                    local v103 = v87:getItemInfo(v102.itemId, v102.itemType);
                    if v103 and v103.isOwned then
                        v100[l_getTryOnItemReducerKey_0(v102.itemId, v102.itemType)] = v102;
                    end;
                end;
            end;
            if v87.props.lookId ~= nil then
                v96 = l_AvatarScreen_0.PurchaseLookPrompt;
                v97 = {
                    itemsToPurchase = v95, 
                    lookId = v87.props.lookId, 
                    ownedTryOnItems = v100, 
                    priceInRobux = v93, 
                    showSaveAsCharacter = true, 
                    showWearAfterPurchase = true
                };
            elseif not l_FFlagAXRemovePurchaseOutfitPrompt_0 then
                v96 = l_AvatarScreen_0.PurchaseOutfitPrompt;
                v97 = {
                    itemsToPurchase = v95, 
                    ownedTryOnItems = v100, 
                    totalOutfitPrice = v93, 
                    onOverlayClosed = v87.onOverlayClosed(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v87.props.focusController)
                };
            end;
        end;
        local function v104() --[[ Line: 337 ]]
            -- upvalues: l_navigation_0 (copy), v96 (ref), v97 (ref)
            l_navigation_0.navigate(v96, v97);
        end;
        v87.props.navigateWithLock(v104);
    end;
    v87.contextMenuClosedCallback = function(v105) --[[ Line: 343 ]]
        -- upvalues: v87 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref)
        return function() --[[ Line: 344 ]]
            -- upvalues: v87 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v105 (copy)
            v87:setState({
                isMoreButtonSelected = false
            });
            v87.onOverlayClosed(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v105);
        end;
    end;
    v87.onViewDetailsPageActivate = function(v106) --[[ Line: 352 ]]
        -- upvalues: v87 (copy), v35 (ref), v38 (ref), l_PeekViewState_0 (ref), v34 (ref)
        v87.props.catalogAnalytics.sendAXCounter(v35.Counter.ContextFrame.ViewDetailsPageClick);
        v87.props.setFullView(v87.props.catalogAnalytics, v87.props.avatarRoute.opaque.name, v38.None);
        v87.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Brief);
        v34.closeOverlay(v106);
    end;
    v87.getContextMenuButtons = function(v107) --[[ Line: 359 ]]
        -- upvalues: v87 (copy), l_PeekViewState_0 (ref), v49 (ref), v48 (ref), v34 (ref)
        return {
            if not (v87.props.peekViewState == l_PeekViewState_0.SuperBrief) then nil else {
                icon = v49, 
                text = v107.viewDetailsPageLabel, 
                onActivated = v87.onViewDetailsPageActivate
            }, 
            {
                icon = v48, 
                text = v107.reportText, 
                onActivated = function(v108) --[[ Line: 372 ]] --[[ Name: onActivated ]]
                    -- upvalues: v87 (ref), v34 (ref)
                    v87.props.reportLook(v87.props.networking);
                    v34.closeOverlay(v108);
                end
            }
        };
    end;
    v87.openLooksContextMenu = function(v109, v110) --[[ Line: 380 ]]
        -- upvalues: v87 (copy), l_AvatarScreen_0 (ref)
        local l_navigation_1 = v87.props.navigation;
        local function v112() --[[ Line: 382 ]]
            -- upvalues: l_navigation_1 (copy), l_AvatarScreen_0 (ref), v87 (ref), v110 (copy), v109 (copy)
            l_navigation_1.navigate(l_AvatarScreen_0.ContextMenu, {
                centered = false, 
                contextButtons = v87.getContextMenuButtons(v110), 
                onOverlayClosed = v109
            });
        end;
        v87.props.navigateWithLock(v112);
    end;
end;
v50.renderWithProviders = function(v113, v114, v115) --[[ Line: 393 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v45 (copy), v9 (copy), v47 (copy), v46 (copy), l_NumberLocalization_0 (copy), v3 (copy), v29 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v30 (copy), l_ActionBarHeight_0 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy)
    local l_Theme_0 = v114.Theme;
    local l_Font_0 = v114.Font;
    local v118, v119, v120, v121 = v113:getBottomBarInfo(v115);
    local l_v45_0 = v45;
    local v123 = false;
    local v124 = nil;
    if v9.isEmpty(v120) then
        v124 = "";
        if v113.props.lookId ~= nil and v113:areAllSelectedTryOnsOwned() then
            l_v45_0 = v47;
        else
            l_v45_0 = v46;
            v123 = true;
        end;
    elseif v118 == 0 then
        l_v45_0 = nil;
        v124 = v115.freeText;
    else
        v124 = l_NumberLocalization_0.localize(string.format("%.0f", v118), v113.props.localization:GetLocale());
    end;
    local v125 = {
        buttonText = v124, 
        buttonIcon = l_v45_0, 
        buttonIsLoading = v121, 
        buttonIsDisabled = v123, 
        buttonIconPadding = 5, 
        buttonIconSize = 30, 
        buttonColor = v114.Theme.ContextualPrimaryDefault.Color, 
        buttonTextColor = v114.Theme.ContextualPrimaryContent.Color, 
        onActivated = not v123 and v113.onButtonPress or nil
    };
    local v126 = v113.props.localization:Format("Feature.Avatar.Label.TryOnManagerDescriptor", {
        numItems = v119
    });
    if v113.props.lookId ~= nil then
        local v127 = v113.props.showMoreButton == nil or v113.props.showMoreButton;
        return v3.createElement(v29, {
            bottomPadding = 0, 
            buttonProps = v125, 
            hideGradient = true, 
            isMoreButtonSelected = v113.state.isMoreButtonSelected, 
            leftPadding = 0, 
            onMoreButtonActivated = function() --[[ Line: 444 ]] --[[ Name: onMoreButtonActivated ]]
                -- upvalues: v113 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v115 (copy)
                v113.openLooksContextMenu(v113.contextMenuClosedCallback(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v113.props.focusController), v115);
                v113:setState({
                    isMoreButtonSelected = true
                });
            end, 
            rightPadding = 0, 
            showMoreButton = v127, 
            topComponentHeight = 0, 
            ZIndex = 1
        });
    else
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromOffset(0, -10)
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, 12)
            }), 
            TryOnDescriptor = v3.createElement("TextLabel", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 20), 
                Text = v126, 
                TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
                Font = l_Font_0.Header2.Font, 
                TextColor3 = l_Theme_0.SecondaryContent.Color, 
                TextTransparency = l_Theme_0.SecondaryContent.Transparency, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            }), 
            ActionButton = v3.createElement(v30, {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, l_ActionBarHeight_0), 
                Font = l_Font_0, 
                buttonProps = v125
            }), 
            LastInputTypeChangedConnection = v3.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.LastInputTypeChanged, 
                callback = v113.lastInputTypeChangedCallback
            })
        });
    end;
end;
v50.render = function(v128) --[[ Line: 503 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy)
    return l_withStyle_0(function(v129) --[[ Line: 504 ]]
        -- upvalues: l_withLocalization_0 (ref), v128 (copy)
        return l_withLocalization_0({
            freeText = "Feature.Catalog.LabelFree", 
            reportText = "Feature.Catalog.Action.Report", 
            viewDetailsPageLabel = "Feature.Catalog.Action.ViewDetailsPage"
        })(function(v130) --[[ Line: 509 ]]
            -- upvalues: v128 (ref), v129 (copy)
            return v128:renderWithProviders(v129, v130);
        end);
    end);
end;
local function v144(v131, _) --[[ Line: 515 ]] --[[ Name: mapStateToProps ]]
    local l_LocalUserId_0 = v131.LocalUserId;
    local function _() --[[ Line: 519 ]]
        -- upvalues: v131 (copy)
        local v134 = nil;
        local l_Looks_0 = v131.AvatarExperience.AvatarScene.Looks;
        local l_LookId_0 = v131.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
        if l_LookId_0 ~= nil and l_Looks_0 ~= nil then
            local v137 = l_Looks_0[l_LookId_0];
            if v137 then
                v134 = v137.lookType;
            end;
        end;
        return v134;
    end;
    local v139 = {
        tryOnItems = v131.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems, 
        lookId = v131.AvatarExperience.AvatarScene.OutfitTryOn.LookId
    };
    local v140 = nil;
    local l_Looks_1 = v131.AvatarExperience.AvatarScene.Looks;
    local l_LookId_1 = v131.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
    if l_LookId_1 ~= nil and l_Looks_1 ~= nil then
        local v143 = l_Looks_1[l_LookId_1];
        if v143 then
            v140 = v143.lookType;
        end;
    end;
    v139.lookType = v140;
    v139.assetInfos = v131.AvatarExperience.Common.AssetInfos;
    v139.bundleInfos = v131.AvatarExperience.Common.BundleInfos;
    v139.userRobux = v131.UserRobux[l_LocalUserId_0];
    v139.collectiblesItemInfo = v131.AvatarExperience.Common.Collectibles.CollectiblesItemInfo;
    v139.collectiblesResellersInstances = v131.AvatarExperience.Common.Collectibles.CollectiblesResellersInstances;
    v139.resellableInstances = v131.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances;
    v139.peekViewState = v131.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState;
    return v139;
end;
local function v152(v145) --[[ Line: 546 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v37 (copy), v36 (copy), v26 (copy), v33 (copy)
    return {
        setFullView = function(v146, v147, v148) --[[ Line: 548 ]] --[[ Name: setFullView ]]
            -- upvalues: v145 (copy), v37 (ref)
            v145(v37(v146, v147, v148));
        end, 
        setTryOnManagerPeekViewState = function(v149) --[[ Line: 551 ]] --[[ Name: setTryOnManagerPeekViewState ]]
            -- upvalues: v145 (copy), v36 (ref)
            v145(v36(v149));
        end, 
        navigateWithLock = function(v150) --[[ Line: 554 ]] --[[ Name: navigateWithLock ]]
            -- upvalues: v145 (copy), v26 (ref)
            v145(v26(v150));
        end, 
        reportLook = function(v151) --[[ Line: 557 ]] --[[ Name: reportLook ]]
            -- upvalues: v145 (copy), v33 (ref)
            v145(v33(v151));
        end
    };
end;
v50 = l_RoactServices_0.connect({
    catalogAnalytics = v22, 
    localization = v23, 
    networking = v24
})(v50);
v50 = v32((l_withNavigation_0(v4.connect(v144, v152)(v50), nil)));
if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
    return v50;
else
    return function(v153) --[[ Line: 577 ]]
        -- upvalues: v5 (copy), v3 (copy), v50 (ref), v9 (copy)
        return v5.withFocusController(function(v154) --[[ Line: 578 ]]
            -- upvalues: v3 (ref), v50 (ref), v9 (ref), v153 (copy)
            return v3.createElement(v50, v9.Dictionary.join(v153, {
                focusController = v154
            }));
        end);
    end;
end;