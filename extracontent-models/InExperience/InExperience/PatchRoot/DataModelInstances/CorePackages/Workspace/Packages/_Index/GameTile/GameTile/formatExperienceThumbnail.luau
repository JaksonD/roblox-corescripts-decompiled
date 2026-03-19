local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local l_FFlagLuaAppSearchGridTiles_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSearchGridTiles;
return function(v2, v3, v4) --[[ Line: 8 ]] --[[ Name: formatExperienceThumbnail ]]
    -- upvalues: l_FFlagLuaAppSearchGridTiles_0 (copy)
    local v5 = 384;
    local v6 = 216;
    if l_FFlagLuaAppSearchGridTiles_0 and v4 then
        v5 = 768;
        v6 = 432;
    end;
    if v2 and v2 ~= "0" then
        return (("rbxthumb://type=Asset&id=%*&w=%*&h=%*"):format(v2, v5, v6));
    else
        return (("rbxthumb://type=GameThumbnail&id=%*&w=%*&h=%*"):format(v3, v5, v6));
    end;
end;