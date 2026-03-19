local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_VerticalTile_0 = v2.App.Tile.VerticalTile;
local l_VerticalTileThumbnail_0 = v2.App.Tile.VerticalTileThumbnail;
return function(v5) --[[ Line: 29 ]] --[[ Name: AppFeaturedTile ]]
    -- upvalues: v1 (copy), l_VerticalTileThumbnail_0 (copy), l_VerticalTile_0 (copy)
    local v6 = v5.hasBackground or false;
    local v7 = 0;
    if v5.renderActionRow then
        v7 = v5.hasBackground and 48 or 40;
    end;
    local v8 = v1.useCallback(function() --[[ Line: 37 ]]
        -- upvalues: v1 (ref), l_VerticalTileThumbnail_0 (ref), v6 (copy), v5 (copy)
        return v1.createElement(l_VerticalTileThumbnail_0, {
            aspectRatio = 1, 
            isTopRounded = true, 
            isBottomRounded = not v6, 
            thumbnail = v5.thumbnail
        });
    end, {
        v5.hasBackground, 
        v5.thumbnail
    });
    return v1.createElement(l_VerticalTile_0, {
        hasOutline = v5.hasOutline, 
        hasBackground = v6, 
        isHoverEnabled = v6, 
        isOverlayVisible = v6, 
        onActivated = v5.onActivated, 
        renderTopContent = v8, 
        renderBottomContent = v5.renderBottomPanel, 
        renderFooterRow = v5.renderActionRow, 
        reservedBottomHeight = v7
    });
end;