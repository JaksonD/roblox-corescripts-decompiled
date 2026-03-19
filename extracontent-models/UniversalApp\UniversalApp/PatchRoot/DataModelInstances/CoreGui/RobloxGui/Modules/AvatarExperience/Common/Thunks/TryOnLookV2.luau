local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v5 = require(l_Modules_0.LuaApp.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v9 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v11 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v13 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v14 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v15 = require(l_Modules_0.LuaApp.mutedError);
local v16 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v17 = require(l_Modules_0.AvatarExperience.Common.Models.ModelsUtils);
local v18 = require(l_Modules_0.AvatarExperience.Common.Util.AvatarWidgetBlockyUtils);
local v19 = require(l_Modules_0.AvatarExperience.Common.Actions.AddLookDetails);
local v20 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v21 = require(l_Modules_0.AvatarExperience.Common.Actions.TryOnLooksOutfit);
local v22 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v23 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppLocales).Localization;
local v25 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetLookDetailsPeekViewSelectedTab);
local v26 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local v27 = require(l_Modules_0.AvatarExperience.Common.Actions.SetFullView);
local v28 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v29 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfoBatched);
local v30 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v31 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v32 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableLookFavoriting);
local l_FFlagAXMISEnableMultiShopping_0 = v3.FFlagAXMISEnableMultiShopping;
local v34 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLookDetailsDeepLink);
local l_FFlagAXDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupport;
local v36 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixDeepLinkRelatedIssues);
local v37 = game:DefineFastFlag("RemoveTryOnLookV2MutedError", false);
local l_FFlagParseHeadShapeFromAPIResponse_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagParseHeadShapeFromAPIResponse;
local l_FFlagAXCatalogMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport;
local function _(v40) --[[ Line: 58 ]] --[[ Name: keyMapper ]]
    -- upvalues: v9 (copy)
    return v9.FetchLookDetailInfoKey .. v40;
end;
local function v46(v42, v43) --[[ Line: 62 ]] --[[ Name: translateString ]]
    -- upvalues: l_LocalizationService_0 (copy), l_Localization_0 (copy)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v45 = l_Localization_0.new(l_RobloxLocaleId_0);
    v45:SetLocale(l_RobloxLocaleId_0);
    return v45:Format(v42, v43);
end;
local function v51(v47, v48, v49, v50) --[[ Line: 70 ]] --[[ Name: handleErrorCases ]]
    -- upvalues: v37 (copy), v15 (copy), v26 (copy), v30 (copy), v31 (copy), v23 (copy), v16 (copy)
    if not v37 then
        v15(tostring(v50) .. tostring(v49));
    end;
    v47:dispatch(v26());
    if v48 ~= nil then
        v47:dispatch(v30(function() --[[ Line: 77 ]]
            -- upvalues: v31 (ref), v48 (copy)
            v31.closeTryOnManager(v48);
        end));
    end;
    v47:dispatch(v23({
        isLocalized = false, 
        toastType = v16.NetworkingError, 
        toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong"
    }));
end;
local function v54(v52) --[[ Line: 88 ]] --[[ Name: processAssetItem ]]
    -- upvalues: v14 (copy), v13 (copy)
    local v53 = false;
    if v52.id ~= nil then
        v53 = v52.assetType ~= nil;
    end;
    assert(v53, "Asset is missing required fields");
    return {
        itemId = v52.id, 
        itemType = v14.ContentType.Asset, 
        itemSubType = tostring(v52.assetType), 
        tryOnItemOrder = v52.tryOnItemOrder, 
        isNotSelectable = not v13.isItemSelectable(v52), 
        order = if v52.meta then v52.meta.order else nil
    };
