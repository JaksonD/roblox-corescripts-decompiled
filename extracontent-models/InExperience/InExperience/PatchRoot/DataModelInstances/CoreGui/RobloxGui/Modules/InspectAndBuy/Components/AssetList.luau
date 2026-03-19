local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local v8 = require(l_Parent_0.Components.AssetCard);
local v9 = require(l_Parent_0.Components.InspectAndBuyContext);
local l_ShimmerPanel_0 = v6.App.Loading.ShimmerPanel;
local v11 = require(l_Parent_0.Actions.SetAssetFromBundleInfo);
local l_FFlagAddNewPlayerListMobileFocusNav_0 = v7.Flags.FFlagAddNewPlayerListMobileFocusNav;
local v13 = v3.PureComponent:extend("AssetList");
v13.calculateCanvasSize = function(v14, v15, v16, v17) --[[ Line: 24 ]] --[[ Name: calculateCanvasSize ]]
    local l_current_0 = v14.gridFrameRef.current;
    local l_view_0 = v14.props.view;
    local v20 = nil;
    v20 = v14.props.views[l_view_0];
    if l_current_0 then
        local v21 = v20.TopSizeY + 15;
        local v22 = math.ceil(v16 / v15) * (v17 + 10) + v21;
        l_current_0.Parent.CanvasSize = UDim2.new(1, 0, 0, v22);
    end;
