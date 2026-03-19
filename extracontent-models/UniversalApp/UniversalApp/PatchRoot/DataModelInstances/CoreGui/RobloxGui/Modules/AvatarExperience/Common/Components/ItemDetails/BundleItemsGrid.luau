local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v7 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Components.ItemsList.BaseItemCard);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.LoadableGridView);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchBundleAssetsDetails);
local v12 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v12.Style.withStyle;
local l_withTextSizeOffset_0 = v12.Core.Style.withTextSizeOffset;
local v15 = v2.PureComponent:extend("BundlesItemsGrid");
v15.init = function(v16) --[[ Line: 24 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v9 (copy)
    v16.renderItemTile = function(v17) --[[ Line: 25 ]]
        -- upvalues: v2 (ref), v9 (ref)
        return v2.createElement(v9, {
            itemId = v17.id, 
            itemType = v17.type, 
            gridInformation = v17.gridInformation, 
            onActivated = function() --[[ Line: 30 ]] --[[ Name: onActivated ]]

            end
        });
    end;
end;
v15.willUpdate = function(v18, v19) --[[ Line: 35 ]] --[[ Name: willUpdate ]]
    if v18.props.bundleItemsList ~= v19.bundleItemsList then
        local v20 = {};
        local l_bundleItemsList_0 = v19.bundleItemsList;
        if l_bundleItemsList_0 then
            for _, v23 in l_bundleItemsList_0 do
                table.insert(v20, (tonumber(v23.id)));
            end;
        end;
        v18.props.fetchBundleAssetsDetails(v18.props.networking, v18.props.bundleId or v19.bundleId, v20);
    end;
end;
v15.render = function(v24) --[[ Line: 52 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), l_withTextSizeOffset_0 (copy), l_withStyle_0 (copy), v7 (copy), v2 (copy), v10 (copy), v8 (copy)
    local l_bundleItemsList_1 = v24.props.bundleItemsList;
    local l_LayoutOrder_0 = v24.props.LayoutOrder;
    local v27 = nil;
    if l_bundleItemsList_1 then
        v27 = {};
        for _, v29 in l_bundleItemsList_1 do
            if v29.type == v6.ItemType.Asset then
                table.insert(v27, v29);
            end;
        end;
    end;
    return l_withTextSizeOffset_0(function(v30) --[[ Line: 65 ]]
        -- upvalues: l_withStyle_0 (ref), v6 (ref), v7 (ref), v2 (ref), v10 (ref), v24 (copy), v27 (ref), l_LayoutOrder_0 (copy), v8 (ref)
        return l_withStyle_0(function(v31) --[[ Line: 66 ]]
            -- upvalues: v30 (copy), v6 (ref), v7 (ref), v2 (ref), v10 (ref), v24 (ref), v27 (ref), l_LayoutOrder_0 (ref), v8 (ref)
            local l_Font_0 = v31.Font;
            local v33 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize + v30;
            local l_BundleItemTile_0 = v6.ItemTileType.BundleItemTile;
            local v35 = v7.GridItemHeightGetter(l_BundleItemTile_0, v33);
            return v2.createElement(v10, {
                renderItem = v24.renderItemTile, 
                getItemHeight = v35, 
                items = v27, 
                LayoutOrder = l_LayoutOrder_0, 
                totalNumItems = v8.bundleIncludedItemsCount
            });
        end);
    end);
end;
v15 = v3.connect(function(v36, v37) --[[ Line: 92 ]]
    local v38 = tostring(v37.itemId);
    local v39 = v36.AvatarExperience.Common.BundleInfos[v38];
    return {
        bundleId = v38, 
        bundleItemsList = v39 and v39.items
    };
end, function(v40) --[[ Line: 84 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v11 (copy)
    return {
        fetchBundleAssetsDetails = function(v41, v42, v43) --[[ Line: 86 ]] --[[ Name: fetchBundleAssetsDetails ]]
            -- upvalues: v40 (copy), v11 (ref)
            v40(v11(v41, v42, v43));
        end
    };
end)(v15);
return (l_RoactServices_0.connect({
    networking = v5
})(v15));