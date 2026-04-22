local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v5 = require(l_Modules_0.LuaApp.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v10 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v12 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local v13 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v15 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_WidgetConstants_0 = v12.WidgetConstants;
local v17 = require(l_Modules_0.LuaApp.mutedError);
local v18 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v19 = require(l_Modules_0.AvatarExperience.Common.Models.ModelsUtils);
local v20 = require(l_Modules_0.AvatarExperience.Common.Util.AvatarWidgetBlockyUtils);
local v21 = require(l_Modules_0.AvatarExperience.Common.Actions.AddLookDetails);
local v22 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local l_SetTryOnManagerPeekViewState_0 = v22.Actions.SetTryOnManagerPeekViewState;
local l_SetLookDetailsPeekViewSelectedTab_0 = v22.Actions.SetLookDetailsPeekViewSelectedTab;
local v25 = require(l_Modules_0.AvatarExperience.Common.Actions.TryOnLooksOutfit);
local v26 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v27 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppLocales).Localization;
local v29 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local v30 = require(l_Modules_0.AvatarExperience.Common.Actions.SetFullView);
local l_FullView_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Enums.FullView;
local v32 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfoBatched);
local l_NavigateWithLock_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock;
local v34 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v35 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableLookFavoriting);
local l_FFlagAXMISEnableMultiShopping_0 = v3.FFlagAXMISEnableMultiShopping;
local v37 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLookDetailsDeepLink);
local v38 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixDeepLinkRelatedIssues);
local v39 = game:DefineFastFlag("RemoveTryOnLookV2MutedError", false);
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local l_FFlagParseHeadShapeFromAPIResponse_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagParseHeadShapeFromAPIResponse;
local l_FFlagAXCatalogMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport;
local l_FFlagAXBlackbirdRoot_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXBlackbirdRoot;
local function _(v44) --[[ Line: 62 ]] --[[ Name: keyMapper ]]
    -- upvalues: v10 (copy)
    return v10.FetchLookDetailInfoKey .. v44;
end;
local function v50(v46, v47) --[[ Line: 66 ]] --[[ Name: translateString ]]
    -- upvalues: l_LocalizationService_0 (copy), l_Localization_0 (copy)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v49 = l_Localization_0.new(l_RobloxLocaleId_0);
    v49:SetLocale(l_RobloxLocaleId_0);
    return v49:Format(v46, v47);
end;
local function v55(v51, v52, v53, v54) --[[ Line: 74 ]] --[[ Name: handleErrorCases ]]
    -- upvalues: v39 (copy), v17 (copy), v29 (copy), l_NavigateWithLock_0 (copy), v34 (copy), v27 (copy), v18 (copy)
    if not v39 then
        v17(tostring(v54) .. tostring(v53));
    end;
    v51:dispatch(v29());
    if v52 ~= nil then
        v51:dispatch(l_NavigateWithLock_0(function() --[[ Line: 81 ]]
            -- upvalues: v34 (ref), v52 (copy)
            v34.closeTryOnManager(v52);
        end));
    end;
    v51:dispatch(v27({
        isLocalized = false, 
        toastType = v18.NetworkingError, 
        toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong"
    }));
end;
local function v58(v56) --[[ Line: 92 ]] --[[ Name: processAssetItem ]]
    -- upvalues: l_WidgetConstants_0 (copy), v15 (copy)
    local v57 = false;
    if v56.id ~= nil then
        v57 = v56.assetType ~= nil;
    end;
    assert(v57, "Asset is missing required fields");
    return {
        itemId = v56.id, 
        itemType = l_WidgetConstants_0.ContentType.Asset, 
        itemSubType = tostring(v56.assetType), 
        tryOnItemOrder = v56.tryOnItemOrder, 
        isNotSelectable = not v15.isItemSelectable(v56), 
        order = if v56.meta then v56.meta.order else nil
    };
end;
local function v61(v59) --[[ Line: 105 ]] --[[ Name: processAssetItemInBundle ]]
    -- upvalues: l_WidgetConstants_0 (copy), l_FFlagParseHeadShapeFromAPIResponse_0 (copy)
    local v60 = false;
    if v59.id ~= nil then
        v60 = v59.assetType ~= nil;
    end;
    assert(v60, "Asset is missing required fields");
    return {
        itemId = tostring(v59.id), 
        itemType = l_WidgetConstants_0.ContentType.Asset, 
        itemSubType = tostring(v59.assetType), 
        tryOnItemOrder = v59.tryOnItemOrder, 
        headShape = if l_FFlagParseHeadShapeFromAPIResponse_0 and v59.meta then v59.meta.headShape else nil
    };
