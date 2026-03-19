local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_Parent_0.Constants);
local v6 = require(l_Parent_0.Components.AvatarViewport);
local v7 = require(l_Parent_0.Thunks.GetHumanoidDescriptionFromCostumeId);
local v8 = require(l_Parent_0.Flags.GetFFlagDisplayCollectiblesIcon);
local v9 = v3.PureComponent:extend("TryOnViewport");
local function _(v10) --[[ Line: 14 ]] --[[ Name: isPartOfBundleAndOffsale ]]
    return if v10 then v10.parentBundleId ~= nil and (not v10.isForSale or false) else false;
end;
local function _(v12, v13) --[[ Line: 18 ]] --[[ Name: createDefaultHumanoidDescriptionAccessoryInfo ]]
    -- upvalues: v5 (copy)
    return {
        AssetId = tonumber(v13), 
        Order = v5.LayeredClothingOrder[v12], 
        AccessoryType = v5.AssetTypeIdToAccessoryTypeEnum[v12], 
        IsLayered = v5.LayeredAssetTypes[v12] ~= nil
    };
end;
v9.init = function(v15) --[[ Line: 27 ]] --[[ Name: init ]]
    v15.model = v15.props.localPlayerModel;
    v15.model.HumanoidRootPart.Anchored = true;
    v15.humanoidDescriptions = {};
    v15.humanoidDescriptionForLocalPlayer = v15.model.Humanoid.HumanoidDescription;
    v15.state = {
        obtainedHumanoidDescriptions = {}
    };
end;
v9.didMount = function(v16) --[[ Line: 37 ]] --[[ Name: didMount ]]
    v16.isMounted = true;
end;
v9.didUpdate = function(v17, v18) --[[ Line: 41 ]] --[[ Name: didUpdate ]]
    -- upvalues: v1 (copy)
    local l_assetInfo_0 = v17.props.assetInfo;
    local l_bundles_0 = v17.props.bundles;
    local l_tryingOnInfo_0 = v17.props.tryingOnInfo;
    if l_tryingOnInfo_0 ~= v18.tryingOnInfo and l_tryingOnInfo_0.tryingOn and if l_assetInfo_0 then l_assetInfo_0.parentBundleId ~= nil and (not l_assetInfo_0.isForSale or false) else false then
        local l_costumeId_0 = l_bundles_0[l_assetInfo_0.parentBundleId].costumeId;
        if l_costumeId_0 then
            v17.props.getHumanoidDescriptionFromCostumeId(l_costumeId_0, function(v23) --[[ Line: 53 ]]
                -- upvalues: v17 (copy), l_costumeId_0 (copy), v1 (ref)
                if v17 and v17.isMounted then
                    v17.humanoidDescriptions[l_costumeId_0] = v23;
                    v17:setState({
                        obtainedHumanoidDescriptions = v1.Dictionary.join(v17.state.obtainedHumanoidDescriptions, {
                            [l_costumeId_0] = true
                        })
                    });
                end;
            end);
        end;
    end;
end;
v9.tryOnBundleWithoutCostumeId = function(v24, v25, v26) --[[ Line: 72 ]] --[[ Name: tryOnBundleWithoutCostumeId ]]
    -- upvalues: v5 (copy)
    local v27 = {};
    local v28 = {};
    local v29 = false;
    for _, v31 in pairs(v24.props.bundles[v25].assetIds) do
        local v32 = v24.props.assets[v31];
        local v33 = v5.AssetTypeIdToAccessoryTypeEnum[v32.assetTypeId];
        if v33 then
            v27[v33] = true;
            local v34 = v5.AssetTypeToAssetCategory[v32.assetTypeId];
            if v34 then
                v28[v34] = true;
            end;
            v29 = true;
        end;
    end;
    local l_v26_Accessories_0 = v26:GetAccessories(true);
    local v36 = {};
    if v29 then
        for _, v38 in pairs(l_v26_Accessories_0) do
            local v39 = v5.AccessoryTypeEnumToAssetTypeId[v38.AccessoryType];
            local v40 = v5.AssetTypeToAssetCategory[v39];
            local v41 = not v40 or not v28[v40];
            if not v27[v38.AccessoryType] and v41 then
                table.insert(v36, v38);
            end;
        end;
    end;
    for _, v43 in pairs(v24.props.bundles[v25].assetIds) do
        local v44 = v24.props.assets[v43];
        if v5.AssetTypeIdToAccessoryTypeEnum[v44.assetTypeId] then
            local l_assetTypeId_0 = v44.assetTypeId;
            table.insert(v36, {
                AssetId = tonumber(v43), 
                Order = v5.LayeredClothingOrder[l_assetTypeId_0], 
                AccessoryType = v5.AssetTypeIdToAccessoryTypeEnum[l_assetTypeId_0], 
                IsLayered = v5.LayeredAssetTypes[l_assetTypeId_0] ~= nil
            });
        else
            v26[v5.AssetTypeIdStringToHumanoidDescriptionProp[v44.assetTypeId]] = v43;
        end;
    end;
    if v29 then
        v26:SetAccessories(v36, true);
    end;
    return v26;
