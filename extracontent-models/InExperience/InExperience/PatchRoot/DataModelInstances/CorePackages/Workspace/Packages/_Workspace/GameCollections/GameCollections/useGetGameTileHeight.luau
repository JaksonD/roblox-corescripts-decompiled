local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameCollections");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_GameTileConstants_0 = require(l_Parent_0.GameTile).GameTileConstants;
local v5 = require(l_Parent_0.Responsive);
local l_useBreakpointXOrSmaller_0 = v5.useBreakpointXOrSmaller;
local v7 = require(l_script_FirstAncestor_0.GameCollectionLayoutCalculators);
local l_FFlagLuaAppFixHomeGridPlaceholderFlowIssues_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixHomeGridPlaceholderFlowIssues;
local l_FFlagLuaAppNarrowTileHideRating_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppNarrowTileHideRating;
local l_FFlagLuaAppNarrowTileHidePlayerCount_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount;
return function(v11, v12, v13, v14, v15, v16, v17, v18, v19) --[[ Line: 22 ]] --[[ Name: useGetGameTileHeight ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useBreakpointXOrSmaller_0 (copy), v5 (copy), l_FFlagLuaAppFixHomeGridPlaceholderFlowIssues_0 (copy), l_FFlagLuaAppNarrowTileHideRating_0 (copy), l_FFlagLuaAppNarrowTileHidePlayerCount_0 (copy), l_GameTileConstants_0 (copy), v2 (copy), v7 (copy)
    local v20 = l_useDesignTokens_0();
    local v21 = nil;
    local v22 = l_useBreakpointXOrSmaller_0(v5.Keys.Small);
    v21 = if if l_FFlagLuaAppFixHomeGridPlaceholderFlowIssues_0 then v22 and v16 and v16 > 0 and not ((not not l_FFlagLuaAppNarrowTileHideRating_0 or l_FFlagLuaAppNarrowTileHidePlayerCount_0) and v19) else v22 and v16 > 0 and not ((not not l_FFlagLuaAppNarrowTileHideRating_0 or l_FFlagLuaAppNarrowTileHidePlayerCount_0) and v19) then l_GameTileConstants_0.TileTextLines[v12].largeMetadataTextLines else l_GameTileConstants_0.TileTextLines[v12].metadataTextLines;
    return v2.useCallback(function(v23) --[[ Line: 50 ]]
        -- upvalues: v7 (ref), v11 (copy), v12 (copy), v20 (copy), v13 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy), v18 (copy), v21 (ref)
        return v7.calculateTileHeightFromWidth(v23, v11, v12, v20, v13, v14, v15, v16, v17, v18, v21);
    end, {
        v20, 
        v11, 
        v12, 
        v13, 
        v14, 
        v15, 
        v16, 
        v17, 
        v18, 
        v21, 
        if not not l_FFlagLuaAppNarrowTileHideRating_0 or l_FFlagLuaAppNarrowTileHidePlayerCount_0 then v19 else nil
    });
end;