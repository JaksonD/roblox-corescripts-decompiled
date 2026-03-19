local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_GridMetrics_0 = v5.App.Grid.GridMetrics;
local l_DefaultMetricsGridView_0 = v5.App.Grid.DefaultMetricsGridView;
local v8 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v10 = require(l_Modules_0.LuaApp.Components.DeveloperProduct.DeveloperProductTile);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_TagBasedImpressionsDetector_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).TagBasedImpressionsDetector;
local v13 = require(l_CorePackages_0.Workspace.Packages.EdpStoreAnalytics);
local l_Constants_0 = v13.Constants;
local l_EdpUnifiedImpressionsReporter_0 = v13.EdpUnifiedImpressionsReporter;
local v16 = require(l_Modules_0.LuaApp.Flags.FFlagEnableEdpStoreUnifiedLogging);
local v17 = require(l_Modules_0.LuaApp.AppPage);
local v18 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableEdpStoreGridPositionLogging);
local l_GAME_GRID_CHILD_PADDING_0 = v8.Constants.GAME_GRID_CHILD_PADDING;
local l_GAME_GRID_TILE_FOOTER_HEIGHT_0 = v8.Constants.GAME_GRID_TILE_FOOTER_HEIGHT;
local v21 = v1.PureComponent:extend("DeveloperProductsGrid");
v21.validateProps = v4.strictInterface({
    universeId = v4.string, 
    developerProducts = v4.optional(v4.table), 
    numRows = v4.optional(v4.number), 
    viewWidth = v4.optional(v4.number), 
    layoutOrder = v4.optional(v4.integer), 
    locationType = v4.optional(v4.string), 
    developerProductTiles = v4.optional(v4.table)
});
v21.init = function(v22) --[[ Line: 45 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v10 (copy), l_GAME_GRID_TILE_FOOTER_HEIGHT_0 (copy), v16 (copy), l_Signal_0 (copy)
    v22.renderDeveloperProduct = function(v23) --[[ Line: 46 ]]
        -- upvalues: v1 (ref), v10 (ref)
        return v1.createElement(v10, v23);
    end;
    v22.getDeveloperProductsGridItemHeight = function(v24) --[[ Line: 50 ]]
        -- upvalues: l_GAME_GRID_TILE_FOOTER_HEIGHT_0 (ref)
        return v24 + l_GAME_GRID_TILE_FOOTER_HEIGHT_0;
    end;
    if v16 then
        v22.ref = v1.createRef();
        v22.requestImpressionsSignal = l_Signal_0.new();
    end;
end;
v21.render = function(v25) --[[ Line: 59 ]] --[[ Name: render ]]
    -- upvalues: v16 (copy), v1 (copy), l_DefaultMetricsGridView_0 (copy), l_GridMetrics_0 (copy), l_GAME_GRID_CHILD_PADDING_0 (copy), l_TagBasedImpressionsDetector_0 (copy), l_Constants_0 (copy), v17 (copy), l_EdpUnifiedImpressionsReporter_0 (copy)
    local l_developerProductTiles_0 = v25.props.developerProductTiles;
    if v16 then
        return v1.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = v25.props.layoutOrder, 
            [v1.Change.AbsolutePosition] = function() --[[ Line: 70 ]]
                -- upvalues: v25 (copy)
                v25.requestImpressionsSignal:fire();
            end
        }, {
            GridView = v1.createElement(l_DefaultMetricsGridView_0, {
                [v1.Ref] = v25.ref, 
                renderItem = v25.renderDeveloperProduct, 
                getItemHeight = v25.getDeveloperProductsGridItemHeight, 
                getItemMetrics = l_GridMetrics_0.getSmallMetrics, 
                itemPadding = Vector2.new(l_GAME_GRID_CHILD_PADDING_0, l_GAME_GRID_CHILD_PADDING_0), 
                items = l_developerProductTiles_0
            }), 
            UnifiedImpressionsDetector = v1.createElement(l_TagBasedImpressionsDetector_0, {
                parentRef = v25.ref, 
                pageFilter = function(v27) --[[ Line: 84 ]] --[[ Name: pageFilter ]]
                    -- upvalues: v25 (copy), l_Constants_0 (ref), v17 (ref)
                    local v28 = false;
                    if v25.props.locationType == l_Constants_0.StoreEnums.LocationType.Store then
                        v28 = v27 == v17.PassesPage;
                    end;
                    return v28;
                end, 
                requestImpressionsSignal = v25.requestImpressionsSignal, 
                extensions = {
                    l_EdpUnifiedImpressionsReporter_0(v25.props.locationType)
                }
            })
        });
    else
        return v1.createElement(l_DefaultMetricsGridView_0, {
            renderItem = v25.renderDeveloperProduct, 
            getItemHeight = v25.getDeveloperProductsGridItemHeight, 
            getItemMetrics = l_GridMetrics_0.getSmallMetrics, 
            itemPadding = Vector2.new(l_GAME_GRID_CHILD_PADDING_0, l_GAME_GRID_CHILD_PADDING_0), 
            items = l_developerProductTiles_0, 
            LayoutOrder = v25.props.layoutOrder
        });
    end;
end;
local v40 = l_memoize_0(function(v29, v30, v31, v32, v33) --[[ Line: 105 ]]
    -- upvalues: v18 (copy)
    local v34 = {};
    if v32 and v32 == 0 then
        return v34;
    else
        if v29 then
            for v35, v36 in ipairs(v29) do
                if v36.priceInRobux ~= nil and not v36.storePageEnabled then
                    local v37 = "";
                    if v30 and v30[tostring(v36.iconImageAssetId)] then
                        v37 = v30[tostring(v36.iconImageAssetId)].url;
                    end;
                    local v38 = nil;
                    local v39 = nil;
                    if v18() and v33 and v33 > 0 then
                        v38 = math.floor((v35 - 1) / v33) + 1;
                        v39 = (v35 - 1) % v33 + 1;
                    end;
                    table.insert(v34, {
                        universeId = v31, 
                        developerProduct = v36, 
                        developerProductThumbnail = v37, 
                        gridPositionRow = v38, 
                        gridPositionColumn = v39
                    });
                    if v32 and v32 <= #v34 then
                        break;
                    end;
                end;
            end;
        end;
        return v34;
    end;
end);
return (v2.connect(function(v41, v42) --[[ Line: 150 ]]
    -- upvalues: v18 (copy), l_GridMetrics_0 (copy), l_GAME_GRID_CHILD_PADDING_0 (copy), v40 (copy)
    local l_developerProducts_0 = v42.developerProducts;
    local l_universeId_0 = v42.universeId;
    local l_numRows_0 = v42.numRows;
    local l_viewWidth_0 = v42.viewWidth;
    local l_DeveloperProductsThumbnails_0 = v41.DeveloperProductsThumbnails;
    local v48 = nil;
    local v49 = nil;
    if v18() then
        if l_viewWidth_0 then
            v49 = l_GridMetrics_0.getSmallMetrics(l_viewWidth_0, l_GAME_GRID_CHILD_PADDING_0).itemsPerRow;
        end;
        if l_numRows_0 and v49 then
            v48 = v49 * l_numRows_0;
        end;
    elseif l_numRows_0 then
        v48 = l_GridMetrics_0.getSmallMetrics(l_viewWidth_0, l_GAME_GRID_CHILD_PADDING_0).itemsPerRow * l_numRows_0;
    end;
    return {
        developerProductTiles = v40(l_developerProducts_0, l_DeveloperProductsThumbnails_0, l_universeId_0, v48, if v18() then v49 else nil)
    };
end)(v21));