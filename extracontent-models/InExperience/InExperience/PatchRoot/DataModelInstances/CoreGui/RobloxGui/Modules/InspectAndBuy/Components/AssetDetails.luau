local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v7 = require(l_Parent_0.Components.DetailsText);
local v8 = require(l_Parent_0.Components.DetailsThumbnail);
local v9 = require(l_Parent_0.Components.DetailsDescription);
local v10 = require(l_Parent_0.Components.DetailsButtons);
local v11 = require(l_Parent_0.Components.TryOnViewport);
local v12 = require(l_Parent_0.Actions.OpenOverlay);
local v13 = require(l_Parent_0.Enums.Overlay);
local v14 = require(l_Parent_0.Thunks.GetAssetBundles);
local v15 = require(l_Parent_0.Thunks.ReportOpenDetailsPage);
local v16 = require(l_Parent_0.Thunks.GetEconomyProductInfo);
local v17 = require(l_Parent_0.Thunks.GetCollectibleResellableInstances);
local v18 = require(l_Parent_0.Colors);
local v19 = require(l_Parent_0.Constants);
local v20 = require(l_Parent_0.UtilityFunctions);
local v21 = require(l_CorePackages_0.Packages.tutils);
local v22 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v23 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v23.App.ImageSet.Images;
local l_ImageSetLabel_0 = v23.Core.ImageSet.ImageSetLabel;
local l_ItemInfoList_0 = require(l_CorePackages_0.Workspace.Packages.ItemDetails).ItemInfoList;
local v27 = require(l_Parent_0.AttributionConstants);
local v28 = require(l_Parent_0.Components.InspectAndBuyContext);
local v29 = require(l_Parent_0.Flags.GetFFlagDisplayCollectiblesIcon);
local v30 = require(l_Parent_0.Thunks.GetItemDetails);
local v31 = require(l_Parent_0.Actions.SetAssetFromBundleInfo);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v33 = require(l_Modules_0.Settings.Theme);
local l_ControllerBarHeight_0 = require(l_CoreGui_0.RobloxGui.Modules.InGameMenuConstants).ControllerBarHeight;
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local v36 = v4.PureComponent:extend("AssetDetails");
v36.setScrollingEnabled = function(v37, v38) --[[ Line: 48 ]] --[[ Name: setScrollingEnabled ]]
    if v37.state.scrollingEnabled ~= v38 then
        v37:setState({
            scrollingEnabled = v38
        });
    end;
end;
v36.getInfoRowProps = function(v39) --[[ Line: 58 ]] --[[ Name: getInfoRowProps ]]
    -- upvalues: v22 (copy), v27 (copy), v13 (copy), v4 (copy), v19 (copy)
    local v40 = v39.props.assetInfo or {};
    local l_locale_0 = v39.props.locale;
    local v42 = v40.parentBundleId ~= nil;
    local v43 = {
        infoName = v22:FormatByKeyForLocale("Feature.Catalog.Label.Filter.Creator", l_locale_0), 
        infoData = v40.creatorName or "", 
        hasVerifiedBadge = v40.creatorHasVerifiedBadge, 
        LayoutOrder = 1, 
        Selectable = false
    };
    local v44 = nil;
    local l_creatingUniverseId_0 = v40.creatingUniverseId;
    if l_creatingUniverseId_0 then
        local v46 = v39.props.creatingExperiences[l_creatingUniverseId_0];
        if v46 then
            local l_playabilityStatus_0 = v46.playabilityStatus;
            if v27.ShowPlayableAttributionMapper[l_playabilityStatus_0] then
                local v48 = v46.name or "";
                local l_v46_0 = v46 --[[ copy: 7 -> 11 ]];
                v44 = {
                    infoName = v22:FormatByKeyForLocale("Feature.Catalog.Label.Attribution", l_locale_0), 
                    infoData = v48, 
                    onActivate = function() --[[ Line: 91 ]] --[[ Name: onActivate ]]
                        -- upvalues: v39 (copy), v13 (ref), l_v46_0 (copy)
                        v39.props.openOverlay(v13.AttributionTraversal, l_v46_0);
                    end, 
                    LayoutOrder = 2, 
                    [v4.Ref] = v39.attributionRef, 
                    Selectable = true
                };
            end;
        end;
    end;
    local v50 = nil;
    if v42 then
        v50 = v22:FormatByKeyForLocale("Feature.Catalog.Label.Bundle", l_locale_0);
    else
        local v51 = v19.AssetTypeIdToCategory[v40.assetTypeId];
        local v52 = v19.AssetCategoriesLocalized[v51];
        local v53 = v19.AssetTypeIdToTypeLocalized[v40.assetTypeId];
        if v52 and v53 then
            v50 = v22:FormatByKeyForLocale(v52, l_locale_0) .. " | " .. v22:FormatByKeyForLocale(v53, l_locale_0);
        end;
    end;
    return {
        v43, 
        v44, 
        {
            infoName = v22:FormatByKeyForLocale("Feature.Catalog.Label.CategoryType", l_locale_0), 
            infoData = v50, 
            LayoutOrder = 3, 
            Selectable = false
        }
    };