end;
local function v57(v55) --[[ Line: 101 ]] --[[ Name: processAssetItemInBundle ]]
    -- upvalues: v14 (copy), l_FFlagParseHeadShapeFromAPIResponse_0 (copy)
    local v56 = false;
    if v55.id ~= nil then
        v56 = v55.assetType ~= nil;
    end;
    assert(v56, "Asset is missing required fields");
    return {
        itemId = tostring(v55.id), 
        itemType = v14.ContentType.Asset, 
        itemSubType = tostring(v55.assetType), 
        tryOnItemOrder = v55.tryOnItemOrder, 
        headShape = if l_FFlagParseHeadShapeFromAPIResponse_0 and v55.meta then v55.meta.headShape else nil
    };
end;
local function v63(v58) --[[ Line: 115 ]] --[[ Name: processBundleItem ]]
    -- upvalues: v57 (copy), v14 (copy), v13 (copy)
    local v59 = false;
    if v58.id ~= nil then
        v59 = v58.bundleType ~= nil;
    end;
    assert(v59, "Bundle is missing required fields");
    local v60 = 0;
    v59 = {};
    for v61, v62 in v58.assetsInBundle do
        if v62.isIncluded then
            v62.tryOnItemOrder = v61;
            v60 = v60 + 1;
            table.insert(v59, (v57(v62)));
        end;
    end;
    return {
        itemId = v58.id, 
        itemType = v14.ContentType.Bundle, 
        itemSubType = tostring(v58.bundleType), 
        items = v59, 
        numberOfAssetsIncluded = if v60 > 0 then v60 else nil, 
        tryOnItemOrder = v58.tryOnItemOrder, 
        isNotSelectable = not v13.isItemSelectable(v58)
    };
end;
local v64 = nil;
v64 = v32() and function(v65, v66) --[[ Line: 141 ]]
    -- upvalues: v10 (copy), v5 (copy)
    local v67 = {
        v10.GetLookDetailsV2(v65, v66), 
        (v10.HasFavoritedLook(v65, v66))
    };
    return v5.allSettled(v67):andThen(function(v68) --[[ Line: 148 ]]
        -- upvalues: v5 (ref), v67 (copy), v66 (copy)
        if v68[1] ~= v5.Status.Resolved then
            return v5.reject("Failed to fetch look details");
        else
            local v69 = v67[1]:expect();
            local v70 = false;
            if v68[2] == v5.Status.Resolved then
                v70 = v67[2]:expect().responseBody.isFavorited;
            else
                warn("HasFavoritedLook API call failed for lookId:", v66);
            end;
            if v69.responseBody.look then
                v69.responseBody.look.isFavorited = v70;
            end;
            return v69;
        end;
    end);
