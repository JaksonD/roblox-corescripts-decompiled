local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.tutils);
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v5 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v7 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v8 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectItemPromptType);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.OpenPurchasePrompt);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.OpenPremiumUpsellPrompt);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.OpenGoToAvatarEditorPrompt);
local v12 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v13 = require(l_Modules_0.LuaApp.Thunks.ApiFetchEconomyCurrency);
local v14 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagCollectiblesCatalogFollowUpForSaleLocation);
local l_FFlagAXDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupport;
local l_FFlagPurchasePromptSubtitleForTimedOptions_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagPurchasePromptSubtitleForTimedOptions;
local v17 = {
    toastMessage = "Feature.Catalog.LabelNoResellers", 
    toastSubMessage = "Feature.Catalog.Label.NoSellersWarning", 
    isLocalized = false, 
    toastType = v7.SuccessConfirmation
};
local v18 = {
    toastMessage = "Feature.Catalog.Heading.NotForSale", 
    toastSubMessage = "Feature.Catalog.Label.NoLongerAvailable", 
    isLocalized = false, 
    toastType = v7.SuccessConfirmation
};
local v19 = {
    toastMessage = "Feature.Catalog.Heading.InExperienceOnly", 
    toastSubMessage = "Feature.Catalog.Label.InExperienceOnly", 
    isLocalized = false, 
    toastType = v7.SuccessConfirmation
};
local v20 = {
    toastMessage = "Feature.Catalog.Heading.QuantityLimitReached", 
    toastSubMessage = "Feature.Catalog.Label.QuantityLimitReached", 
    isLocalized = false, 
    toastType = v7.SuccessConfirmation
};
local function _(v21, v22, v23) --[[ Line: 57 ]] --[[ Name: fetchRobuxBalance ]]
    -- upvalues: v13 (copy)
    local l_LocalUserId_0 = v22.LocalUserId;
    if typeof(l_LocalUserId_0) == "string" and l_LocalUserId_0 ~= "" then
        v21:dispatch(v13(v23, l_LocalUserId_0, false));
    end;
end;
local function v42(v26, v27, v28, v29) --[[ Line: 65 ]] --[[ Name: clickDisabledButton ]]
    -- upvalues: v6 (copy), v13 (copy), v14 (copy), v12 (copy), v19 (copy), v18 (copy), v20 (copy), v17 (copy)
    local v30 = v28 and v28.resellerUserAssetIds;
    local v31 = v6.IsResellable(v28);
    local v32 = v28 and v28.collectibleItemId;
    local v33 = v30 and v30[1];
    local v34 = v27.AvatarExperience.Catalog.UserAssets[v33];
    local v35 = v31 and v34 == nil;
    if v27.UserRobux[v27.LocalUserId] == nil then
        local l_LocalUserId_1 = v27.LocalUserId;
        if typeof(l_LocalUserId_1) == "string" and l_LocalUserId_1 ~= "" then
            v26:dispatch(v13(v29, l_LocalUserId_1, false));
        end;
        return;
    else
        local v37 = false;
        if v32 then
            local v38 = v27.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v32];
            v37 = not v6.isOriginalStockSellableInShop(v38);
            v35 = not v38 or not v38.hasResellers;
        end;
        local v39 = false;
        if v32 then
            local v40 = v27.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v32];
            local v41 = v27.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[v32];
            v35 = not v40 or not v40.hasResellers;
            v39 = v35 and v6.reachQuantityLimit(v40, v41);
        end;
        if v37 then
            if v14() then
                return v26:dispatch(v12(v19));
            else
                return v26:dispatch(v12(v18));
            end;
        elseif v39 then
            return v26:dispatch(v12(v20));
        elseif v31 and v35 then
            return v26:dispatch(v12(v17));
        else
            return v26:dispatch(v12(v18));
        end;
    end;
end;
return function(v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53) --[[ Line: 130 ]]
    -- upvalues: v8 (copy), v3 (copy), v4 (copy), v9 (copy), l_FFlagAXDurablesSupport_0 (copy), l_FFlagPurchasePromptSubtitleForTimedOptions_0 (copy), v11 (copy), v10 (copy), v5 (copy), v42 (copy)
    return function(v54) --[[ Line: 143 ]]
        -- upvalues: v48 (copy), v49 (copy), v47 (copy), v8 (ref), v3 (ref), v4 (ref), v9 (ref), v43 (copy), v45 (copy), v46 (copy), v44 (copy), v50 (copy), v51 (copy), l_FFlagAXDurablesSupport_0 (ref), v52 (copy), l_FFlagPurchasePromptSubtitleForTimedOptions_0 (ref), v53 (copy), v11 (ref), v10 (ref), v5 (ref), v42 (ref)
        local v55 = v54:getState();
        local v56 = nil;
        local v57 = nil;
        if v48 and v49 then
            v56 = v48;
            v57 = v49;
        else
            v56 = v47.current.params.itemId;
            v57 = v47.current.params.itemType;
        end;
        local v58 = v8(v55, v56, v57, {});
        local l_fromContentFeed_0 = v47.current.params.fromContentFeed;
        local l_fromProfile_0 = v47.current.params.fromProfile;
        local l_widgetInfo_0 = v47.current.params.widgetInfo;
        if not l_widgetInfo_0 then
            local l_TryOnItems_0 = v55.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
            if v3.fieldCount(l_TryOnItems_0) == 1 then
                local _, v64 = next(l_TryOnItems_0);
                l_widgetInfo_0 = v64.widgetInfo;
            end;
        end;
        if v58 == v4.ItemPromptType.OpenPurchasePrompt then
            v54:dispatch(v9(v43, v45, v46, v44, l_fromProfile_0, v47, v56, v57, v50, v51, l_widgetInfo_0, l_fromContentFeed_0, if l_FFlagAXDurablesSupport_0 then v52 else nil, if l_FFlagAXDurablesSupport_0 and l_FFlagPurchasePromptSubtitleForTimedOptions_0 then v53 else nil));
            return;
        elseif v58 == v4.ItemPromptType.OpenGoToAvatarEditorPrompt then
            v54:dispatch(v11(v45, v46, v47, v56, v57));
            return;
        elseif v58 == v4.ItemPromptType.OpenPremiumUpsellPrompt then
            v54:dispatch(v10(v43, v44, v45, v46, nil, v56, v57));
            return;
        else
            if v58 == v4.ItemPromptType.Disabled then
                local v65 = v5(v55.AvatarExperience.Common, v56, v57);
                v42(v54, v55, v65, v43);
            end;
            return;
        end;
    end;
end;