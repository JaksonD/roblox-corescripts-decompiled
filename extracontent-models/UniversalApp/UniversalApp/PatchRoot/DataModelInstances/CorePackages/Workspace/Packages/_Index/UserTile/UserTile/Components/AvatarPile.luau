local l_Parent_0 = script:FindFirstAncestor("UserTile").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.UserLib);
local l_Image_0 = v2.Image;
local l_View_0 = v2.View;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_useCumulativeBackground_0 = v2.Hooks.useCumulativeBackground;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = v3.Utils.getStandardSizeAvatarHeadShotRbxthumb;
return function(v9) --[[ Line: 22 ]] --[[ Name: AvatarPile ]]
    -- upvalues: l_useTokens_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_useCumulativeBackground_0 (copy), v1 (copy), l_View_0 (copy), l_Image_0 (copy)
    local v10 = l_useTokens_0();
    local v11 = l_getStandardSizeAvatarHeadShotRbxthumb_0(v9.primaryUserId);
    local v12 = l_getStandardSizeAvatarHeadShotRbxthumb_0(v9.secondUserId);
    local v13 = if v9.hover then v10.Color.Shift.Shift_400 else v10.Color.Shift.Shift_300;
    local v14 = l_useCumulativeBackground_0(v9.altSurfaceBackground or v10.Color.Surface.Surface_0, v13);
    return v1.createElement(l_View_0, {
        tag = "aspect-1-1 position-center-center anchor-center-center size-full-full", 
        ZIndex = v9.ZIndex, 
        LayoutOrder = v9.layoutOrder
    }, {
        AvatarImage1 = v1.createElement(l_Image_0, {
            LayoutOrder = 1, 
            backgroundStyle = v14, 
            tag = {
                ["aspect-1-1 radius-circle row position-bottom-left anchor-bottom-left"] = true
            }, 
            Size = UDim2.fromScale(0.7, 0.7), 
            Image = v11, 
            ZIndex = 2
        }), 
        AvatarImage2 = v1.createElement(l_Image_0, {
            LayoutOrder = 2, 
            backgroundStyle = v14, 
            tag = {
                ["aspect-1-1 radius-circle row position-top-right anchor-top-right"] = true
            }, 
            Size = UDim2.fromScale(0.7, 0.7), 
            Image = v12, 
            ZIndex = 1
        })
    });
end;