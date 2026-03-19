local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v4 = require(l_Modules_0.LuaApp.SearchUuid);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_CatalogCategories_0 = v5.Enums.CatalogCategories;
local l_CatalogSDUICategoryIds_0 = v5.Enums.CatalogSDUICategoryIds;
local l_FFlagAXCatalogCategoriesSDUI_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogCategoriesSDUI;
local l_PhotoboothCategories_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperiencePhotobooth).Enums.PhotoboothCategories;
return {
    [l_PhotoboothCategories_0.All] = {
        Name = l_PhotoboothCategories_0.All, 
        NavigationKey = l_PhotoboothCategories_0.All, 
        Title = "Feature.Avatar.Heading.All", 
        CameraZoomRadius = v2.AnimationCategoryCameraZoomRadius, 
        RenderItemTiles = true, 
        CanAnimateCameraBasedMood = false, 
        RecommendationsType = v3.RecommendationsType.Asset, 
        MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
            CategoryKey = l_CatalogCategories_0.AllAnimations, 
            SubcategoryKey = nil
        }, 
        MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
            CategoryId = l_CatalogSDUICategoryIds_0.AllAnimations:rawValue(), 
            SubcategoryId = nil
        } else nil, 
        AssetTypeIdStrings = {
            v2.AssetTypeIdStrings.EmoteAnimation, 
            v2.AssetTypeIdStrings.IdleAnimation, 
            v2.AssetTypeIdStrings.WalkAnimation, 
            v2.AssetTypeIdStrings.RunAnimation, 
            v2.AssetTypeIdStrings.JumpAnimation, 
            v2.AssetTypeIdStrings.FallAnimation, 
            v2.AssetTypeIdStrings.ClimbAnimation, 
            v2.AssetTypeIdStrings.SwimAnimation
        }, 
        SearchUuid = v4(), 
        Subcategories = nil
    }, 
    [l_PhotoboothCategories_0.Emotes] = {
        Name = l_PhotoboothCategories_0.Emotes, 
        NavigationKey = l_PhotoboothCategories_0.Emotes, 
        Title = "Feature.Avatar.Heading.Emotes", 
        CameraZoomRadius = v2.AnimationCategoryCameraZoomRadius, 
        RenderItemTiles = true, 
        CanAnimateCameraBasedMood = false, 
        RecommendationsType = v3.RecommendationsType.Asset, 
        MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
            CategoryKey = l_CatalogCategories_0.AllAnimations, 
            SubcategoryKey = nil
        }, 
        MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
            CategoryId = l_CatalogSDUICategoryIds_0.AllAnimations:rawValue(), 
            SubcategoryId = nil
        } else nil, 
        AssetTypeIdStrings = {
            v2.AssetTypeIdStrings.EmoteAnimation
        }, 
        SearchUuid = v4(), 
        Subcategories = nil
    }, 
    [l_PhotoboothCategories_0.Idle] = {
        Name = l_PhotoboothCategories_0.Idle, 
        NavigationKey = l_PhotoboothCategories_0.Idle, 
        Title = "Feature.Avatar.Label.Idle", 
        CameraZoomRadius = v2.AnimationCategoryCameraZoomRadius, 
        RenderItemTiles = true, 
        CanAnimateCameraBasedMood = false, 
        RecommendationsType = v3.RecommendationsType.Asset, 
        MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
            CategoryKey = l_CatalogCategories_0.AllAnimations, 
            SubcategoryKey = nil
        }, 
        MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
            CategoryId = l_CatalogSDUICategoryIds_0.AllAnimations:rawValue(), 
            SubcategoryId = nil
        } else nil, 
        AssetTypeIdStrings = {
            v2.AssetTypeIdStrings.IdleAnimation
        }, 
        SearchUuid = v4(), 
        Subcategories = nil
    }, 
    [l_PhotoboothCategories_0.Walk] = {
        Name = l_PhotoboothCategories_0.Walk, 
        NavigationKey = l_PhotoboothCategories_0.Walk, 
        Title = "Feature.Avatar.Label.Walk", 
        CameraZoomRadius = v2.AnimationCategoryCameraZoomRadius, 
        RenderItemTiles = true, 
        CanAnimateCameraBasedMood = false, 
        RecommendationsType = v3.RecommendationsType.Asset, 
        MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
            CategoryKey = l_CatalogCategories_0.AllAnimations, 
            SubcategoryKey = nil
        }, 
        MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
            CategoryId = l_CatalogSDUICategoryIds_0.AllAnimations:rawValue(), 
            SubcategoryId = nil
        } else nil, 
        AssetTypeIdStrings = {
            v2.AssetTypeIdStrings.WalkAnimation
        }, 
        SearchUuid = v4(), 
        Subcategories = nil
    }, 
    [l_PhotoboothCategories_0.Run] = {
        Name = l_PhotoboothCategories_0.Run, 
        NavigationKey = l_PhotoboothCategories_0.Run, 
        Title = "Feature.Avatar.Label.Run", 
        CameraZoomRadius = v2.AnimationCategoryCameraZoomRadius, 
        RenderItemTiles = true, 
        CanAnimateCameraBasedMood = false, 
        RecommendationsType = v3.RecommendationsType.Asset, 
        MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
            CategoryKey = l_CatalogCategories_0.AllAnimations, 
            SubcategoryKey = nil
        }, 
        MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
            CategoryId = l_CatalogSDUICategoryIds_0.AllAnimations:rawValue(), 
            SubcategoryId = nil
        } else nil, 
        AssetTypeIdStrings = {
            v2.AssetTypeIdStrings.RunAnimation
        }, 
        SearchUuid = v4(), 
        Subcategories = nil
    }, 
    [l_PhotoboothCategories_0.Jump] = {
        Name = l_PhotoboothCategories_0.Jump, 
        NavigationKey = l_PhotoboothCategories_0.Jump, 
        Title = "Feature.Avatar.Label.Jump", 
        CameraZoomRadius = v2.AnimationCategoryCameraZoomRadius, 
        RenderItemTiles = true, 
        CanAnimateCameraBasedMood = false, 
        RecommendationsType = v3.RecommendationsType.Asset, 
        MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
            CategoryKey = l_CatalogCategories_0.AllAnimations, 
            SubcategoryKey = nil
        }, 
        MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
            CategoryId = l_CatalogSDUICategoryIds_0.AllAnimations:rawValue(), 
            SubcategoryId = nil
        } else nil, 
        AssetTypeIdStrings = {
            v2.AssetTypeIdStrings.JumpAnimation
        }, 
        SearchUuid = v4(), 
        Subcategories = nil
    }, 
    [l_PhotoboothCategories_0.Fall] = {
        Name = l_PhotoboothCategories_0.Fall, 
        NavigationKey = l_PhotoboothCategories_0.Fall, 
        Title = "Feature.Avatar.Label.Fall", 
        CameraZoomRadius = v2.AnimationCategoryCameraZoomRadius, 
        RenderItemTiles = true, 
        CanAnimateCameraBasedMood = false, 
        RecommendationsType = v3.RecommendationsType.Asset, 
        MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
            CategoryKey = l_CatalogCategories_0.AllAnimations, 
            SubcategoryKey = nil
        }, 
        MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
            CategoryId = l_CatalogSDUICategoryIds_0.AllAnimations:rawValue(), 
            SubcategoryId = nil
        } else nil, 
        AssetTypeIdStrings = {
            v2.AssetTypeIdStrings.FallAnimation
        }, 
        SearchUuid = v4(), 
        Subcategories = nil
    }, 
    [l_PhotoboothCategories_0.Climb] = {
        Name = l_PhotoboothCategories_0.Climb, 
        NavigationKey = l_PhotoboothCategories_0.Climb, 
        Title = "Feature.Avatar.Label.Climb", 
        CameraZoomRadius = v2.AnimationCategoryCameraZoomRadius, 
        RenderItemTiles = true, 
        CanAnimateCameraBasedMood = false, 
        RecommendationsType = v3.RecommendationsType.Asset, 
        MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
            CategoryKey = l_CatalogCategories_0.AllAnimations, 
            SubcategoryKey = nil
        }, 
        MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
            CategoryId = l_CatalogSDUICategoryIds_0.AllAnimations:rawValue(), 
            SubcategoryId = nil
        } else nil, 
        AssetTypeIdStrings = {
            v2.AssetTypeIdStrings.ClimbAnimation
        }, 
        SearchUuid = v4(), 
        Subcategories = nil
    }, 
    [l_PhotoboothCategories_0.Swim] = {
        Name = l_PhotoboothCategories_0.Swim, 
        NavigationKey = l_PhotoboothCategories_0.Swim, 
        Title = "Feature.Avatar.Label.Swim", 
        CameraZoomRadius = v2.AnimationCategoryCameraZoomRadius, 
        RenderItemTiles = true, 
        CanAnimateCameraBasedMood = false, 
        RecommendationsType = v3.RecommendationsType.Asset, 
        MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
            CategoryKey = l_CatalogCategories_0.AllAnimations, 
            SubcategoryKey = nil
        }, 
        MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
            CategoryId = l_CatalogSDUICategoryIds_0.AllAnimations:rawValue(), 
            SubcategoryId = nil
        } else nil, 
        AssetTypeIdStrings = {
            v2.AssetTypeIdStrings.SwimAnimation
        }, 
        SearchUuid = v4(), 
        Subcategories = nil
    }
};