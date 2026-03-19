local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_ContentProvider_0 = game:GetService("ContentProvider");
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v5 = require(l_CorePackages_0.Packages.Promise);
local l_ItemTypeEnum_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Enums.ItemTypeEnum;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.Constants;
local v8 = {
    [l_ItemTypeEnum_0.Asset] = true, 
    Hat = true, 
    Face = true, 
    FaceAccessory = true, 
    PantsAccessory = true, 
    EmoteAnimation = true, 
    Gear = true, 
    HairAccessory = true, 
    BackAccessory = true, 
    ShoulderAccessory = true, 
    DressSkirtAccessory = true, 
    FrontAccessory = true
};
local function _(v9) --[[ Line: 42 ]] --[[ Name: getThumbnailTypeForItem ]]
    -- upvalues: v8 (copy), l_Constants_0 (copy), l_ItemTypeEnum_0 (copy)
    if v8[v9] then
        return l_Constants_0.RbxthumbTypes.Asset;
    elseif v9 == l_ItemTypeEnum_0.Bundle then
        return l_Constants_0.RbxthumbTypes.BundleThumbnail;
    elseif v9 == l_ItemTypeEnum_0.Look then
        return l_Constants_0.RbxthumbTypes.Look;
    else
        return l_Constants_0.RbxthumbTypes.Asset;
    end;
end;
local function _(v11, v12) --[[ Line: 67 ]] --[[ Name: getThumbnailSize ]]
    -- upvalues: l_ItemTypeEnum_0 (copy), v4 (copy)
    if v12 then
        return v12;
    elseif v11 == l_ItemTypeEnum_0.Look then
        return v4.CatalogThumbnailTypeToSize.Look._300x450;
    else
        return v4.CatalogThumbnailTypeToSize.Asset._150x150;
    end;
end;
return function(v14, v15) --[[ Line: 93 ]] --[[ Name: fetchCatalogItemThumbnails ]]
    -- upvalues: v5 (copy), v8 (copy), l_Constants_0 (copy), l_ItemTypeEnum_0 (copy), v4 (copy), l_ContentProvider_0 (copy)
    if not v14 or #v14 == 0 then
        return v5.resolve();
    else
        local v16 = {};
        local v17 = false;
        for _, v19 in v14 do
            local l_type_0 = v19.type;
            local v21 = if v8[l_type_0] then l_Constants_0.RbxthumbTypes.Asset else if l_type_0 == l_ItemTypeEnum_0.Bundle then l_Constants_0.RbxthumbTypes.BundleThumbnail else if l_type_0 == l_ItemTypeEnum_0.Look then l_Constants_0.RbxthumbTypes.Look else l_Constants_0.RbxthumbTypes.Asset;
            l_type_0 = v19.thumbnailSize or v15;
            local l_type_1 = v19.type;
            local v23 = if l_type_0 then l_type_0 else if l_type_1 == l_ItemTypeEnum_0.Look then v4.CatalogThumbnailTypeToSize.Look._300x450 else v4.CatalogThumbnailTypeToSize.Asset._150x150;
            table.insert(v16, (("rbxthumb://type=%*&id=%*&%*"):format(v21, v19.id, v23)));
            if v19.type == l_ItemTypeEnum_0.Look and not v17 then
                v17 = true;
            end;
        end;
        return v5.new(function(v24, v25) --[[ Line: 125 ]]
            -- upvalues: l_ContentProvider_0 (ref), v16 (copy)
            task.spawn(function() --[[ Line: 126 ]]
                -- upvalues: l_ContentProvider_0 (ref), v16 (ref), v24 (copy), v25 (copy)
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 127 ]]
                    -- upvalues: l_ContentProvider_0 (ref), v16 (ref)
                    l_ContentProvider_0:PreloadAsync(v16);
                end);
                if l_status_0 then
                    v24();
                    return;
                else
                    v25("Failed to preload thumbnails: " .. tostring(l_result_0));
                    return;
                end;
            end);
        end);
    end;
end;