local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_Parent_0.Constants);
local v7 = require(l_Parent_0.UtilityFunctions);
local v8 = require(l_Parent_0.Components.FavoritesButton);
local v9 = require(l_Parent_0.Components.TryOnButton);
local v10 = require(l_Parent_0.Components.BuyButton);
local v11 = require(l_Parent_0.Components.InspectAndBuyControllerBar);
local v12 = require(l_Parent_0.Selectors.GetIsFavorite);
local v13 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v14 = require(l_CorePackages_0.Packages.tutils);
local v15 = require(l_Parent_0.Flags.GetFFlagIBGateUGC4ACollectibleAssetsBundles);
local v16 = require(l_Parent_0.Flags.GetFFlagIBEnableCollectiblesSystemSupport);
local v17 = game:DefineFastFlag("IBFixResaleAfterQuantityLimit", false);
local v18 = v4.PureComponent:extend("DetailsButtons");
local function _(v19) --[[ Line: 36 ]] --[[ Name: isAnimationAsset ]]
    -- upvalues: v6 (copy)
    return v6.AnimationAssetTypes[v19] ~= nil;
end;
local function v27(v21, v22, v23, v24) --[[ Line: 40 ]] --[[ Name: getBuyText ]]
    -- upvalues: v16 (copy), v13 (copy), v6 (copy), l_Players_0 (copy)
    local v25 = nil;
    local v26 = v21.isLimited or v16() and v21.isLimitedUnique;
    if v24 then
        return (v13:FormatByKeyForLocale("InGame.InspectMenu.Action.FromResale", v22, {
            PRICE = tostring(v24)
        }));
    elseif v23 and v21.isForSale then
        return (v13:FormatByKeyForLocale("InGame.InspectMenu.Action.LimitReached", v22));
    elseif v21.price ~= nil and v21.productType == v6.ProductType.CollectibleItem and v21.isForSale then
        return v21.price;
    elseif v21.owned then
        return (v13:FormatByKeyForLocale("InGame.InspectMenu.Label.Owned", v22));
    elseif v26 then
        return (v13:FormatByKeyForLocale("InGame.InspectMenu.Label.Limited", v22));
    elseif not v21.isForSale and not v26 then
        return (v13:FormatByKeyForLocale("InGame.InspectMenu.Label.Offsale", v22));
    else
        if v21.isForSale then
            if v21.premiumPricing ~= nil then
                if l_Players_0.LocalPlayer.MembershipType == Enum.MembershipType.Premium then
                    return v21.premiumPricing.premiumPriceInRobux;
                elseif v21.price == nil then
                    return (v13:FormatByKeyForLocale("InGame.InspectMenu.Label.PremiumOnly", v22));
                else
                    return v21.price;
                end;
            else
                v25 = v21.price;
            end;
        end;
        return v25;
    end;
