local l_CorePackages_0 = game:GetService("CorePackages");
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v3 = require(l_script_FirstAncestor_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.NavigateDownToAvatarScreen);
local l_FFlagAXFixPurchaseSurfaceLogging_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXFixPurchaseSurfaceLogging;
return function(v5, v6, _, v8, v9) --[[ Line: 15 ]]
    -- upvalues: l_FFlagAXFixPurchaseSurfaceLogging_0 (copy), v3 (copy), l_AvatarScreen_0 (copy)
    return function(v10) --[[ Line: 16 ]]
        -- upvalues: v6 (copy), v5 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v8 (copy), v9 (copy), v3 (ref), l_AvatarScreen_0 (ref)
        local v11 = v6 .. v5;
        local v12 = {
            itemId = v5, 
            itemType = v6, 
            mountAsFullView = true, 
            mountAnimation = false, 
            fromProfile = not l_FFlagAXFixPurchaseSurfaceLogging_0 or v8, 
            fromSurface = if l_FFlagAXFixPurchaseSurfaceLogging_0 then v9 else nil, 
            itemDetailsPeekViewRefs = {}
        };
        v10:dispatch(v3(l_AvatarScreen_0.ItemDetails, v11, v12));
    end;
end;