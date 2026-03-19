local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.UIBlox);
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v2.App.ImageSet.Images;
local l_LoadableImage_0 = v2.App.Loading.LoadableImage;
local v6 = require(l_Parent_0.React);
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_View_0 = require(l_Parent_0.Foundation).View;
local v9 = require(l_script_FirstAncestor_0.Common.Constants);
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagPPVBackgroundEnabled);
local l_DisplayBackground_0 = require(l_Parent_0.EditProfileBackground).DisplayBackground;
local v12 = require(l_script_FirstAncestor_0.Common.Enums);
local v13 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local l_FFlagProfilePlatformNewProfileHeader_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformNewProfileHeader;
local l_FFlagPPVBackgroundUse2DAsLoadingState_0 = require(l_Parent_0.SharedFlags).FFlagPPVBackgroundUse2DAsLoadingState;
local l_FFlagPPVEnable3DBackground_0 = require(l_Parent_0.SharedFlags).FFlagPPVEnable3DBackground;
return function(v17) --[[ Line: 33 ]] --[[ Name: UserProfileAvatar ]]
    -- upvalues: l_useStyle_0 (copy), v10 (copy), v13 (copy), v12 (copy), l_FFlagPPVEnable3DBackground_0 (copy), l_FFlagProfilePlatformNewProfileHeader_0 (copy), v9 (copy), v6 (copy), l_View_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_DisplayBackground_0 (copy), l_FFlagPPVBackgroundUse2DAsLoadingState_0 (copy), l_LoadableImage_0 (copy)
    local v18 = l_useStyle_0();
    local v19 = if v10 then v13(v12.Components.ProfileBackground) else {};
    local v20 = if v10 and l_FFlagPPVEnable3DBackground_0 then v19 and v19.assetId or -1 else nil;
    local v21 = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1), 
        NumberSequenceKeypoint.new(0.25, 0.75), 
        NumberSequenceKeypoint.new(0.55, 0.4), 
        NumberSequenceKeypoint.new(0.8, 0.15), 
        NumberSequenceKeypoint.new(1, 0)
    });
    local v22 = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1), 
        NumberSequenceKeypoint.new(1, 0)
    });
    local v23 = if l_FFlagProfilePlatformNewProfileHeader_0 and v17.height then v17.height else v9.USER_PROFILE_HEADER_HEIGHT;
    return v6.createElement(if l_FFlagProfilePlatformNewProfileHeader_0 then l_View_0 else v6.Fragment, {
        Size = if l_FFlagProfilePlatformNewProfileHeader_0 then UDim2.new(1, 0, 0, v23) else nil
    }, {
        Background = if v10 and l_FFlagPPVEnable3DBackground_0 then nil else v6.createElement(l_ImageSetLabel_0, {
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            Image = l_Images_0[v18.Theme.PlayerBackgroundDefault.Image], 
            ZIndex = 1
        }), 
        AvatarThumbnail = if v10 then v6.createElement(l_DisplayBackground_0, {
            height = v23, 
            currentBackgroundId = v20, 
            userId = v17.userId, 
            userThumbnail = if l_FFlagPPVBackgroundUse2DAsLoadingState_0 then v17.userThumbnail else nil
        }) else v6.createElement(l_LoadableImage_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, -v9.THUMBNAIL_PADDING / 2), 
            Size = UDim2.new(1, -v9.THUMBNAIL_PADDING, 1, -v9.THUMBNAIL_PADDING), 
            ScaleType = Enum.ScaleType.Fit, 
            BackgroundTransparency = 1, 
            Image = v17.userThumbnail, 
            useShimmerAnimationWhileLoading = true, 
            ZIndex = 2
        }), 
        TopGradient = if v10 and l_FFlagPPVEnable3DBackground_0 or l_FFlagProfilePlatformNewProfileHeader_0 then nil else v6.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v9.USER_PROFILE_GRADIENT_HEIGHT), 
            Position = UDim2.fromScale(0, 0), 
            BackgroundColor3 = v18.Theme.BackgroundDefault.Color, 
            BorderSizePixel = 0, 
            ZIndex = 3
        }, {
            UIGradient = v6.createElement("UIGradient", {
                Rotation = 90, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0), 
                    NumberSequenceKeypoint.new(1, 1)
                })
            })
        }), 
        BottomGradient = v6.createElement("Frame", {
            Size = if l_FFlagProfilePlatformNewProfileHeader_0 then UDim2.new(1, 0, 0, v9.USER_PROFILE_GRADIENT_HEIGHT) else UDim2.new(1, 0, 0, v23 / 2), 
            Position = UDim2.fromScale(0, 1), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundColor3 = v18.Theme.BackgroundDefault.Color, 
            BorderSizePixel = 0, 
            ZIndex = 3
        }, {
            UIGradient = v6.createElement("UIGradient", {
                Rotation = 90, 
                Transparency = if v10 and l_FFlagPPVEnable3DBackground_0 then v21 else v22
            })
        }), 
        CornerRadius = if l_FFlagProfilePlatformNewProfileHeader_0 and v17.isPeekView then v6.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }) else nil
    });
end;