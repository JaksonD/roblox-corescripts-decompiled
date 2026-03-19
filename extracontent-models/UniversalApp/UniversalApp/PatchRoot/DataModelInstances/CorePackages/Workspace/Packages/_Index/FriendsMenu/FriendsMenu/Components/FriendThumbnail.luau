local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_Parent_0.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local v4 = require(l_Parent_0.UserLib);
local v5 = require(l_Parent_0.UIBlox);
local v6 = require(l_Parent_0.Foundation);
local l_Radius_0 = v6.Enums.Radius;
local l_Skeleton_0 = v6.Skeleton;
local l_UserModel_0 = require(l_Parent_0.UserLib).Models.UserModel;
local _ = require(l_script_FirstAncestor_0.friendsMenuModalType);
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = v5.App.Constant.IconSize;
local l_Images_0 = v5.App.ImageSet.Images;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_Constants_0 = v4.Utils.Constants;
local l_Size150x150_0 = l_Constants_0.RbxThumbnailSizes.Size150x150;
local l_AvatarHeadShot_0 = l_Constants_0.RbxthumbTypes.AvatarHeadShot;
local v18 = {
    [l_UserModel_0.PresenceType.ONLINE] = {
        Image = "component_assets/circle_16", 
        Color = Color3.fromRGB(0, 180, 109), 
        Size = UDim2.new(0, 12, 0, 12)
    }, 
    [l_UserModel_0.PresenceType.IN_GAME] = {
        Image = "icons/menu/games_small"
    }, 
    [l_UserModel_0.PresenceType.IN_STUDIO] = {
        Image = "icons/logo/studiologo_small"
    }
};
return function(v19) --[[ Line: 55 ]]
    -- upvalues: l_useStyle_0 (copy), v2 (copy), l_Constants_0 (copy), l_Size150x150_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_AvatarHeadShot_0 (copy), l_UserModel_0 (copy), v18 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_IconSize_0 (copy)
    local l_friend_0 = v19.friend;
    assert(l_friend_0, "friend should be non-nil. Silence type checker.");
    local v21 = l_useStyle_0();
    local v24 = v2.useMemo(function() --[[ Line: 60 ]]
        -- upvalues: l_friend_0 (copy), l_Constants_0 (ref), l_Size150x150_0 (ref), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), l_AvatarHeadShot_0 (ref)
        local v22 = nil;
        if l_friend_0 then
            local v23 = l_Constants_0.RbxThumbnailSizeToNumberSize[l_Size150x150_0];
            v22 = l_getRbxthumbWithTypeSizeAndOptions_0(l_friend_0.id, l_AvatarHeadShot_0, v23);
        end;
        if not v22 then
            v22 = "rbxasset://textures/ui/LuaApp/graphic/ph-avatar-portrait.png";
        end;
        return v22;
    end, {
        l_friend_0
    });
    local l_PlayerBackgroundDefault_0 = v21.Theme.PlayerBackgroundDefault;
    local v26 = if l_friend_0.presence ~= l_UserModel_0.PresenceType.OFFLINE then v18[l_UserModel_0.PresenceType.ONLINE] else nil;
    return v2.createElement("Frame", {
        Size = v19.size, 
        Position = v19.position, 
        AnchorPoint = v19.anchorPoint, 
        BackgroundTransparency = 1
    }, {
        Background = l_PlayerBackgroundDefault_0 and v2.createElement("Frame", {
            Size = v19.size, 
            Position = v19.position, 
            AnchorPoint = v19.anchorPoint, 
            BackgroundColor3 = v21.Theme.UIDefault.Color, 
            BackgroundTransparency = v21.Theme.UIDefault.Transparency
        }, {
            Corner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            })
        }), 
        Thumbnail = v19.isFetchingFriends and v2.createElement(l_Skeleton_0, {
            Size = UDim2.new(1, 0, 1, 0), 
            radius = l_Radius_0.Circle
        }) or v2.createElement(l_ImageSetLabel_0, {
            Size = v19.size, 
            Position = v19.position, 
            AnchorPoint = v19.anchorPoint, 
            Image = v24, 
            BorderSizePixel = 0, 
            BackgroundColor3 = v21 and v21.Theme.UIDefault.Color, 
            BackgroundTransparency = l_PlayerBackgroundDefault_0 and 1 or v21.Theme.UIDefault.Transparency
        }, {
            Corner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            })
        }), 
        PresenceIcon = not (not v26 or v19.isFetchingFriends) and v2.createElement(l_ImageSetLabel_0, {
            Image = l_Images_0[v26.Image], 
            BackgroundTransparency = 0, 
            BackgroundColor3 = v19.isHoverRow and v21.Theme.BackgroundOnHover.Color or v21.Theme.BackgroundDefault.Color, 
            ImageColor3 = v26.Color, 
            Position = UDim2.new(1, -1, 1, -1), 
            AnchorPoint = Vector2.new(1, 1), 
            Size = v26.Size or UDim2.new(0, l_IconSize_0.Small, 0, l_IconSize_0.Small), 
            ZIndex = 2
        }, {
            Border = v2.createElement("UIStroke", {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                Color = v21.Theme.BackgroundDefault.Color, 
                Transparency = v21.Theme.BackgroundDefault.Transparency, 
                Thickness = 3
            }), 
            Corner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            })
        }) or nil
    });
end;