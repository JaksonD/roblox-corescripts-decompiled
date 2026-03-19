local l_Parent_0 = script:FindFirstAncestor("UserTile").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.UserLib);
local l_Image_0 = v2.Image;
local l_View_0 = v2.View;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_useCumulativeBackground_0 = v2.Hooks.useCumulativeBackground;
local l_UserPresence_0 = v2.Enums.UserPresence;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = v3.Utils.getStandardSizeAvatarHeadShotRbxthumb;
local l_FFlagAppChatEnableGroupAvatarPresence_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableGroupAvatarPresence;
local v11 = game:DefineFastFlag("UserTilePresenceIndicatorStrokeColor", false);
return function(v12) --[[ Line: 26 ]] --[[ Name: AvatarPile ]]
    -- upvalues: l_useTokens_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_useCumulativeBackground_0 (copy), v1 (copy), l_View_0 (copy), l_Image_0 (copy), l_FFlagAppChatEnableGroupAvatarPresence_0 (copy), l_UserPresence_0 (copy), v11 (copy)
    local v13 = l_useTokens_0();
    local v14 = l_getStandardSizeAvatarHeadShotRbxthumb_0(v12.primaryUserId);
    local v15 = l_getStandardSizeAvatarHeadShotRbxthumb_0(v12.secondUserId);
    local v16 = if v12.hover then v13.Color.Shift.Shift_400 else v13.Color.Shift.Shift_300;
    local v17 = l_useCumulativeBackground_0(v12.altSurfaceBackground or v13.Color.Surface.Surface_0, v16);
    return v1.createElement(l_View_0, {
        tag = "aspect-1-1 position-center-center anchor-center-center size-full-full", 
        ZIndex = v12.ZIndex, 
        LayoutOrder = v12.layoutOrder
    }, {
        AvatarImage1 = v1.createElement(l_Image_0, {
            LayoutOrder = 1, 
            backgroundStyle = v17, 
            tag = {
                ["aspect-1-1 radius-circle row position-bottom-left anchor-bottom-left"] = true
            }, 
            Size = UDim2.fromScale(0.7, 0.7), 
            Image = v14, 
            ZIndex = 2
        }), 
        AvatarImage2 = v1.createElement(l_Image_0, {
            LayoutOrder = 2, 
            backgroundStyle = v17, 
            tag = {
                ["aspect-1-1 radius-circle row position-top-right anchor-top-right"] = true
            }, 
            Size = UDim2.fromScale(0.7, 0.7), 
            Image = v15, 
            ZIndex = 1
        }), 
        Icon = if l_FFlagAppChatEnableGroupAvatarPresence_0 and (not (v12.userPresenceType ~= l_UserPresence_0.Active) or v12.userPresenceType == l_UserPresence_0.InExperience) then v1.createElement(l_Image_0, {
            tag = v11 and "bg-surface-100 radius-circle auto-xy position-absolute" or "bg-surface-0 radius-circle auto-xy position-absolute", 
            Image = "component_assets/circle_16", 
            Size = UDim2.new(0.125, 4, 0.125, 4), 
            Position = UDim2.new(0.8536, v13.Stroke.Thicker, 0.8536, v13.Stroke.Thicker), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            stroke = {
                Thickness = v13.Stroke.Thicker, 
                Color = if v11 then v13.Color.Surface.Surface_100.Color3 else v13.Color.Surface.Surface_0.Color3
            }, 
            imageStyle = v13.Color.System.Success
        }) else nil
    });
end;