end;
v13.init = function(v23) --[[ Line: 37 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), l_FFlagAddNewPlayerListMobileFocusNav_0 (copy)
    local l_view_1 = v23.props.view;
    local v25 = nil;
    v25 = v23.props.views[l_view_1];
    v23.gridFrameRef = v3.createRef();
    v23.state = {
        assetCardSizeX = v25.AssetCardMaxSizeX, 
        assetCardSizeY = v25.AssetCardMaxSizeY, 
        assetCardsLoaded = not l_FFlagAddNewPlayerListMobileFocusNav_0 and nil
    };
end;
v13.render = function(v26) --[[ Line: 51 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v8 (copy), l_ShimmerPanel_0 (copy), l_FFlagAddNewPlayerListMobileFocusNav_0 (copy)
    local l_view_2 = v26.props.view;
    local v28 = nil;
    v28 = v26.props.views[l_view_2];
    local l_assets_0 = v26.props.assets;
    local l_MaxAssetCardsPerRow_0 = v28.MaxAssetCardsPerRow;
    local l_assetCardSizeX_0 = v26.state.assetCardSizeX;
    local l_assetCardSizeY_0 = v26.state.assetCardSizeY;
    local v33 = {};
    local v34 = 0;
    v33.UIGridLayout = v3.createElement("UIGridLayout", {
        CellPadding = UDim2.new(0, 10, 0, 10), 
        CellSize = UDim2.new(0, l_assetCardSizeX_0, 0, l_assetCardSizeY_0), 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        FillDirectionMaxCells = l_MaxAssetCardsPerRow_0
    });
    for _, v36 in pairs(l_assets_0) do
        v34 = v34 + 1;
        v33[v36.assetId] = v3.createElement(v8, {
            assetInfo = v36, 
            assetCardSizeX = l_assetCardSizeX_0
        });
    end;
    if v34 == 0 then
        for v37 = 1, 30 do
            v33[v37] = v3.createElement(l_ShimmerPanel_0, {
                Size = UDim2.new(1, 0, 0, l_assetCardSizeX_0)
            });
        end;
    elseif l_FFlagAddNewPlayerListMobileFocusNav_0 then
        v26:setState({
            assetCardsLoaded = true
        });
    end;
    v26:calculateCanvasSize(l_MaxAssetCardsPerRow_0, v34, l_assetCardSizeY_0);
    return v3.createElement("Frame", {
        Size = UDim2.new(1, -(2 * v28.BorderPaddingSize), 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = 3, 
        [v3.Ref] = v26.gridFrameRef, 
        [v3.Change.AbsoluteSize] = function(_) --[[ Line: 103 ]]
            -- upvalues: v26 (copy)
            spawn(function() --[[ Line: 104 ]]
                -- upvalues: v26 (ref)
                v26:resize();
            end);
        end
    }, v33);
end;
v13.didMount = function(v39) --[[ Line: 111 ]] --[[ Name: didMount ]]
    v39:resize();
    v39.mounted = true;
end;
v13.updateAssetsFromBundles = function(v40) --[[ Line: 125 ]] --[[ Name: updateAssetsFromBundles ]]
    -- upvalues: v4 (copy)
    local l_bundles_0 = v40.props.bundles;
    local l_assetBundles_0 = v40.props.assetBundles;
    local l_assets_1 = v40.props.assets;
    local v44 = v4.Dictionary.keys(l_assets_1);
    if not l_bundles_0 or v4.isEmpty(l_bundles_0) then
        return;
    else
        local v45 = 1;
        for _, v47 in pairs(l_bundles_0) do
            local l_assetIds_0 = v47.assetIds;
            for v49 = 1, #l_assetIds_0 do
                local v50 = tostring(l_assetIds_0[v49]);
                if table.find(v44, v50) then
                    local v51 = l_assetBundles_0[v50] or {};
                    if #v51 == 1 or v45 == 1 and #v51 > 1 and l_assets_1[v50] and l_assets_1[v50].parentBundleId == nil then
                        v40.props.dispatchSetAssetFromBundleInfo(v50, v47);
                    end;
                end;
            end;
            v45 = v45 + 1;
        end;
        return;
    end;
end;
v13.didUpdate = function(v52, v53) --[[ Line: 165 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagAddNewPlayerListMobileFocusNav_0 (copy), l_GuiService_0 (copy)
    if v52.props.view ~= v53.view then
        v52:resize();
    end;
    if v52.mounted and v52.props.gamepadEnabled and not v52.props.detailsInformation.viewingDetails and v52.props.visible and (not l_FFlagAddNewPlayerListMobileFocusNav_0 or v52.state.assetCardsLoaded) then
        l_GuiService_0.SelectedCoreObject = v52.gridFrameRef.current:FindFirstChildWhichIsA("GuiObject");
    end;
    if v52.props.assetBundles ~= v53.assetBundles or v52.props.bundles ~= v53.bundles then
        v52:updateAssetsFromBundles();
    end;
end;
v13.willUnmount = function(v54) --[[ Line: 185 ]] --[[ Name: willUnmount ]]
    v54.mounted = false;
end;
v13.resize = function(v55) --[[ Line: 189 ]] --[[ Name: resize ]]
    local l_current_1 = v55.gridFrameRef.current;
    local l_view_3 = v55.props.view;
    local v58 = nil;
    v58 = v55.props.views[l_view_3];
    if l_current_1 then
        local l_MaxAssetCardsPerRow_1 = v58.MaxAssetCardsPerRow;
        local v60 = math.floor((l_current_1.AbsoluteSize.X - 10 * (l_MaxAssetCardsPerRow_1 - 1)) / l_MaxAssetCardsPerRow_1);
        local v61 = math.min(v60, v58.AssetCardMaxSizeX);
        local v62 = math.min(v60 / 0.68, v58.AssetCardMaxSizeY);
        if v55.state.assetCardSizeX ~= v61 or v55.state.assetCardSizeY ~= v62 then
            v55:setState({
                assetCardSizeX = v61, 
                assetCardSizeY = v62
            });
        end;
    end;
end;
return v5.connect(function(v63, _) --[[ Line: 220 ]]
    return {
        view = v63.view, 
        visible = v63.visible, 
        assets = v63.assets, 
        bundles = v63.bundles, 
        assetBundles = v63.assetBundles, 
        detailsInformation = v63.detailsInformation, 
        gamepadEnabled = v63.gamepadEnabled
    };
end, function(v65) --[[ Line: 230 ]]
    -- upvalues: v11 (copy)
    return {
        dispatchSetAssetFromBundleInfo = function(v66, v67) --[[ Line: 232 ]] --[[ Name: dispatchSetAssetFromBundleInfo ]]
            -- upvalues: v65 (copy), v11 (ref)
            v65(v11(v66, v67));
        end
    };
end)(function(v68) --[[ Line: 211 ]] --[[ Name: AssetListWrapper ]]
    -- upvalues: v3 (copy), v9 (copy), v4 (copy), v13 (copy)
    return v3.createElement(v9.Consumer, {
        render = function(v69) --[[ Line: 213 ]] --[[ Name: render ]]
            -- upvalues: v4 (ref), v68 (copy), v3 (ref), v13 (ref)
            local v70 = v4.Dictionary.join(v68, {
                views = v69
            });
            return v3.createElement(v13, v70);
        end
    });
end);