end;
v18.init = function(v28) --[[ Line: 84 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy)
    v28.tryOnButtonRef = v4.createRef();
    v28.buyButtonRef = v4.createRef();
    v28.favoriteButtonRef = v4.createRef();
end;
v18.didUpdate = function(v29, v30) --[[ Line: 90 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_GuiService_0 (copy)
    local l_detailsInformation_0 = v29.props.detailsInformation;
    local l_gamepadEnabled_0 = v29.props.gamepadEnabled;
    if l_detailsInformation_0.viewingDetails then
        local l_visible_0 = v29.props.visible;
        if l_gamepadEnabled_0 and l_visible_0 then
            l_GuiService_0.SelectedCoreObject = v29.favoriteButtonRef.current;
        end;
    elseif v29.props.assetInfo.bundlesAssetIsIn == nil and l_detailsInformation_0.viewingDetails and l_gamepadEnabled_0 then
        l_GuiService_0.SelectedCoreObject = nil;
    end;
    local l_overlay_0 = v29.props.overlay;
    local l_overlay_1 = v30.overlay;
    if l_gamepadEnabled_0 and l_overlay_0 and l_overlay_0.overlay == nil and l_overlay_1 and l_overlay_1.overlay ~= nil then
        l_GuiService_0.SelectedCoreObject = v29.tryOnButtonRef.current;
    end;
end;
v18.calculateBuyStatusForLimitedItem = function(v36, v37, v38, v39) --[[ Line: 114 ]] --[[ Name: calculateBuyStatusForLimitedItem ]]
    -- upvalues: v7 (copy), v14 (copy), v17 (copy), l_Players_0 (copy), v27 (copy), v6 (copy)
    local v40 = v7.isLimited2Point0_Or_LimitedCollectible(v37);
    local v41 = v7.isLimited1Point0(v37) or v7.isLimited1Point0_LimitedUnique(v37);
    local v42 = nil;
    local v43 = nil;
    local v44 = nil;
    local v45 = nil;
    local v46 = nil;
    if v40 then
        v39 = v37.isForSale;
        local l_resellableInstances_0 = v36.props.resellableInstances;
        local v48 = l_resellableInstances_0 and l_resellableInstances_0[v37.collectibleItemId] and v14.fieldCount(l_resellableInstances_0[v37.collectibleItemId]);
        v42 = v48 and v37.collectibleQuantityLimitPerUser ~= nil and v37.collectibleQuantityLimitPerUser > 0 and v37.collectibleQuantityLimitPerUser <= v48;
        local v49 = v37.collectibleLowestAvailableResaleProductId and v37.collectibleLowestAvailableResaleProductId ~= "";
        local v50 = false;
        v50 = if v17 then if v37.remaining > 0 then v49 and (v37.price or 0) > v37.collectibleLowestResalePrice else v49 and v37.collectibleLowestResalePrice else v49 and (v37.price or 0) > v37.collectibleLowestResalePrice;
        if v49 then
            if not v39 or v42 or v50 then
                v43 = v37.collectibleLowestResalePrice;
                v44 = v37.collectibleLowestAvailableResaleItemInstanceId;
                v45 = v37.collectibleLowestAvailableResaleProductId;
                v46 = v37.collectibleItemId;
                v39 = true;
            end;
        elseif v42 then
            v39 = false;
        end;
    else
        v39 = v37.isForSale and not v37.owned and not v41;
    end;
    if v39 and v37.price == nil and v37.premiumPricing ~= nil then
        v39 = l_Players_0.LocalPlayer.MembershipType == Enum.MembershipType.Premium;
    end;
    local v51 = v27(v37, v38, v42, v43);
    local v52 = not (not (v37.price ~= nil) or v37.owned) and v39 or v43 ~= nil or v37.price ~= nil and v37.productType == v6.ProductType.CollectibleItem and v39;
    return {
        buyText = v51, 
        showRobuxIcon = v52, 
        forSale = v39, 
        collectibleQuantityLimitReached = v42, 
        collectibleLowestResalePrice = v43, 
        collectibleLowestAvailableResaleItemInstanceId = v44, 
        collectibleLowestAvailableResaleProductId = v45, 
        collectibleItemId = v46
    };
end;
v18.render = function(v53) --[[ Line: 194 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v6 (copy), v15 (copy), v4 (copy), v11 (copy), v8 (copy), v9 (copy), v10 (copy)
    local l_locale_0 = v53.props.locale;
    local l_assetInfo_0 = v53.props.assetInfo;
    local v56 = false;
    local v57 = false;
    local v58 = nil;
    local v59 = nil;
    local v60 = nil;
    local v61 = nil;
    local v62 = nil;
    local v63 = nil;
    local v64 = nil;
    local v65 = nil;
    local v66 = nil;
    local v67 = nil;
    local v68 = nil;
    if l_assetInfo_0 then
        v60 = l_assetInfo_0.parentBundleId ~= nil;
        v64 = v60 and not l_assetInfo_0.isForSale;
        if v60 then
            v61 = v7.getBundleId(l_assetInfo_0);
            v62 = v6.ItemType.Bundle;
            v63 = v61;
        else
            v62 = v6.ItemType.Asset;
            v63 = l_assetInfo_0.assetId;
        end;
        local v69 = v53:calculateBuyStatusForLimitedItem(l_assetInfo_0, l_locale_0, v59);
        v58 = v69.buyText;
        v56 = v69.showRobuxIcon;
        v59 = v69.forSale;
        local _ = v69.collectibleQuantityLimitReached;
        v66 = v69.collectibleLowestResalePrice;
        v67 = v69.collectibleLowestAvailableResaleProductId;
        v68 = v69.collectibleLowestAvailableResaleItemInstanceId;
        v65 = v69.collectibleItemId;
        local l_assetTypeId_0 = l_assetInfo_0.assetTypeId;
        v57 = not (v6.AnimationAssetTypes[l_assetTypeId_0] ~= nil);
        if v6.AssetTypeIdStringToHumanoidDescriptionProp[l_assetInfo_0.assetTypeId] == nil and v6.AssetTypeIdToAccessoryTypeEnum[l_assetInfo_0.assetTypeId] == nil then
            v57 = false;
        end;
    end;
    local v72 = nil;
    if v15() then
        v72 = v7.isUnlimitedCollectibleAsset(v62, l_assetInfo_0) or v7.isLimitedBundle(v62, l_assetInfo_0) or v7.isUnlimitedCollectibleBundle(v62, l_assetInfo_0);
    end;
    if l_assetInfo_0 then
        v65 = l_assetInfo_0.collectibleItemId;
        local v73 = v53.props.assetBundles[l_assetInfo_0.assetId];
        v72 = v60 and #v73 > 1;
    end;
    local v74 = v53.props.detailsInformation.viewingDetails and v53.props.gamepadEnabled;
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 51), 
        Position = UDim2.new(0, 0, 1, -51)
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            Padding = UDim.new(0, 10), 
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        ControllerBar = v74 and v4.createElement(v11, {
            showTryOn = v57, 
            tryingOn = v53.props.tryingOn, 
            showFavorite = true, 
            isFavorited = v53.props.isFavorited
        }), 
        FavoriteButton = v4.createElement(v8, {
            favoriteButtonRef = v53.favoriteButtonRef
        }), 
        TryOnButton = v4.createElement(v9, {
            showTryOn = v57, 
            assetInfo = l_assetInfo_0, 
            partOfBundleAndOffsale = v64, 
            bundleId = v61, 
            tryOnButtonRef = v53.tryOnButtonRef, 
            localPlayerModel = v53.props.localPlayerModel
        }), 
        TryOnFiller = v4.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0.5, -32, 0, 44), 
            Visible = not v57, 
            LayoutOrder = 2, 
            Image = "", 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(5, 5, 120, 20)
        }), 
        BuyButton = if v15() and v72 then nil else v4.createElement(v10, {
            itemType = v62, 
            itemId = v63, 
            showRobuxIcon = v56, 
            forSale = v59, 
            buyText = v58, 
            buyButtonRef = v53.buyButtonRef, 
            collectibleItemId = v65, 
            collectibleLowestAvailableResaleProductId = v67, 
            collectibleLowestAvailableResaleItemInstanceId = v68, 
            collectibleLowestResalePrice = v66
        })
    });
end;
return v5.UNSTABLE_connect2(function(v75, _) --[[ Line: 321 ]]
    -- upvalues: v12 (copy)
    local l_assetId_0 = v75.detailsInformation.assetId;
    local v78 = v12(v75);
    return {
        visible = v75.visible, 
        assetInfo = v75.assets[l_assetId_0] or {}, 
        assetBundles = v75.assetBundles, 
        detailsInformation = v75.detailsInformation, 
        bundleInfo = v75.bundles, 
        locale = v75.locale, 
        gamepadEnabled = v75.gamepadEnabled, 
        isFavorited = v78, 
        tryingOn = v75.tryingOnInfo.tryingOn, 
        resellableInstances = v75.collectibleResellableInstances, 
        overlay = v75.overlay
    };
end)(v18);