end;
v36.init = function(v54) --[[ Line: 135 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy)
    v54.state = {
        scrollingEnabled = true
    };
    v54.attributionRef = v4.createRef();
end;
v36.willUpdate = function(v55, v56) --[[ Line: 143 ]] --[[ Name: willUpdate ]]
    -- upvalues: v20 (copy), v21 (copy)
    if v20.isCollectibles(v55.props.assetInfo) then
        local l_collectibleItemId_0 = v55.props.assetInfo.collectibleItemId;
        local l_resellableInstances_0 = v55.props.resellableInstances;
        local l_resellableInstances_1 = v56.resellableInstances;
        if l_resellableInstances_0 and l_resellableInstances_0[l_collectibleItemId_0] and l_resellableInstances_1 and l_resellableInstances_1[l_collectibleItemId_0] and v21.fieldCount(l_resellableInstances_0[l_collectibleItemId_0]) ~= v21.fieldCount(l_resellableInstances_1[l_collectibleItemId_0]) then
            v55:setState({});
        end;
    end;
    local v60 = v55.props.assetInfo and v55.props.assetInfo.parentBundleId;
    local l_bundles_0 = v55.props.bundles;
    local l_bundles_1 = v56.bundles;
    if v60 and l_bundles_0 and l_bundles_0[v60] and l_bundles_1 and l_bundles_1[v60] and l_bundles_1[v60] ~= l_bundles_0[v60] then
        v55.props.setAssetFromBundleInfo(v55.props.assetInfo.assetId, l_bundles_1[v60]);
    end;
end;
v36.didUpdate = function(v63, v64) --[[ Line: 176 ]] --[[ Name: didUpdate ]]
    -- upvalues: v20 (copy)
    local l_reportOpenDetailsPage_0 = v63.props.reportOpenDetailsPage;
    local l_assetInfo_0 = v63.props.assetInfo;
    local l_assetInfo_1 = v64.assetInfo;
    if l_assetInfo_0 and l_assetInfo_0 ~= l_assetInfo_1 then
        local l_bundles_2 = v63.props.bundles;
        local v69 = l_assetInfo_0.parentBundleId ~= nil;
        local v70 = v69 and v20.getBundleId(l_assetInfo_0);
        if not v69 and l_assetInfo_0.owned == nil or v69 and l_bundles_2[v70].owned == nil then
            local l_assetId_0 = l_assetInfo_0.assetId;
            local l_Asset_0 = Enum.AvatarItemType.Asset;
            if v69 then
                l_assetId_0 = v70;
                l_Asset_0 = Enum.AvatarItemType.Bundle;
            end;
            v63.props.getItemDetails(l_assetId_0, l_Asset_0);
        end;
    end;
    if v63.props.detailsInformation.viewingDetails and not v64.detailsInformation.viewingDetails then
        l_reportOpenDetailsPage_0(l_assetInfo_0);
    end;
end;
v36.render = function(v73) --[[ Line: 214 ]] --[[ Name: render ]]
    -- upvalues: l_Images_0 (copy), v4 (copy), v28 (copy), v29 (copy), v20 (copy), l_Players_0 (copy), v21 (copy), l_ControllerBarHeight_0 (copy), v33 (copy), v18 (copy), v10 (copy), v8 (copy), l_isInExperienceUIVREnabled_0 (copy), v11 (copy), v7 (copy), l_ImageSetLabel_0 (copy), v22 (copy), l_AppFonts_0 (copy), v9 (copy), l_ItemInfoList_0 (copy)
    local l_view_0 = v73.props.view;
    local l_detailsInformation_0 = v73.props.detailsInformation;
    local v76 = v73.props.assetInfo or {};
    local l_localPlayerModel_0 = v73.props.localPlayerModel;
    local l_scrollingEnabled_0 = v73.state.scrollingEnabled;
    local l_locale_1 = v73.props.locale;
    local v80 = l_Images_0["icons/status/item/owned"];
    local v81 = v80 and v80.ImageRectSize / l_Images_0.ImagesResolutionScale or Vector2.new(0, 0);
    return v4.createElement(v28.Consumer, {
        render = function(v82) --[[ Line: 225 ]] --[[ Name: render ]]
            -- upvalues: l_view_0 (copy), v29 (ref), v20 (ref), v76 (copy), v73 (copy), l_Players_0 (ref), v21 (ref), l_ControllerBarHeight_0 (ref), v33 (ref), v4 (ref), v18 (ref), l_detailsInformation_0 (copy), v10 (ref), l_localPlayerModel_0 (copy), l_scrollingEnabled_0 (copy), v8 (ref), l_isInExperienceUIVREnabled_0 (ref), v11 (ref), v7 (ref), v81 (copy), l_ImageSetLabel_0 (ref), v80 (copy), v22 (ref), l_locale_1 (copy), l_AppFonts_0 (ref), v9 (ref), l_ItemInfoList_0 (ref)
            local v83 = v82[l_view_0];
            local v84 = 0;
            local v85 = v29() and v20.isCollectibles(v76);
            local v86 = 0;
            if v85 then
                local l_getCollectibleResellableInstances_0 = v73.props.getCollectibleResellableInstances;
                local l_resellableInstances_2 = v73.props.resellableInstances;
                local v89 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId;
                l_getCollectibleResellableInstances_0(v76.collectibleItemId, v89);
                v86 = l_resellableInstances_2 and l_resellableInstances_2[v76.collectibleItemId] and v21.fieldCount(l_resellableInstances_2[v76.collectibleItemId]) or 0;
            end;
            local v90 = v20.isLimited2Point0_Or_LimitedCollectible(v76);
            if v73.props.gamepadEnabled then
                v84 = -1 * l_ControllerBarHeight_0;
            end;
            v84 = v84 + -v33.DefaultCornerRadius.Offset;
            return v4.createElement("Frame", {
                Position = UDim2.new(0, v83.BorderPaddingSize, 0, 0), 
                Size = UDim2.new(1, -(2 * v83.BorderPaddingSize), 1, v84), 
                BackgroundTransparency = 0, 
                BackgroundColor3 = v18.Carbon, 
                BorderSizePixel = 0, 
                Visible = l_detailsInformation_0.viewingDetails
            }, {
                DetailsButtons = v4.createElement(v10, {
                    localPlayerModel = l_localPlayerModel_0
                }), 
                Container = v4.createElement("ScrollingFrame", {
                    BackgroundTransparency = 1, 
                    ScrollBarThickness = 0, 
                    Size = UDim2.new(1, 0, 1, -55), 
                    ScrollingEnabled = l_scrollingEnabled_0, 
                    Selectable = false, 
                    CanvasSize = UDim2.new(1, 0, 0, 0), 
                    AutomaticCanvasSize = Enum.AutomaticSize.Y
                }, {
                    UIListLayout = v4.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 10)
                    }), 
                    DetailsThumbnail = v4.createElement(v8), 
                    TryOnViewport = if l_isInExperienceUIVREnabled_0 then if l_detailsInformation_0.viewingDetails and l_localPlayerModel_0 then v4.createElement(v11, {
                        localPlayerModel = l_localPlayerModel_0, 
                        setScrollingEnabled = function(v91) --[[ Line: 279 ]] --[[ Name: setScrollingEnabled ]]
                            -- upvalues: v73 (ref)
                            v73:setScrollingEnabled(v91);
                        end
                    }) else nil else l_localPlayerModel_0 and v4.createElement(v11, {
                        localPlayerModel = l_localPlayerModel_0, 
                        setScrollingEnabled = function(v92) --[[ Line: 286 ]] --[[ Name: setScrollingEnabled ]]
                            -- upvalues: v73 (ref)
                            v73:setScrollingEnabled(v92);
                        end
                    }), 
                    DetailsText = v4.createElement(v7, {
                        localPlayerModel = l_localPlayerModel_0
                    }), 
                    ItemOwnedLabelContainer = v90 and v4.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, v81.Y + 20), 
                        BorderSizePixel = 0, 
                        LayoutOrder = 3, 
                        BackgroundColor3 = Color3.fromRGB(57, 59, 61)
                    }, {
                        Corner = v4.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 8)
                        }), 
                        OwnedIcon = v4.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.new(0, v81.X, 0, v81.Y), 
                            Position = UDim2.new(0, 12, 0, 10), 
                            Image = v80, 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0
                        }), 
                        ItemOwnedLabel = v4.createElement("TextLabel", {
                            Size = UDim2.new(0, v81.X, 0, v81.Y), 
                            Position = UDim2.new(0, v81.X + 60, 0, 10), 
                            Text = v22:FormatByKeyForLocale("InGame.InspectMenu.Label.OwnedItems", l_locale_1, {
                                QUANTITY = tostring(v86)
                            }), 
                            Font = l_AppFonts_0.default:getDefault(), 
                            TextSize = 12, 
                            TextColor3 = Color3.new(1, 1, 1), 
                            BackgroundTransparency = 1
                        })
                    }), 
                    DetailsDescription = v4.createElement(v9), 
                    ItemInfoList = v4.createElement(l_ItemInfoList_0, {
                        rowData = v73:getInfoRowProps(), 
                        LayoutOrder = 5
                    })
                })
            });
        end
    });
