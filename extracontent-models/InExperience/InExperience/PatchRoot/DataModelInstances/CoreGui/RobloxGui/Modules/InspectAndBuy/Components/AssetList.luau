local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Skeleton_0 = require(l_CorePackages_0.Packages.Foundation).Skeleton;
local v7 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local v8 = require(l_Parent_0.Components.AssetCard);
local v9 = require(l_Parent_0.Components.InspectAndBuyContext);
local v10 = require(l_Parent_0.Actions.SetAssetFromBundleInfo);
local l_FFlagAddNewPlayerListMobileFocusNav_0 = v7.Flags.FFlagAddNewPlayerListMobileFocusNav;
local v12 = v3.PureComponent:extend("AssetList");
v12.calculateCanvasSize = function(v13, v14, v15, v16) --[[ Line: 25 ]] --[[ Name: calculateCanvasSize ]]
    local l_current_0 = v13.gridFrameRef.current;
    local l_view_0 = v13.props.view;
    local v19 = nil;
    v19 = v13.props.views[l_view_0];
    if l_current_0 then
        local v20 = v19.TopSizeY + 15;
        local v21 = math.ceil(v15 / v14) * (v16 + 10) + v20;
        l_current_0.Parent.CanvasSize = UDim2.new(1, 0, 0, v21);
    end;