end or v10.GetLookDetailsV2;
return function(v71, v72, v73, v74, v75, v76) --[[ Line: 176 ]]
    -- upvalues: v36 (copy), v27 (copy), l_AvatarScreen_0 (copy), v28 (copy), v25 (copy), l_PerformFetch_0 (copy), v9 (copy), v64 (ref), l_FFlagAXCatalogMakeupSupport_0 (copy), v11 (copy), v17 (copy), v14 (copy), l_FFlagAXDurablesSupport_0 (copy), v18 (copy), v46 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v29 (copy), v19 (copy), v32 (copy), v54 (copy), v63 (copy), v34 (copy), v20 (copy), l_PeekViewState_0 (copy), v13 (copy), v22 (copy), v21 (copy), v30 (copy), v31 (copy), v5 (copy), l_Logging_0 (copy), v51 (copy), v23 (copy), v16 (copy)
    return function(v77) --[[ Line: 184 ]]
        -- upvalues: v36 (ref), v27 (ref), l_AvatarScreen_0 (ref), v28 (ref), v76 (copy), v25 (ref), l_PerformFetch_0 (ref), v74 (copy), v9 (ref), v64 (ref), v71 (copy), l_FFlagAXCatalogMakeupSupport_0 (ref), v11 (ref), v17 (ref), v14 (ref), l_FFlagAXDurablesSupport_0 (ref), v18 (ref), v46 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v29 (ref), v73 (copy), v19 (ref), v32 (ref), v54 (ref), v63 (ref), v34 (ref), v75 (copy), v20 (ref), l_PeekViewState_0 (ref), v13 (ref), v22 (ref), v21 (ref), v72 (copy), v30 (ref), v31 (ref), v5 (ref), l_Logging_0 (ref), v51 (ref), v23 (ref), v16 (ref)
        if v36() then
            v77:dispatch(v27(l_AvatarScreen_0.Catalog, v28.None));
        end;
        if v76 then
            v77:dispatch(v25(v76));
        end;
        local l_Single_0 = l_PerformFetch_0.Single;
        local l_v74_0 = v74;
        return l_Single_0(v9.FetchLookDetailInfoKey .. l_v74_0, function(v80) --[[ Line: 192 ]]
            -- upvalues: v64 (ref), v71 (ref), v74 (ref), l_FFlagAXCatalogMakeupSupport_0 (ref), v11 (ref), v17 (ref), v14 (ref), l_FFlagAXDurablesSupport_0 (ref), v18 (ref), v46 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v29 (ref), v73 (ref), v19 (ref), v32 (ref), v54 (ref), v63 (ref), v34 (ref), v75 (ref), v20 (ref), l_PeekViewState_0 (ref), v13 (ref), v22 (ref), v21 (ref), v72 (ref), v30 (ref), v31 (ref), l_AvatarScreen_0 (ref), v5 (ref), l_Logging_0 (ref), v36 (ref), v51 (ref), v23 (ref), v16 (ref)
            return v64(v71, v74):andThen(function(v81) --[[ Line: 193 ]]
                -- upvalues: l_FFlagAXCatalogMakeupSupport_0 (ref), v11 (ref), v17 (ref), v14 (ref), l_FFlagAXDurablesSupport_0 (ref), v18 (ref), v46 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v80 (copy), v29 (ref), v71 (ref), v73 (ref), v19 (ref), v74 (ref), v32 (ref), v54 (ref), v63 (ref), v34 (ref), v75 (ref), v20 (ref), l_PeekViewState_0 (ref), v13 (ref), v22 (ref), v21 (ref), v72 (ref), v30 (ref), v31 (ref), l_AvatarScreen_0 (ref), v5 (ref), l_Logging_0 (ref), v36 (ref), v51 (ref), v23 (ref), v16 (ref)
                local l_look_0 = v81.responseBody.look;
                if l_look_0 then
                    local v83 = if l_FFlagAXCatalogMakeupSupport_0 then l_look_0.lookType == v11.LookType.Makeup else nil;
                    local v84 = {};
                    local v85 = {};
                    for v86, v87 in l_look_0.items do
                        v87.id = tostring(v87.id);
                        local _, v89 = v17.CreateRestrictionInfo(v87.itemRestrictions);
                        v87.itemRestrictionsMap = v89;
                        v87.tryOnItemOrder = v86;
                        if v87.itemType == v14.ContentType.Asset then
                            if l_FFlagAXDurablesSupport_0 and v87.timedOptions then
                                table.insert(v87.timedOptions, {
                                    days = 0, 
                                    price = v87.priceInRobux, 
                                    selected = true
                                });
                            end;
                            table.insert(v84, v87);
                        elseif v87.itemType == v14.ContentType.Bundle then
                            table.insert(v85, v87);
                        else
                            warn("TryOnLookV2 - Unknown item type: " .. v87.itemType);
                        end;
                    end;
                    local v90 = if l_FFlagAXCatalogMakeupSupport_0 and v83 then nil else v18.buildBlockyLookDetailItem(v85, v46);
                    if v90 then
                        table.insert(v85, v90);
                        v18.adjustTryOnItemOrderForBlockyBundle(v84, v85, l_look_0.items);
                    end;
                    if l_FFlagAXMISEnableMultiShopping_0 then
                        local v91 = table.clone(l_look_0.items);
                        if v90 then
                            table.insert(v91, v90);
                        end;
                        v80:dispatch(v29(v71, v73, v91));
                    end;
                    v80:dispatch(v19(v74, l_look_0.totalPrice, nil, v84, v85, l_look_0.lookType, l_look_0.totalValue, l_look_0.curator, l_look_0.description, l_look_0.moderationStatus, l_look_0.name, l_look_0.displayProperties, if v32() then l_look_0.favoriteCount else nil, if v32() then l_look_0.isFavorited else nil));
                    local v92 = {};
                    for _, v94 in v84 do
                        table.insert(v92, (v54(v94)));
                    end;
                    local v95 = {};
                    for _, v97 in v85 do
                        table.insert(v95, (v63(v97)));
                    end;
                    if v34 then
                        if l_FFlagAXMISEnableMultiShopping_0 then
                            if v75 then
                                v80:dispatch(v20(v75));
                            end;
                        else
                            v80:dispatch(v20(if v75 then v75 else l_PeekViewState_0.SuperBrief));
                        end;
                    else
                        v80:dispatch(v20(l_PeekViewState_0.SuperBrief));
                    end;
                    local v98 = if not (l_FFlagAXCatalogMakeupSupport_0 and v83) and l_look_0.avatarProperties then v13.convertBodyColor3HexesToColor3s(l_look_0.avatarProperties.bodyColor3s) else nil;
                    local v99 = nil;
                    if v98 then
                        v99 = {};
                        local l_DefaultBodyColorRanges_0 = v80:getState().AvatarExperience.AvatarEditor.DefaultBodyColorRanges;
                        for v101, v102 in v98 do
                            local v103, _ = v22.findRangeAndSliderValueForColor3(v102, l_DefaultBodyColorRanges_0);
                            v99[v101] = v103;
                        end;
                    end;
                    local v105 = nil;
                    if (not l_FFlagAXCatalogMakeupSupport_0 or not v83) and l_look_0.avatarProperties then
                        v105 = l_look_0.avatarProperties.scale;
                    end;
                    v80:dispatch(v21({
                        assetItemIdTypeAndSubtype = v92, 
                        bundleItemIdTypeAndSubtype = v95, 
                        lookId = v74, 
                        analyticsInfo = v73, 
                        lookType = l_look_0.lookType, 
                        bodyColor3s = v98, 
                        bodyPartColorRangeIds = v99, 
                        scale = v105
                    }));
                    if v72 ~= nil then
                        v80:dispatch(v30(function() --[[ Line: 333 ]]
                            -- upvalues: v31 (ref), v72 (ref), l_AvatarScreen_0 (ref)
                            v31.closeFiltersAndItemDetails(v72);
                            v31.closeTryOnManager(v72, {
                                l_AvatarScreen_0.TryOnManager
                            });
                            v72.navigate(l_AvatarScreen_0.LookDetails);
                        end));
                    end;
                    return v5.resolve();
                else
                    l_Logging_0.warn("Unexpectedly received an empty response from Look Details V2");
                    if v36() then
                        v51(v80, v72, v74, "Unexpectedly received an empty response from Look Details V2");
                        return;
                    else
                        v80:dispatch(v23({
                            isLocalized = false, 
                            toastType = v16.NetworkingError, 
                            toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong"
                        }));
                        return;
                    end;
                end;
            end):catch(function(v106) --[[ Line: 357 ]]
                -- upvalues: l_Logging_0 (ref), v36 (ref), v51 (ref), v80 (copy), v72 (ref), v74 (ref), v23 (ref), v16 (ref), v5 (ref)
                l_Logging_0.warn("Failed to fetch Look Details V2");
                if v36() then
                    v51(v80, v72, v74, "Failed to fetch Look Details V2 with lookId: ");
                else
                    v80:dispatch(v23({
                        isLocalized = false, 
                        toastType = v16.NetworkingError, 
                        toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong"
                    }));
                end;
                return v5.reject(v106);
            end);
        end)(v77);
    end;
end;