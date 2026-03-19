local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_FFlagAXInventoryDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXInventoryDurablesSupport;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.GrantAsset);
local v5 = require(l_Modules_0.AvatarExperience.Common.Actions.AddNewAssetNotification);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local v7 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local function v22(v11, v12, v13) --[[ Line: 23 ]]
    -- upvalues: l_AvatarScreen_0 (copy), v9 (copy)
    local v14 = v12 == l_AvatarScreen_0.AvatarEditor;
    local l_category_0 = v11.AvatarExperience.AvatarEditor.Categories.category;
    local l_subcategory_0 = v11.AvatarExperience.AvatarEditor.Categories.subcategory;
    local v17 = v9()[l_category_0];
    if v14 then
        local v18 = v17 and v17.Subcategories or nil;
        local v19 = v18 and v18[l_subcategory_0].AssetTypeIdStrings or v17.AssetTypeIdStrings;
        if v19 then
            for _, v21 in v19 do
                if v21 == v13 then
                    return true;
                end;
            end;
        end;
    end;
    return false;
end;
return function(v23, v24, v25, v26, v27) --[[ Line: 45 ]]
    -- upvalues: v1 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), v4 (copy), v6 (copy), v7 (copy), v22 (copy), v5 (copy)
    v1.isType(v24, "string", "GrantAsset request expects assetId");
    v1.isType(v23, "string", "GrantAsset request expects assetTypeIdString");
    return function(v28) --[[ Line: 48 ]]
        -- upvalues: l_FFlagAXInventoryDurablesSupport_0 (ref), v4 (ref), v23 (copy), v24 (copy), v6 (ref), v25 (copy), v26 (copy), v7 (ref), v22 (ref), v27 (copy), v5 (ref)
        local l_OwnedItemIdsBySubtype_0 = v28:getState().AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype;
        local v30 = l_FFlagAXInventoryDurablesSupport_0 and true or nil;
        v28:dispatch(v4(v23, v24));
        v28:dispatch(v6(v25, v26, v24, v7.ItemType.Asset, if l_FFlagAXInventoryDurablesSupport_0 then v30 else nil));
        if l_OwnedItemIdsBySubtype_0 ~= v28:getState().AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype and not v22(v28:getState(), v27, v23) then
            v28:dispatch(v5(v23));
        end;
    end;
end;