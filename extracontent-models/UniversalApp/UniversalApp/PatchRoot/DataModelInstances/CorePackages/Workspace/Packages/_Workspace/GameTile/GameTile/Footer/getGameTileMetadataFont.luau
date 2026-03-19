local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local _ = require(l_Parent_0.Foundation);
local l_FFlagLuaAppMigrateGameTileFixConsoleMetadataText_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameTileFixConsoleMetadataText;
return function(v3, v4, v5, v6) --[[ Line: 9 ]] --[[ Name: getGameTileMetadataFont ]]
    -- upvalues: l_FFlagLuaAppMigrateGameTileFixConsoleMetadataText_0 (copy)
    if v6 and v5 then
        if l_FFlagLuaAppMigrateGameTileFixConsoleMetadataText_0 and v3 == false then
            return v5.Typography.BodySmall;
        else
            return v5.Typography.BodyMedium;
        end;
    elseif v3 then
        return v4.Semantic.Typography.Body;
    else
        return v4.Semantic.Typography.CaptionHeader;
    end;
end;