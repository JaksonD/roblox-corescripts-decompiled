local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v2 = require(l_Modules_0.AvatarExperience.Common.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return function(v4, v5, v6, v7, v8) --[[ Line: 8 ]] --[[ Name: getItemSize ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_Font_0 = v4.Font;
    local v10 = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize + (v8 or 0);
    local v11 = v6 or v1.ItemTileType.CatalogItemTile;
    local v12 = v2.GridItemHeightGetter(v11, v10, v7);
    return Vector2.new(v5, v12(v5));
end;