end;
return v5.UNSTABLE_connect2(function(v93, _) --[[ Line: 335 ]]
    local l_assetId_1 = v93.detailsInformation.assetId;
    return {
        view = v93.view, 
        detailsInformation = v93.detailsInformation, 
        assetInfo = v93.assets[l_assetId_1], 
        bundles = v93.bundles, 
        gamepadEnabled = v93.gamepadEnabled, 
        locale = v93.locale, 
        resellableInstances = v93.collectibleResellableInstances, 
        creatingExperiences = v93.creatingExperiences
    };
end, function(v96) --[[ Line: 348 ]]
    -- upvalues: v14 (copy), v16 (copy), v15 (copy), v17 (copy), v12 (copy), v30 (copy), v31 (copy)
    return {
        getAssetBundles = function(v97) --[[ Line: 350 ]] --[[ Name: getAssetBundles ]]
            -- upvalues: v96 (copy), v14 (ref)
            v96(v14(v97));
        end, 
        getEconomyProductInfo = function(v98, v99, v100) --[[ Line: 353 ]] --[[ Name: getEconomyProductInfo ]]
            -- upvalues: v96 (copy), v16 (ref)
            v96(v16(v98, v99, v100));
        end, 
        reportOpenDetailsPage = function(v101) --[[ Line: 356 ]] --[[ Name: reportOpenDetailsPage ]]
            -- upvalues: v96 (copy), v15 (ref)
            v96(v15(v101));
        end, 
        getCollectibleResellableInstances = function(v102, v103) --[[ Line: 359 ]] --[[ Name: getCollectibleResellableInstances ]]
            -- upvalues: v96 (copy), v17 (ref)
            v96(v17(v102, v103));
        end, 
        openOverlay = function(v104, v105) --[[ Line: 362 ]] --[[ Name: openOverlay ]]
            -- upvalues: v96 (copy), v12 (ref)
            v96(v12(v104, v105));
        end, 
        getItemDetails = function(v106, v107) --[[ Line: 365 ]] --[[ Name: getItemDetails ]]
            -- upvalues: v96 (copy), v30 (ref)
            v96(v30(v106, v107));
        end, 
        setAssetFromBundleInfo = function(v108, v109) --[[ Line: 368 ]] --[[ Name: setAssetFromBundleInfo ]]
            -- upvalues: v96 (copy), v31 (ref)
            v96(v31(v108, v109));
        end
    };
end)(v36);