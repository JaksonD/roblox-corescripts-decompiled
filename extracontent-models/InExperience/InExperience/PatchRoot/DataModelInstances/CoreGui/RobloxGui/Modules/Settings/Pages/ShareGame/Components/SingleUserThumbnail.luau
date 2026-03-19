local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_COLORS_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).Constants.COLORS;
local v4 = require(l_Modules_0.Settings.Pages.ShareGame.Constants);
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local l_InviteAvatarThumbnailSize_0 = v4.InviteAvatarThumbnailSize;
return function(v8) --[[ Line: 27 ]]
    -- upvalues: l_Constants_0 (copy), l_InviteAvatarThumbnailSize_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v4 (copy), v1 (copy), l_COLORS_0 (copy)
    local l_user_0 = v8.user;
    local v10 = nil;
    if l_user_0 then
        local v11 = l_Constants_0.RbxThumbnailSizeToNumberSize[l_InviteAvatarThumbnailSize_0];
        v10 = l_getRbxthumbWithTypeSizeAndOptions_0(l_user_0.id, v4.InviteAvatarRbxthumbType, v11);
    end;
    if not v10 then
        v10 = "rbxasset://textures/ui/LuaApp/graphic/ph-avatar-portrait.png";
    end;
    return v1.createElement("ImageLabel", {
        Size = v8.size, 
        Position = v8.position, 
        AnchorPoint = v8.anchorPoint, 
        Image = v10, 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_COLORS_0.FLINT, 
        BackgroundTransparency = v8.backgroundTransparency
    }, {
        Corner = if v8.square then nil else v1.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        })
    });
end;