end;
local function v67(v62) --[[ Line: 119 ]] --[[ Name: processBundleItem ]]
    -- upvalues: v61 (copy), l_WidgetConstants_0 (copy), v15 (copy)
    local v63 = false;
    if v62.id ~= nil then
        v63 = v62.bundleType ~= nil;
    end;
    assert(v63, "Bundle is missing required fields");
    local v64 = 0;
    v63 = {};
    for v65, v66 in v62.assetsInBundle do
        if v66.isIncluded then
            v66.tryOnItemOrder = v65;
            v64 = v64 + 1;
            table.insert(v63, (v61(v66)));
        end;
    end;
    return {
        itemId = v62.id, 
        itemType = l_WidgetConstants_0.ContentType.Bundle, 
        itemSubType = tostring(v62.bundleType), 
        items = v63, 
        numberOfAssetsIncluded = if v64 > 0 then v64 else nil, 
        tryOnItemOrder = v62.tryOnItemOrder, 
        isNotSelectable = not v15.isItemSelectable(v62)
    };
end;
local v68 = nil;
v68 = v35() and function(v69, v70) --[[ Line: 145 ]]
    -- upvalues: v11 (copy), v5 (copy)
    local v71 = {
        v11.GetLookDetailsV2(v69, v70), 
        (v11.HasFavoritedLook(v69, v70))
    };
    return v5.allSettled(v71):andThen(function(v72) --[[ Line: 152 ]]
        -- upvalues: v5 (ref), v71 (copy), v70 (copy)
        if v72[1] ~= v5.Status.Resolved then
            return v5.reject("Failed to fetch look details");
        else
            local v73 = v71[1]:expect();
            local v74 = false;
            if v72[2] == v5.Status.Resolved then
                v74 = v71[2]:expect().responseBody.isFavorited;
            else
                warn("HasFavoritedLook API call failed for lookId:", v70);
            end;
            if v73.responseBody.look then
                v73.responseBody.look.isFavorited = v74;
            end;
            return v73;
        end;
    end);
