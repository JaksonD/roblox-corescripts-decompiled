local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v4 = require(l_Modules_0.LuaApp.SearchUuid);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_CatalogCategories_0 = v5.Enums.CatalogCategories;
local l_CatalogSubcategories_0 = v5.Enums.CatalogSubcategories;
local l_CatalogSDUICategoryIds_0 = v5.Enums.CatalogSDUICategoryIds;
local v9 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_AvatarEditorCategories_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.AvatarEditorCategories;
local l_FFlagAXCatalogCategoriesSDUI_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogCategoriesSDUI;
local v12 = {
    Name = v2.AssetCategories.Emotes, 
    Title = "Feature.Avatar.Heading.Emotes", 
    IconOn = "icons/menu/clothing/emotes_on", 
    IconOff = "icons/menu/clothing/emotes_off", 
    CameraZoomRadius = v2.AnimationCategoryCameraZoomRadius, 
    NavigationKey = if v9() then l_AvatarEditorCategories_0.Emotes else nil, 
    EquipSlotsCount = 8, 
    RenderItemTiles = true, 
    PageType = v2.PageType.Emotes, 
    CanAnimateCameraBasedMood = false, 
    RecommendationsType = v3.RecommendationsType.Asset, 
    MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
        CategoryKey = l_CatalogCategories_0.AllAnimations, 
        SubcategoryKey = l_CatalogSubcategories_0.Emotes
    }, 
    MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
        CategoryId = l_CatalogSDUICategoryIds_0.AllAnimations:rawValue(), 
        SubcategoryId = l_CatalogSDUICategoryIds_0.Emotes:rawValue()
    } else nil, 
    AssetTypeIdStrings = {
        v2.AssetTypeIdStrings.EmoteAnimation
    }, 
    SearchUuid = v4(), 
    Id = "Emotes", 
    ShowName = true
};
return function() --[[ Line: 59 ]] --[[ Name: getEmotesCategory ]]
    -- upvalues: v12 (copy)
    return v12;
end;