end;
v9.render = function(v46) --[[ Line: 126 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v3 (copy), v8 (copy), v6 (copy)
    local l_assetInfo_1 = v46.props.assetInfo;
    local l_bundles_1 = v46.props.bundles;
    local l_tryingOnInfo_1 = v46.props.tryingOnInfo;
    local v50 = v46.humanoidDescriptionForLocalPlayer:Clone();
    local l_tryingOn_0 = l_tryingOnInfo_1.tryingOn;
    local l_setScrollingEnabled_0 = v46.props.setScrollingEnabled;
    if l_tryingOnInfo_1 and l_tryingOnInfo_1.tryingOn then
        if if l_assetInfo_1 then l_assetInfo_1.parentBundleId ~= nil and (not l_assetInfo_1.isForSale or false) else false then
            local l_parentBundleId_0 = l_assetInfo_1.parentBundleId;
            local l_costumeId_1 = l_bundles_1[l_parentBundleId_0].costumeId;
            if l_costumeId_1 then
                local v55 = v46.humanoidDescriptions[l_costumeId_1];
                l_tryingOn_0 = v46.state.obtainedHumanoidDescriptions[l_costumeId_1] == true;
                if v55 then
                    for v56, v57 in pairs(v5.AssetTypeIdStringToHumanoidDescriptionProp) do
                        if v5.AssetTypeIdToAccessoryTypeEnum[v56] == nil and tonumber(v55[v57]) and tostring(v55[v57]) ~= "0" then
                            v50[v57] = v55[v57];
                        end;
                    end;
                    v50:SetAccessories(v55:GetAccessories(true), true);
                end;
            else
                v50 = v46:tryOnBundleWithoutCostumeId(l_parentBundleId_0, v50);
            end;
        elseif v5.AssetTypeIdToAccessoryTypeEnum[l_tryingOnInfo_1.assetTypeId] then
            local v58 = v5.AssetTypeIdToAccessoryTypeEnum[l_tryingOnInfo_1.assetTypeId];
            local l_v50_Accessories_0 = v50:GetAccessories(true);
            local v60 = {};
            for _, v62 in pairs(l_v50_Accessories_0) do
                local v63 = v5.AccessoryTypeEnumToAssetTypeId[v62.AccessoryType];
                local v64 = v5.AssetTypeToAssetCategory[l_tryingOnInfo_1.assetTypeId];
                local v65 = v5.AssetTypeToAssetCategory[v63];
                local v66 = not v64 or v65 ~= v64;
                if v62.AccessoryType ~= v58 and v66 then
                    table.insert(v60, v62);
                end;
            end;
            local l_assetTypeId_1 = l_tryingOnInfo_1.assetTypeId;
            table.insert(v60, {
                AssetId = tonumber(l_tryingOnInfo_1.assetId), 
                Order = v5.LayeredClothingOrder[l_assetTypeId_1], 
                AccessoryType = v5.AssetTypeIdToAccessoryTypeEnum[l_assetTypeId_1], 
                IsLayered = v5.LayeredAssetTypes[l_assetTypeId_1] ~= nil
            });
            v50:SetAccessories(v60, true);
        else
            v50[v5.AssetTypeIdStringToHumanoidDescriptionProp[l_tryingOnInfo_1.assetTypeId]] = l_tryingOnInfo_1.assetId;
        end;
    end;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v8() and v5.DetailsThumbnailFrameHeight or 300), 
        LayoutOrder = 2, 
        Visible = l_tryingOn_0
    }, {
        AvatarViewport = v3.createElement(v6, {
            size = UDim2.new(0.75, 0, 1, 0), 
            position = UDim2.new(0.5, 0, 0.5, 0), 
            humanoidDescription = v50, 
            model = v46.model, 
            visible = true, 
            backgroundTransparency = 1, 
            setScrollingEnabled = l_setScrollingEnabled_0
        })
    });
end;
v9.willUnmount = function(v68) --[[ Line: 214 ]] --[[ Name: willUnmount ]]
    v68.isMounted = false;
end;
return v4.UNSTABLE_connect2(function(v69, _) --[[ Line: 218 ]]
    local l_assetId_0 = v69.detailsInformation.assetId;
    return {
        assets = v69.assets, 
        assetInfo = v69.assets[l_assetId_0], 
        bundles = v69.bundles, 
        tryingOnInfo = v69.tryingOnInfo
    };
end, function(v72) --[[ Line: 227 ]]
    -- upvalues: v7 (copy)
    return {
        getHumanoidDescriptionFromCostumeId = function(v73, v74) --[[ Line: 229 ]] --[[ Name: getHumanoidDescriptionFromCostumeId ]]
            -- upvalues: v72 (copy), v7 (ref)
            return v72(v7(v73, v74));
        end
    };
end)(v9);