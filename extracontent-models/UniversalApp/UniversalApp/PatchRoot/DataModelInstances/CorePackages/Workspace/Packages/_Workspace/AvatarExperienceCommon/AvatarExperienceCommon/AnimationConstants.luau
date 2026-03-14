local v0 = game:DefineFastInt("AXCategoryPillPositionAnimationFrequency", 300) / 100;
local v1 = game:DefineFastInt("AXCategoryPillPositionAnimationDampingRatio", 100) / 100;
local v2 = game:DefineFastInt("AXCategoryPillTransparencyAnimationFrequency", 150) / 100;
local v3 = game:DefineFastInt("AXCategoryPillTransparencyAnimationDampingRatio", 100) / 100;
local v4 = game:DefineFastInt("AXSubcategoryPillFadeAnimationFrequency", 300) / 100;
local v5 = game:DefineFastInt("AXSubcategoryPillFadeAnimationDampingRatio", 100) / 100;
local v6 = game:DefineFastInt("AXSubcategoryPillFadeAnimationDurationMs", 500);
return {
    FIntAXCategoryPillPositionAnimationFrequency = v0, 
    FIntAXCategoryPillPositionAnimationDampingRatio = v1, 
    FIntAXCategoryPillTransparencyAnimationFrequency = v2, 
    FIntAXCategoryPillTransparencyAnimationDampingRatio = v3, 
    FIntAXSubcategoryPillFadeAnimationFrequency = v4, 
    FIntAXSubcategoryPillFadeAnimationDampingRatio = v5, 
    FIntAXSubcategoryPillFadeAnimationDurationMs = v6
};