local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_GridMetrics_0 = v6.App.Grid.GridMetrics;
local l_DefaultMetricsGridView_0 = v6.App.Grid.DefaultMetricsGridView;
local v9 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v11 = require(l_Modules_0.LuaApp.Components.Passes.PassTile);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_TagBasedImpressionsDetector_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).TagBasedImpressionsDetector;
local v14 = require(l_CorePackages_0.Workspace.Packages.EdpStoreAnalytics);
local l_Constants_0 = v14.Constants;
local l_EdpUnifiedImpressionsReporter_0 = v14.EdpUnifiedImpressionsReporter;
local v17 = require(l_Modules_0.LuaApp.Flags.FFlagEnableEdpStoreUnifiedLogging);
local v18 = require(l_Modules_0.LuaApp.AppPage);
local v19 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableEdpStoreClickLogging);
local v20 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableEdpStoreGridPositionLogging);
local l_GAME_GRID_CHILD_PADDING_0 = v9.Constants.GAME_GRID_CHILD_PADDING;
local l_GAME_GRID_TILE_FOOTER_HEIGHT_0 = v9.Constants.GAME_GRID_TILE_FOOTER_HEIGHT;
local v23 = v1.PureComponent:extend("PassesGrid");
v23.validateProps = v5.strictInterface({
    universeId = v5.string, 
    passes = v5.optional(v5.table), 
    numRows = v5.optional(v5.number), 
    viewWidth = v5.optional(v5.number), 
    layoutOrder = v5.optional(v5.integer), 
    textSizeOffset = v5.number, 
    locationType = if v19() then v5.optional(v5.string) else nil, 
    passTiles = v5.optional(v5.table)
});
v23.init = function(v24) --[[ Line: 48 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v11 (copy), l_GAME_GRID_TILE_FOOTER_HEIGHT_0 (copy), v17 (copy), l_Signal_0 (copy)
    v24.renderPass = function(v25) --[[ Line: 49 ]]
        -- upvalues: v1 (ref), v11 (ref)
        return v1.createElement(v11, v25);
    end;
    v24.getPassesGridItemHeight = function(v26) --[[ Line: 53 ]]
        -- upvalues: l_GAME_GRID_TILE_FOOTER_HEIGHT_0 (ref), v24 (copy)
        return v26 + l_GAME_GRID_TILE_FOOTER_HEIGHT_0 + v24.props.textSizeOffset;
    end;
    if v17 then
        v24.ref = v1.createRef();
        v24.requestImpressionsSignal = l_Signal_0.new();
    end;
end;
v23.render = function(v27) --[[ Line: 63 ]] --[[ Name: render ]]
    -- upvalues: v17 (copy), v1 (copy), l_DefaultMetricsGridView_0 (copy), l_GridMetrics_0 (copy), l_GAME_GRID_CHILD_PADDING_0 (copy), l_TagBasedImpressionsDetector_0 (copy), v18 (copy), l_Constants_0 (copy), l_Logging_0 (copy), l_EdpUnifiedImpressionsReporter_0 (copy)
    local l_passTiles_0 = v27.props.passTiles;
    if v17 then
        return v1.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = v27.props.layoutOrder, 
            [v1.Change.AbsolutePosition] = function() --[[ Line: 74 ]]
                -- upvalues: v27 (copy)
                v27.requestImpressionsSignal:fire();
            end
        }, {
            GridView = v1.createElement(l_DefaultMetricsGridView_0, {
                [v1.Ref] = v27.ref, 
                renderItem = v27.renderPass, 
                getItemHeight = v27.getPassesGridItemHeight, 
                getItemMetrics = l_GridMetrics_0.getSmallMetrics, 
                itemPadding = Vector2.new(l_GAME_GRID_CHILD_PADDING_0, l_GAME_GRID_CHILD_PADDING_0), 
                items = l_passTiles_0
            }), 
            UnifiedImpressionsDetector = v1.createElement(l_TagBasedImpressionsDetector_0, {
                parentRef = v27.ref, 
                pageFilter = function(v29) --[[ Line: 88 ]] --[[ Name: pageFilter ]]
                    -- upvalues: v18 (ref), v27 (copy), l_Constants_0 (ref), l_Logging_0 (ref)
                    if v29 == v18.GameDetail then
                        return v27.props.locationType == l_Constants_0.StoreEnums.LocationType.Edp;
                    elseif v29 == v18.PassesPage then
                        return v27.props.locationType == l_Constants_0.StoreEnums.LocationType.Store;
                    else
                        l_Logging_0.warn("Skip Impression Logging for page: " .. v29);
                        return false;
                    end;
                end, 
                requestImpressionsSignal = v27.requestImpressionsSignal, 
                extensions = {
                    l_EdpUnifiedImpressionsReporter_0(v27.props.locationType)
                }
            })
        });
    else
        return v1.createElement(l_DefaultMetricsGridView_0, {
            renderItem = v27.renderPass, 
            getItemHeight = v27.getPassesGridItemHeight, 
            getItemMetrics = l_GridMetrics_0.getSmallMetrics, 
            itemPadding = Vector2.new(l_GAME_GRID_CHILD_PADDING_0, l_GAME_GRID_CHILD_PADDING_0), 
            items = l_passTiles_0, 
            LayoutOrder = v27.props.layoutOrder
        });
    end;
