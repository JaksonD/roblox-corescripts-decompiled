local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UserLib);
local l_Constants_0 = v3.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v3.Utils.getRbxthumbWithTypeSizeAndOptions;
local v6 = require(l_script_FirstAncestor_0.Common.Enums);
local v7 = require(l_script_FirstAncestor_0.Hooks.useProfileFormFactor);
local v8 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local v9 = require(l_script_FirstAncestor_0.Contexts.ProfileScrollContext.useProfileScrollContext);
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableCoverPhotoPeekViewFix);
local v11 = game:DefineFastFlag("ProfilePlatformUpdateCoverPhotoSize", false);
local v12 = require(l_script_FirstAncestor_0.Components.CoverPhoto.CoverPhoto);
return function(v13) --[[ Line: 28 ]] --[[ Name: CoverPhotoContainer ]]
    -- upvalues: v8 (copy), v6 (copy), v7 (copy), v9 (copy), v11 (copy), l_Constants_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v2 (copy), v12 (copy), v10 (copy)
    local v14 = v8(v6.Components.CoverPhoto) or {};
    local v15 = v7();
    local v16 = v9();
    local v17 = v16.scrollY / 2;
    if v14.coverPhotoId == nil then
        return nil;
    else
        local v18 = if v11 then string.format("rbxthumb://type=%s&id=%s&w=%d&h=%d", l_Constants_0.RbxthumbTypes.Asset, v14.coverPhotoId, 1440, 456) else l_getRbxthumbWithTypeSizeAndOptions_0(v14.coverPhotoId, l_Constants_0.RbxthumbTypes.Asset, 420);
        return v2.createElement(v12, {
            layoutOrder = v13.layoutOrder, 
            coverPhotoThumbnail = v18, 
            profileFormFactorInfo = v15, 
            parallaxOffset = v17, 
            peekViewOpenPercent = if v10 then v16.peekViewOpenPercent else nil
        });
    end;
end;