end;
v12.init = function(v22) --[[ Line: 38 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), l_FFlagAddNewPlayerListMobileFocusNav_0 (copy)
    local l_view_1 = v22.props.view;
    local v24 = nil;
    v24 = v22.props.views[l_view_1];
    v22.gridFrameRef = v3.createRef();
    v22.state = {
        assetCardSizeX = v24.AssetCardMaxSizeX, 
        assetCardSizeY = v24.AssetCardMaxSizeY, 
        assetCardsLoaded = not l_FFlagAddNewPlayerListMobileFocusNav_0 and nil
    };
end;
v12.render = function(v25) --[[ Line: 52 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v8 (copy), l_Skeleton_0 (copy), l_FFlagAddNewPlayerListMobileFocusNav_0 (copy)
    local l_view_2 = v25.props.view;
    local v27 = nil;
    v27 = v25.props.views[l_view_2];
    local l_assets_0 = v25.props.assets;
    local l_MaxAssetCardsPerRow_0 = v27.MaxAssetCardsPerRow;
    local l_assetCardSizeX_0 = v25.state.assetCardSizeX;
    local l_assetCardSizeY_0 = v25.state.assetCardSizeY;
    local v32 = {};
    local v33 = 0;
    v32.UIGridLayout = v3.createElement("UIGridLayout", {
        CellPadding = UDim2.new(0, 10, 0, 10), 
        CellSize = UDim2.new(0, l_assetCardSizeX_0, 0, l_assetCardSizeY_0), 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        FillDirectionMaxCells = l_MaxAssetCardsPerRow_0
    });
    for _, v35 in pairs(l_assets_0) do
        v33 = v33 + 1;
        v32[v35.assetId] = v3.createElement(v8, {
            assetInfo = v35, 
            assetCardSizeX = l_assetCardSizeX_0
        });
    end;
    if v33 == 0 then
        for v36 = 1, 30 do
            v32[v36] = v3.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, l_assetCardSizeX_0)
            });
        end;
    elseif l_FFlagAddNewPlayerListMobileFocusNav_0 then
        v25:setState({
            assetCardsLoaded = true
        });
    end;
    v25:calculateCanvasSize(l_MaxAssetCardsPerRow_0, v33, l_assetCardSizeY_0);
    return v3.createElement("Frame", {
        Size = UDim2.new(1, -(2 * v27.BorderPaddingSize), 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = 3, 
        [v3.Ref] = v25.gridFrameRef, 
        [v3.Change.AbsoluteSize] = function(_) --[[ Line: 104 ]]
            -- upvalues: v25 (copy)
            spawn(function() --[[ Line: 105 ]]
                -- upvalues: v25 (ref)
                v25:resize();
            end);
        end
    }, v32);
end;
v12.didMount = function(v38) --[[ Line: 112 ]] --[[ Name: didMount ]]
    v38:resize();
    v38.mounted = true;
end;
v12.updateAssetsFromBundles = function(v39) --[[ Line: 126 ]] --[[ Name: updateAssetsFromBundles ]]
    -- upvalues: v4 (copy)
    local l_bundles_0 = v39.props.bundles;
    local l_assetBundles_0 = v39.props.assetBundles;
    local l_assets_1 = v39.props.assets;
    local v43 = v4.Dictionary.keys(l_assets_1);
    if not l_bundles_0 or v4.isEmpty(l_bundles_0) then
        return;
    else
        local v44 = 1;
        for _, v46 in pairs(l_bundles_0) do
            local l_assetIds_0 = v46.assetIds;
            for v48 = 1, #l_assetIds_0 do
                local v49 = tostring(l_assetIds_0[v48]);
                if table.find(v43, v49) then
                    local v50 = l_assetBundles_0[v49] or {};
                    if #v50 == 1 or v44 == 1 and #v50 > 1 and l_assets_1[v49] and l_assets_1[v49].parentBundleId == nil then
                        v39.props.dispatchSetAssetFromBundleInfo(v49, v46);
                    end;
                end;
            end;
            v44 = v44 + 1;
        end;
        return;
    end;
end;
v12.didUpdate = function(v51, v52) --[[ Line: 166 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagAddNewPlayerListMobileFocusNav_0 (copy), l_GuiService_0 (copy)
    if v51.props.view ~= v52.view then
        v51:resize();
    end;
    if v51.mounted and v51.props.gamepadEnabled and not v51.props.detailsInformation.viewingDetails and v51.props.visible and (not l_FFlagAddNewPlayerListMobileFocusNav_0 or v51.state.assetCardsLoaded) then
        l_GuiService_0.SelectedCoreObject = v51.gridFrameRef.current:FindFirstChildWhichIsA("GuiObject");
    end;
    if v51.props.assetBundles ~= v52.assetBundles or v51.props.bundles ~= v52.bundles then
        v51:updateAssetsFromBundles();
    end;
end;
v12.willUnmount = function(v53) --[[ Line: 186 ]] --[[ Name: willUnmount ]]
    v53.mounted = false;
end;
v12.resize = function(v54) --[[ Line: 190 ]] --[[ Name: resize ]]
    local l_current_1 = v54.gridFrameRef.current;
    local l_view_3 = v54.props.view;
    local v57 = nil;
    v57 = v54.props.views[l_view_3];
    if l_current_1 then
        local l_MaxAssetCardsPerRow_1 = v57.MaxAssetCardsPerRow;
        local v59 = math.floor((l_current_1.AbsoluteSize.X - 10 * (l_MaxAssetCardsPerRow_1 - 1)) / l_MaxAssetCardsPerRow_1);
        local v60 = math.min(v59, v57.AssetCardMaxSizeX);
        local v61 = math.min(v59 / 0.68, v57.AssetCardMaxSizeY);
        if v54.state.assetCardSizeX ~= v60 or v54.state.assetCardSizeY ~= v61 then
            v54:setState({
                assetCardSizeX = v60, 
                assetCardSizeY = v61
            });
        end;
    end;
end;
return v5.connect(function(v62, _) --[[ Line: 221 ]]
    return {
        view = v62.view, 
        visible = v62.visible, 
        assets = v62.assets, 
        bundles = v62.bundles, 
        assetBundles = v62.assetBundles, 
        detailsInformation = v62.detailsInformation, 
        gamepadEnabled = v62.gamepadEnabled
    };
end, function(v64) --[[ Line: 231 ]]
    -- upvalues: v10 (copy)
    return {
        dispatchSetAssetFromBundleInfo = function(v65, v66) --[[ Line: 233 ]] --[[ Name: dispatchSetAssetFromBundleInfo ]]
            -- upvalues: v64 (copy), v10 (ref)
            v64(v10(v65, v66));
        end
    };
end)(function(v67) --[[ Line: 212 ]] --[[ Name: AssetListWrapper ]]
    -- upvalues: v3 (copy), v9 (copy), v4 (copy), v12 (copy)
    return v3.createElement(v9.Consumer, {
        render = function(v68) --[[ Line: 214 ]] --[[ Name: render ]]
            -- upvalues: v4 (ref), v67 (copy), v3 (ref), v12 (ref)
            local v69 = v4.Dictionary.join(v67, {
                views = v68
            });
            return v3.createElement(v12, v69);
        end
    });
end);