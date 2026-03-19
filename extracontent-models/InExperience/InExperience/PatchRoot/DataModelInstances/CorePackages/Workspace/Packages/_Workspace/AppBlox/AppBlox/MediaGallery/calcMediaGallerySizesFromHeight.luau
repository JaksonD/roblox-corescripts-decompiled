local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local l_ImageSet_0 = require(l_Parent_0.UIBlox).App.ImageSet;
local l_IconSize_0 = l_ImageSet_0.Enum.IconSize;
local l_getIconSize_0 = l_ImageSet_0.getIconSize;
local v4 = require(script.Parent.calcMediaGallerySizesFromWidth);
local v5 = l_getIconSize_0(l_IconSize_0.Medium);
calcMediaGallerySizesFromHeight = function(v6, v7, v8) --[[ Line: 17 ]] --[[ Name: calcMediaGallerySizesFromHeight ]]
    -- upvalues: v5 (copy), v4 (copy)
    local v9 = math.floor((math.floor((v6 - 24) * 1.7777777777777777 * v7) + (v7 - 1) * 12 + v5 * 2 + v5 * 2 * v7) / (v7 + 1));
    return v4(v9, v7, v8);
end;
return calcMediaGallerySizesFromHeight;