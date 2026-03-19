local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local l_ImageSet_0 = require(l_Parent_0.UIBlox).App.ImageSet;
local l_IconSize_0 = l_ImageSet_0.Enum.IconSize;
local v3 = l_ImageSet_0.getIconSize(l_IconSize_0.Medium);
calcMediaGallerySizesFromWidth = function(v4, v5, v6) --[[ Line: 15 ]] --[[ Name: calcMediaGallerySizesFromWidth ]]
    -- upvalues: v3 (copy)
    local v7 = if v6 then v4 else v4 - v3 * 2;
    local v8 = math.floor(v7 / 1.7777777777777777);
    local v9 = nil;
    v9 = if v6 then math.floor((v4 - (v5 - 1) * 12) / v5) else math.floor((v4 - (v5 - 1) * 12 - v3 * 2) / v5);
    local v10 = if v6 then v4 + v3 * 2 else v4;
    local v11 = math.floor(v9 / 1.7777777777777777);
    local v12 = v8 + v11 + 24;
    return {
        contentSize = UDim2.fromOffset(v4, v12), 
        previewSize = UDim2.fromOffset(v7, v8), 
        paginationSize = UDim2.fromOffset(v10, v11), 
        thumbnailSize = UDim2.fromOffset(v9, v11)
    };
end;
return calcMediaGallerySizesFromWidth;