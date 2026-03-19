local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Foundation);
local v4 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useTokens_0 = v3.Hooks.useTokens;
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_PhotoboothCategories_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperiencePhotobooth).Enums.PhotoboothCategories;
local v8 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local _ = require(l_Modules_0.AvatarExperience.Photobooth.Components.Scenes.PhotoboothSceneData);
local l_FFlagAXPhotoboothBugBashFixes_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXPhotoboothBugBashFixes;
return function(v11, v12) --[[ Line: 30 ]] --[[ Name: usePhotoboothAnimationsProps ]]
    -- upvalues: l_useTokens_0 (copy), l_useSelector_0 (copy), v8 (copy), v2 (copy), l_PhotoboothCategories_0 (copy), l_FFlagAXPhotoboothBugBashFixes_0 (copy)
    local v13 = l_useTokens_0();
    local v14 = l_useSelector_0(v8);
    local v15, v16 = v2.useState(l_PhotoboothCategories_0.All);
    local v18 = v2.useCallback(function(v17) --[[ Line: 36 ]]
        -- upvalues: v15 (copy), v16 (copy), l_PhotoboothCategories_0 (ref)
        if v15 == v17 then
            v16(l_PhotoboothCategories_0.All);
            return;
        else
            v16(v17);
            return;
        end;
    end, {
        v15
    });
    return {
        tokens = v13, 
        isPortrait = v14, 
        position = v11, 
        animationFilter = v15, 
        onAnimationFilterChanged = v18, 
        onTileClicked = if l_FFlagAXPhotoboothBugBashFixes_0 then v12 else nil
    };
end;