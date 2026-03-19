local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameCollections");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_GameTileConstants_0 = require(l_Parent_0.GameTile).GameTileConstants;
local v5 = require(l_Parent_0.Responsive);
local l_useBreakpointXOrSmaller_0 = v5.useBreakpointXOrSmaller;
local v7 = require(l_script_FirstAncestor_0.GameCollectionLayoutCalculators);
local l_FFlagLuaAppFixHomeGridPlaceholderFlowIssues_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixHomeGridPlaceholderFlowIssues;
return function(v9, v10, v11, v12, v13, v14, v15, v16) --[[ Line: 20 ]] --[[ Name: useGetGameTileHeight ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useBreakpointXOrSmaller_0 (copy), v5 (copy), l_FFlagLuaAppFixHomeGridPlaceholderFlowIssues_0 (copy), l_GameTileConstants_0 (copy), v2 (copy), v7 (copy)
    local v17 = l_useDesignTokens_0();
    local v18 = nil;
    local v19 = l_useBreakpointXOrSmaller_0(v5.Keys.Small);
    v18 = if if l_FFlagLuaAppFixHomeGridPlaceholderFlowIssues_0 then v19 and v14 and v14 > 0 else v19 and v14 > 0 then l_GameTileConstants_0.TileTextLines[v10].largeMetadataTextLines else l_GameTileConstants_0.TileTextLines[v10].metadataTextLines;
    return v2.useCallback(function(v20) --[[ Line: 42 ]]
        -- upvalues: v7 (ref), v9 (copy), v10 (copy), v17 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy), v15 (copy), v16 (copy), v18 (ref)
        return v7.calculateTileHeightFromWidth(v20, v9, v10, v17, v11, v12, v13, v14, v15, v16, v18);
    end, {
        v17, 
        v9, 
        v10, 
        v11, 
        v12, 
        v13, 
        v14, 
        v15, 
        v16, 
        v18
    });
end;