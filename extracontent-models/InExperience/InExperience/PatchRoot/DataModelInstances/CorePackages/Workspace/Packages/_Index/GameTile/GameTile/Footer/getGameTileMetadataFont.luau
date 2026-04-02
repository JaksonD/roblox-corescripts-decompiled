local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local _ = require(l_Parent_0.Foundation);
local l_FFlagLuaAppMigrateGameTileFixConsoleMetadataText_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameTileFixConsoleMetadataText;
local l_FFlagLuaAppNarrowTileSmallerFooterFont_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont;
return function(v4, v5, v6, v7, v8) --[[ Line: 10 ]] --[[ Name: getGameTileMetadataFont ]]
    -- upvalues: l_FFlagLuaAppNarrowTileSmallerFooterFont_0 (copy), l_FFlagLuaAppMigrateGameTileFixConsoleMetadataText_0 (copy)
    if v7 and v6 then
        if l_FFlagLuaAppNarrowTileSmallerFooterFont_0 and v8 or l_FFlagLuaAppMigrateGameTileFixConsoleMetadataText_0 and v4 == false then
            return v6.Typography.BodySmall;
        else
            return v6.Typography.BodyMedium;
        end;
    elseif v4 then
        return v5.Semantic.Typography.Body;
    else
        return v5.Semantic.Typography.CaptionHeader;
    end;
end;