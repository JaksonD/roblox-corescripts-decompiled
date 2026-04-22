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
local l_FFlagPurchasePromptSubtitleForTimedOptions_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagPurchasePromptSubtitleForTimedOptions;
local v16 = {
    toastMessage = "Feature.Catalog.LabelNoResellers", 
    toastSubMessage = "Feature.Catalog.Label.NoSellersWarning", 
    isLocalized = false, 
    toastType = v7.SuccessConfirmation
};
local v17 = {
    toastMessage = "Feature.Catalog.Heading.NotForSale", 
    toastSubMessage = "Feature.Catalog.Label.NoLongerAvailable", 
    isLocalized = false, 
    toastType = v7.SuccessConfirmation
};
local v18 = {
    toastMessage = "Feature.Catalog.Heading.InExperienceOnly", 
    toastSubMessage = "Feature.Catalog.Label.InExperienceOnly", 
    isLocalized = false, 
    toastType = v7.SuccessConfirmation
};
local v19 = {
    toastMessage = "Feature.Catalog.Heading.QuantityLimitReached", 
    toastSubMessage = "Feature.Catalog.Label.QuantityLimitReached", 
    isLocalized = false, 
    toastType = v7.SuccessConfirmation
};
local function _(v20, v21, v22) --[[ Line: 56 ]] --[[ Name: fetchRobuxBalance ]]
    -- upvalues: v13 (copy)
    local l_LocalUserId_0 = v21.LocalUserId;
    if typeof(l_LocalUserId_0) == "string" and l_LocalUserId_0 ~= "" then
        v20:dispatch(v13(v22, l_LocalUserId_0, false));
    end;
end;
local function v41(v25, v26, v27, v28) --[[ Line: 64 ]] --[[ Name: clickDisabledButton ]]
    -- upvalues: v6 (copy), v13 (copy), v14 (copy), v12 (copy), v18 (copy), v17 (copy), v19 (copy), v16 (copy)
    local v29 = v27 and v27.resellerUserAssetIds;
    local v30 = v6.IsResellable(v27);
    local v31 = v27 and v27.collectibleItemId;
    local v32 = v29 and v29[1];
    local v33 = v26.AvatarExperience.Catalog.UserAssets[v32];
    local v34 = v30 and v33 == nil;
    if v26.UserRobux[v26.LocalUserId] == nil then
        local l_LocalUserId_1 = v26.LocalUserId;
        if typeof(l_LocalUserId_1) == "string" and l_LocalUserId_1 ~= "" then
            v25:dispatch(v13(v28, l_LocalUserId_1, false));
        end;
        return;
    else
        local v36 = false;
        if v31 then
            local v37 = v26.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v31];
            v36 = not v6.isOriginalStockSellableInShop(v37);
            v34 = not v37 or not v37.hasResellers;
        end;
        local v38 = false;
        if v31 then
            local v39 = v26.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v31];
            local v40 = v26.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[v31];
            v34 = not v39 or not v39.hasResellers;
            v38 = v34 and v6.reachQuantityLimit(v39, v40);
        end;
        if v36 then
            if v14() then
                return v25:dispatch(v12(v18));
            else
                return v25:dispatch(v12(v17));
            end;
        elseif v38 then
            return v25:dispatch(v12(v19));
        elseif v30 and v34 then
            return v25:dispatch(v12(v16));
        else
            return v25:dispatch(v12(v17));
        end;
    end;
end;
return function(v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52) --[[ Line: 129 ]]
    -- upvalues: v8 (copy), v3 (copy), v4 (copy), v9 (copy), l_FFlagPurchasePromptSubtitleForTimedOptions_0 (copy), v11 (copy), v10 (copy), v5 (copy), v41 (copy)
    return function(v53) --[[ Line: 142 ]]
        -- upvalues: v47 (copy), v48 (copy), v46 (copy), v8 (ref), v3 (ref), v4 (ref), v9 (ref), v42 (copy), v44 (copy), v45 (copy), v43 (copy), v49 (copy), v50 (copy), v51 (copy), l_FFlagPurchasePromptSubtitleForTimedOptions_0 (ref), v52 (copy), v11 (ref), v10 (ref), v5 (ref), v41 (ref)
        local v54 = v53:getState();
        local v55 = nil;
        local v56 = nil;
        if v47 and v48 then
            v55 = v47;
            v56 = v48;
        else
            v55 = v46.current.params.itemId;
            v56 = v46.current.params.itemType;
        end;
        local v57 = v8(v54, v55, v56, {});
        local l_fromContentFeed_0 = v46.current.params.fromContentFeed;
        local l_fromProfile_0 = v46.current.params.fromProfile;
        local l_widgetInfo_0 = v46.current.params.widgetInfo;
        if not l_widgetInfo_0 then
            local l_TryOnItems_0 = v54.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
            if v3.fieldCount(l_TryOnItems_0) == 1 then
                local _, v63 = next(l_TryOnItems_0);
                l_widgetInfo_0 = v63.widgetInfo;
            end;
        end;
        if v57 == v4.ItemPromptType.OpenPurchasePrompt then
            v53:dispatch(v9(v42, v44, v45, v43, l_fromProfile_0, v46, v55, v56, v49, v50, l_widgetInfo_0, l_fromContentFeed_0, v51, if l_FFlagPurchasePromptSubtitleForTimedOptions_0 then v52 else nil));
            return;
        elseif v57 == v4.ItemPromptType.OpenGoToAvatarEditorPrompt then
            v53:dispatch(v11(v44, v45, v46, v55, v56));
            return;
        elseif v57 == v4.ItemPromptType.OpenPremiumUpsellPrompt then
            v53:dispatch(v10(v42, v43, v44, v45, nil, v55, v56));
            return;
        else
            if v57 == v4.ItemPromptType.Disabled then
                local v64 = v5(v54.AvatarExperience.Common, v55, v56);
                v41(v53, v54, v64, v42);
            end;
            return;
        end;
    end;
end;