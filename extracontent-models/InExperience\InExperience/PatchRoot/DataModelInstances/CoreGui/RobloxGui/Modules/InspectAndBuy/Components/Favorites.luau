local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v5 = require(l_Parent_0.UtilityFunctions);
local v6 = require(l_Parent_0.Thunks.GetAssetFavoriteCount);
local v7 = require(l_Parent_0.Thunks.GetBundleFavoriteCount);
local v8 = require(l_Parent_0.Selectors.GotCurrentFavoriteCount);
local v9 = require(l_Parent_0.getSelectionImageObjectRegular);
local v10 = v2.PureComponent:extend("Favorites");
v10.setText = function(v11) --[[ Line: 22 ]] --[[ Name: setText ]]
    -- upvalues: v5 (copy)
    local v12 = v11.props.assetInfo or {};
    local v13 = v12.parentBundleId ~= nil;
    local l_bundleInfo_0 = v11.props.bundleInfo;
    if v13 then
        local v15 = v5.getBundleId(v12);
        if l_bundleInfo_0[v15] then
            v11.numFavorites = l_bundleInfo_0[v15].numFavorites;
            return;
        end;
    elseif v12 then
        v11.numFavorites = v12.numFavorites;
    end;
end;
v10.init = function(v16) --[[ Line: 38 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy)
    v16.numFavorites = "";
    v16.selectionImageObject = v9();
end;
v10.willUpdate = function(v17, v18) --[[ Line: 43 ]] --[[ Name: willUpdate ]]
    -- upvalues: v5 (copy)
    local l_getAssetFavoriteCount_0 = v17.props.getAssetFavoriteCount;
    local l_getBundleFavoriteCount_0 = v17.props.getBundleFavoriteCount;
    if v18.assetInfo then
        local l_assetInfo_0 = v18.assetInfo;
        local v22 = l_assetInfo_0.parentBundleId ~= nil;
        if not v18.gotCurrentFavoriteCount then
            coroutine.wrap(function() --[[ Line: 58 ]]
                -- upvalues: v22 (copy), l_getAssetFavoriteCount_0 (copy), l_assetInfo_0 (copy), v5 (ref), l_getBundleFavoriteCount_0 (copy)
                if not v22 then
                    l_getAssetFavoriteCount_0(l_assetInfo_0.assetId);
                    return;
                else
                    local v23 = v5.getBundleId(l_assetInfo_0);
                    l_getBundleFavoriteCount_0(v23);
                    return;
                end;
            end)();
        end;
    end;
end;
v10.render = function(v24) --[[ Line: 70 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_AppFonts_0 (copy)
    v24:setText();
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 16), 
        BackgroundTransparency = 1, 
        LayoutOrder = 3
    }, {
        FavoriteIcon = v2.createElement("ImageButton", {
            Selectable = false, 
            Size = UDim2.new(0, 16, 0, 16), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/InspectMenu/ico_favorite.png", 
            SelectionImageObject = v24.selectionImageObject
        }), 
        FavoriteText = v2.createElement("TextLabel", {
            Size = UDim2.new(1, -16, 1, 0), 
            Position = UDim2.new(0, 21, 0, 0), 
            BackgroundTransparency = 1, 
            Text = v24.numFavorites or "", 
            Font = l_AppFonts_0.default:getDefault(), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextSize = 12, 
            TextColor3 = Color3.new(1, 1, 1)
        })
    });
end;
v10.shouldUpdate = function(_, v26) --[[ Line: 98 ]] --[[ Name: shouldUpdate ]]
    if not v26.detailsInformation.viewingDetails then
        return false;
    else
        return true;
    end;
end;
return v3.UNSTABLE_connect2(function(v27, _) --[[ Line: 106 ]]
    -- upvalues: v8 (copy)
    local l_assetId_0 = v27.detailsInformation.assetId;
    return {
        detailsInformation = v27.detailsInformation, 
        assetInfo = v27.assets[l_assetId_0], 
        bundleInfo = v27.bundles, 
        gotCurrentFavoriteCount = v8(v27)
    };
end, function(v30) --[[ Line: 115 ]]
    -- upvalues: v6 (copy), v7 (copy)
    return {
        getAssetFavoriteCount = function(v31) --[[ Line: 117 ]] --[[ Name: getAssetFavoriteCount ]]
            -- upvalues: v30 (copy), v6 (ref)
            v30(v6(v31));
        end, 
        getBundleFavoriteCount = function(v32) --[[ Line: 120 ]] --[[ Name: getBundleFavoriteCount ]]
            -- upvalues: v30 (copy), v7 (ref)
            v30(v7(v32));
        end
    };
end)(v10);