end or v11.GetLookDetailsV2;
return function(v75, v76, v77, v78, v79, v80) --[[ Line: 180 ]]
    -- upvalues: v38 (copy), v30 (copy), l_AvatarScreen_0 (copy), l_FullView_0 (copy), l_SetLookDetailsPeekViewSelectedTab_0 (copy), l_PerformFetch_0 (copy), v10 (copy), v68 (ref), l_FFlagAXCatalogMakeupSupport_0 (copy), v13 (copy), v19 (copy), l_WidgetConstants_0 (copy), l_FFlagAXBlackbirdRoot_0 (copy), v20 (copy), v50 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v32 (copy), v21 (copy), v35 (copy), v58 (copy), v67 (copy), v37 (copy), l_SetTryOnManagerPeekViewState_0 (copy), l_PeekViewState_0 (copy), v15 (copy), v26 (copy), v25 (copy), l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), v34 (copy), l_NavigateWithLock_0 (copy), v5 (copy), l_Logging_0 (copy), v55 (copy), v27 (copy), v18 (copy)
    return function(v81) --[[ Line: 188 ]]
        -- upvalues: v38 (ref), v30 (ref), l_AvatarScreen_0 (ref), l_FullView_0 (ref), v80 (copy), l_SetLookDetailsPeekViewSelectedTab_0 (ref), l_PerformFetch_0 (ref), v78 (copy), v10 (ref), v68 (ref), v75 (copy), l_FFlagAXCatalogMakeupSupport_0 (ref), v13 (ref), v19 (ref), l_WidgetConstants_0 (ref), l_FFlagAXBlackbirdRoot_0 (ref), v20 (ref), v50 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v32 (ref), v77 (copy), v21 (ref), v35 (ref), v58 (ref), v67 (ref), v37 (ref), v79 (copy), l_SetTryOnManagerPeekViewState_0 (ref), l_PeekViewState_0 (ref), v15 (ref), v26 (ref), v25 (ref), v76 (copy), l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref), v34 (ref), l_NavigateWithLock_0 (ref), v5 (ref), l_Logging_0 (ref), v55 (ref), v27 (ref), v18 (ref)
        if v38() then
            v81:dispatch(v30(l_AvatarScreen_0.Catalog, l_FullView_0.None));
        end;
        if v80 then
            v81:dispatch(l_SetLookDetailsPeekViewSelectedTab_0(v80));
        end;
        local l_Single_0 = l_PerformFetch_0.Single;
        local l_v78_0 = v78;
        return l_Single_0(v10.FetchLookDetailInfoKey .. l_v78_0, function(v84) --[[ Line: 196 ]]
            -- upvalues: v68 (ref), v75 (ref), v78 (ref), l_FFlagAXCatalogMakeupSupport_0 (ref), v13 (ref), v19 (ref), l_WidgetConstants_0 (ref), l_FFlagAXBlackbirdRoot_0 (ref), v20 (ref), v50 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v32 (ref), v77 (ref), v21 (ref), v35 (ref), v58 (ref), v67 (ref), v37 (ref), v79 (ref), l_SetTryOnManagerPeekViewState_0 (ref), l_PeekViewState_0 (ref), v15 (ref), v26 (ref), v25 (ref), v76 (ref), l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref), l_AvatarScreen_0 (ref), v34 (ref), l_NavigateWithLock_0 (ref), v5 (ref), l_Logging_0 (ref), v38 (ref), v55 (ref), v27 (ref), v18 (ref)
            return v68(v75, v78):andThen(function(v85) --[[ Line: 197 ]]
                -- upvalues: l_FFlagAXCatalogMakeupSupport_0 (ref), v13 (ref), v19 (ref), l_WidgetConstants_0 (ref), l_FFlagAXBlackbirdRoot_0 (ref), v20 (ref), v50 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v84 (copy), v32 (ref), v75 (ref), v77 (ref), v21 (ref), v78 (ref), v35 (ref), v58 (ref), v67 (ref), v37 (ref), v79 (ref), l_SetTryOnManagerPeekViewState_0 (ref), l_PeekViewState_0 (ref), v15 (ref), v26 (ref), v25 (ref), v76 (ref), l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref), l_AvatarScreen_0 (ref), v34 (ref), l_NavigateWithLock_0 (ref), v5 (ref), l_Logging_0 (ref), v38 (ref), v55 (ref), v27 (ref), v18 (ref)
                local l_look_0 = v85.responseBody.look;
                local v87 = nil;
                if l_look_0 then
                    local v88 = if l_FFlagAXCatalogMakeupSupport_0 then l_look_0.lookType == v13.LookType.Makeup else nil;
                    local v89 = {};
                    local v90 = {};
                    for v91, v92 in l_look_0.items do
                        v92.id = tostring(v92.id);
                        local _, v94 = v19.CreateRestrictionInfo(v92.itemRestrictions);
                        v92.itemRestrictionsMap = v94;
                        v92.tryOnItemOrder = v91;
                        if v92.itemType == l_WidgetConstants_0.ContentType.Asset then
                            if v92.timedOptions then
                                table.insert(v92.timedOptions, {
                                    days = 0, 
                                    price = v92.priceInRobux, 
                                    selected = true
                                });
                            end;
                            table.insert(v89, v92);
                        elseif v92.itemType == l_WidgetConstants_0.ContentType.Bundle then
                            table.insert(v90, v92);
                        else
                            warn("TryOnLookV2 - Unknown item type: " .. v92.itemType);
                        end;
                        if l_FFlagAXBlackbirdRoot_0 and v92.discountInformation and v87 == nil then
                            v87 = v92.discountInformation.discounts;
                        end;
                    end;
                    local v95 = if l_FFlagAXCatalogMakeupSupport_0 and v88 then nil else v20.buildBlockyLookDetailItem(v90, v50);
                    if v95 then
                        table.insert(v90, v95);
                        v20.adjustTryOnItemOrderForBlockyBundle(v89, v90, l_look_0.items);
                    end;
                    if l_FFlagAXMISEnableMultiShopping_0 then
                        local v96 = table.clone(l_look_0.items);
                        if v95 then
                            table.insert(v96, v95);
                        end;
                        v84:dispatch(v32(v75, v77, v96));
                    end;
                    v84:dispatch(v21(v78, l_look_0.totalPrice, nil, v89, v90, l_look_0.lookType, l_look_0.totalValue, l_look_0.curator, l_look_0.description, l_look_0.moderationStatus, l_look_0.name, l_look_0.displayProperties, if v35() then l_look_0.favoriteCount else nil, if v35() then l_look_0.isFavorited else nil, if l_FFlagAXBlackbirdRoot_0 then v87 else nil));
                    local v97 = {};
                    for _, v99 in v89 do
                        table.insert(v97, (v58(v99)));
                    end;
                    local v100 = {};
                    for _, v102 in v90 do
                        table.insert(v100, (v67(v102)));
                    end;
                    if v37 then
                        if l_FFlagAXMISEnableMultiShopping_0 then
                            if v79 then
                                v84:dispatch(l_SetTryOnManagerPeekViewState_0(v79));
                            end;
                        else
                            v84:dispatch(l_SetTryOnManagerPeekViewState_0(if v79 then v79 else l_PeekViewState_0.SuperBrief));
                        end;
                    else
                        v84:dispatch(l_SetTryOnManagerPeekViewState_0(l_PeekViewState_0.SuperBrief));
                    end;
                    local v103 = if not (l_FFlagAXCatalogMakeupSupport_0 and v88) and l_look_0.avatarProperties then v15.convertBodyColor3HexesToColor3s(l_look_0.avatarProperties.bodyColor3s) else nil;
                    local v104 = nil;
                    if v103 then
                        v104 = {};
                        local l_DefaultBodyColorRanges_0 = v84:getState().AvatarExperience.AvatarEditor.DefaultBodyColorRanges;
                        for v106, v107 in v103 do
                            local v108, _ = v26.findRangeAndSliderValueForColor3(v107, l_DefaultBodyColorRanges_0);
                            v104[v106] = v108;
                        end;
                    end;
                    local v110 = nil;
                    if (not l_FFlagAXCatalogMakeupSupport_0 or not v88) and l_look_0.avatarProperties then
                        v110 = l_look_0.avatarProperties.scale;
                    end;
                    v84:dispatch(v25({
                        assetItemIdTypeAndSubtype = v97, 
                        bundleItemIdTypeAndSubtype = v100, 
                        lookId = v78, 
                        analyticsInfo = v77, 
                        lookType = l_look_0.lookType, 
                        bodyColor3s = v103, 
                        bodyPartColorRangeIds = v104, 
                        scale = v110
                    }));
                    if v76 ~= nil then
                        if l_FFlagAXMISEnableMultiShopping_0 then
                            local v111 = v84:getState();
                            local v112 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentRoactNavigationRoute(v111).routeName else v111.Navigation.currentRoute.routeName;
                            if v112 == l_AvatarScreen_0.Checkout then
                                v34.closeFocusedScreen(v76);
                            elseif v112 == l_AvatarScreen_0.MySharedAvatars or v79 == l_PeekViewState_0.Full then
                                v84:dispatch(l_NavigateWithLock_0(function() --[[ Line: 356 ]]
                                    -- upvalues: v34 (ref), v76 (ref), l_AvatarScreen_0 (ref)
                                    v34.closeFiltersAndItemDetails(v76);
                                    v34.closeTryOnManager(v76, {
                                        l_AvatarScreen_0.TryOnManager
                                    });
                                    v76.navigate(l_AvatarScreen_0.LookDetails);
                                end));
                            end;
                        else
                            v84:dispatch(l_NavigateWithLock_0(function() --[[ Line: 363 ]]
                                -- upvalues: v34 (ref), v76 (ref), l_AvatarScreen_0 (ref)
                                v34.closeFiltersAndItemDetails(v76);
                                v34.closeTryOnManager(v76, {
                                    l_AvatarScreen_0.TryOnManager
                                });
                                v76.navigate(l_AvatarScreen_0.LookDetails);
                            end));
                        end;
                    end;
                    return v5.resolve();
                else
                    l_Logging_0.warn("Unexpectedly received an empty response from Look Details V2");
                    if v38() then
                        v55(v84, v76, v78, "Unexpectedly received an empty response from Look Details V2");
                        return;
                    else
                        v84:dispatch(v27({
                            isLocalized = false, 
                            toastType = v18.NetworkingError, 
                            toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong"
                        }));
                        return;
                    end;
                end;
            end):catch(function(v113) --[[ Line: 389 ]]
                -- upvalues: l_Logging_0 (ref), v38 (ref), v55 (ref), v84 (copy), v76 (ref), v78 (ref), v27 (ref), v18 (ref), v5 (ref)
                l_Logging_0.warn("Failed to fetch Look Details V2");
                if v38() then
                    v55(v84, v76, v78, "Failed to fetch Look Details V2 with lookId: ");
                else
                    v84:dispatch(v27({
                        isLocalized = false, 
                        toastType = v18.NetworkingError, 
                        toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong"
                    }));
                end;
                return v5.reject(v113);
            end);
        end)(v81);
    end;
end;