end;
local v42 = l_memoize_0(function(v30, v31, v32, v33, v34, v35) --[[ Line: 114 ]]
    -- upvalues: v20 (copy), v19 (copy)
    local v36 = {};
    if v33 and v33 == 0 then
        return v36;
    else
        if v30 then
            for v37, v38 in ipairs(v30) do
                if v38.price ~= nil then
                    local v39 = "";
                    if v31 and v31[tostring(v38.id)] then
                        v39 = v31[tostring(v38.id)].url;
                    end;
                    local v40 = nil;
                    local v41 = nil;
                    if v20() and v35 and v35 > 0 then
                        v40 = math.floor((v37 - 1) / v35) + 1;
                        v41 = (v37 - 1) % v35 + 1;
                    end;
                    table.insert(v36, {
                        universeId = v32, 
                        pass = v38, 
                        passThumbnail = v39, 
                        locationType = if v19() then v34 else nil, 
                        gridPositionRow = v40, 
                        gridPositionColumn = v41
                    });
                    if v33 and v33 <= #v36 then
                        break;
                    end;
                end;
            end;
        end;
        return v36;
    end;
end);
return (v2.connect(function(v43, v44) --[[ Line: 156 ]]
    -- upvalues: v19 (copy), v20 (copy), l_GridMetrics_0 (copy), l_GAME_GRID_CHILD_PADDING_0 (copy), v42 (copy)
    local l_passes_0 = v44.passes;
    local l_universeId_0 = v44.universeId;
    local l_numRows_0 = v44.numRows;
    local l_viewWidth_0 = v44.viewWidth;
    local l_PassesThumbnails_0 = v43.PassesThumbnails;
    local v50 = if v19() then v44.locationType else nil;
    local v51 = nil;
    local v52 = nil;
    if v20() then
        if l_viewWidth_0 then
            v52 = l_GridMetrics_0.getSmallMetrics(l_viewWidth_0, l_GAME_GRID_CHILD_PADDING_0).itemsPerRow;
        end;
        if l_numRows_0 and v52 then
            v51 = v52 * l_numRows_0;
        end;
    elseif l_numRows_0 then
        v51 = l_GridMetrics_0.getSmallMetrics(l_viewWidth_0, l_GAME_GRID_CHILD_PADDING_0).itemsPerRow * l_numRows_0;
    end;
    return {
        passTiles = v42(l_passes_0, l_PassesThumbnails_0, l_universeId_0, v51, if v19() then v50 else nil, if v20() then v52 else nil)
    };
end)(v23));