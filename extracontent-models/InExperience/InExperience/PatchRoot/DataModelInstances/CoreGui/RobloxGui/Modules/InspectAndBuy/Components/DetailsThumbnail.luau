local l_CorePackages_0 = game:GetService("CorePackages");
local l_Images_0 = require(l_CorePackages_0.Packages.UIBlox).App.ImageSet.Images;
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Components.LimitedLabel);
local v4 = require(l_Parent_0.Constants);
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_Parent_0.UtilityFunctions);
local v8 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v9 = require(l_Parent_0.Components.InspectAndBuyContext);
local v10 = require(l_Parent_0.Flags.GetFFlagDisplayCollectiblesIcon);
local v11 = require(l_Parent_0.Flags.GetFFlagIBEnableCollectiblesSystemSupport);
local v12 = game:DefineFastFlag("FixBundleThumbnailOnDetailPage", false);
local v13 = v5.PureComponent:extend("DetailsThumbnail");
local function _(v14) --[[ Line: 24 ]] --[[ Name: isPartOfBundleAndOffsale ]]
    return v14 and v14.parentBundleId ~= nil or false;
end;
v13.getUrl = function(v16) --[[ Line: 28 ]] --[[ Name: getUrl ]]
    -- upvalues: v7 (copy), v12 (copy)
    local l_assetInfo_0 = v16.props.assetInfo;
    local l_detailsInformation_0 = v16.props.detailsInformation;
    local l_bundles_0 = v16.props.bundles;
    local v20 = v7.getBundleId(l_assetInfo_0);
    local v21 = l_assetInfo_0 and l_assetInfo_0.parentBundleId ~= nil or false;
    local _ = "";
    if v21 and l_bundles_0[v20] and l_bundles_0[v20].costumeId then
        if v12 then
            return "rbxthumb://type=BundleThumbnail&id=" .. tostring(v20) .. "&w=420&h=420";
        else
            return "rbxthumb://type=Outfit&id=" .. l_bundles_0[v20].costumeId .. "&w=420&h=420";
        end;
    else
        return "rbxthumb://type=Asset&id=" .. l_detailsInformation_0.assetId .. "&w=420&h=420";
    end;
end;
v13.render = function(v23) --[[ Line: 53 ]] --[[ Name: render ]]
    -- upvalues: l_Images_0 (copy), v5 (copy), v9 (copy), v10 (copy), v7 (copy), v11 (copy), v4 (copy), v8 (copy), v3 (copy)
    local l_view_0 = v23.props.view;
    local l_detailsInformation_1 = v23.props.detailsInformation;
    local l_tryingOnInfo_0 = v23.props.tryingOnInfo;
    local l_locale_0 = v23.props.locale;
    local l_assetInfo_1 = v23.props.assetInfo;
    local v29 = l_Images_0["icons/status/item/limited"];
    local v30 = v29 and v29.ImageRectSize / l_Images_0.ImagesResolutionScale or Vector2.new(0, 0);
    return v5.createElement(v9.Consumer, {
        render = function(v31) --[[ Line: 63 ]] --[[ Name: render ]]
            -- upvalues: l_view_0 (copy), v10 (ref), v7 (ref), l_assetInfo_1 (copy), v11 (ref), v4 (ref), v30 (copy), v8 (ref), l_locale_0 (copy), v5 (ref), l_tryingOnInfo_0 (copy), l_detailsInformation_1 (copy), v23 (copy), v3 (ref)
            local v32 = v31[l_view_0];
            local v33 = v10() and v7.isCollectibles(l_assetInfo_1);
            local v34 = nil;
            local v35 = nil;
            local v36 = nil;
            local v37 = nil;
            if v11() and l_assetInfo_1 then
                v34 = v7.hasLimitedQuantity(l_assetInfo_1);
                v35 = v7.isLimited1Point0_LimitedUnique(l_assetInfo_1) or v7.isLimited2Point0_Or_LimitedCollectible(l_assetInfo_1);
                local v38 = if v35 then v4.LimitedIconFrameSizeXOffset * 2 else v4.LimitedIconFrameSizeXOffset;
                v36 = UDim2.new(0, v30.X + v38, 0, v30.Y + v4.LimitedIconFrameSizeYOffset);
                v37 = if v35 then "#" .. "    " .. v8:FormatByKeyForLocale("InGame.InspectMenu.Label.LimitedItems", l_locale_0) else "    " .. v8:FormatByKeyForLocale("InGame.InspectMenu.Label.LimitedItems", l_locale_0);
            end;
            return v5.createElement("Frame", {
                Position = v32.DetailsThumbnailFramePosition, 
                Size = UDim2.new(1, 0, 0, v10() and v4.DetailsThumbnailFrameHeight or 300), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Visible = not l_tryingOnInfo_0.tryingOn
            }, {
                Thumbnail = l_detailsInformation_1.viewingDetails and v5.createElement("ImageLabel", {
                    Position = v32.DetailsThumbnailPosition, 
                    AnchorPoint = v32.DetailsThumbnailAnchorPoint, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    Image = v23:getUrl()
                }, {
                    AspectRatioConstraint = v5.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1, 
                        AspectType = Enum.AspectType.FitWithinMaxSize, 
                        DominantAxis = v32.DetailsThumbnailARDominantAxis
                    })
                }), 
                LimitedLabel = (if v11() then v34 else v33) and v5.createElement(v3, {
                    frameSize = if v11() then v36 else UDim2.new(0, v30.X + 18, 0, v30.Y + 6), 
                    framePosition = UDim2.new(0, 0, 0, v4.DetailsThumbnailFrameHeight - v30.Y - 8), 
                    imageSize = UDim2.new(0, v30.X, 0, v30.Y), 
                    imagePosition = UDim2.new(0, 4, 0, 3), 
                    textSize = UDim2.new(0, 4 + v30.X, 0, v30.Y), 
                    textPosition = UDim2.new(0, 5 + v30.X, 0, 3), 
                    text = if v11() then v37 else "#" .. "    " .. v8:FormatByKeyForLocale("InGame.InspectMenu.Label.LimitedItems", l_locale_0)
                })
            });
        end
    });
end;
return v6.UNSTABLE_connect2(function(v39, _) --[[ Line: 138 ]]
    local l_assetId_0 = v39.detailsInformation.assetId;
    return {
        view = v39.view, 
        tryingOnInfo = v39.tryingOnInfo, 
        detailsInformation = v39.detailsInformation, 
        assetInfo = v39.assets[l_assetId_0], 
        locale = v39.locale, 
        bundles = v39.bundles
    };
end)(v13);