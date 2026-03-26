local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.UIBlox);
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v2.App.ImageSet.Images;
local v5 = require(l_Parent_0.React);
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_View_0 = require(l_Parent_0.Foundation).View;
local v8 = require(l_script_FirstAncestor_0.Common.Constants);
local l_DisplayBackground_0 = require(l_Parent_0.EditProfileBackground).DisplayBackground;
local v10 = require(l_script_FirstAncestor_0.Common.Enums);
local v11 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local l_FFlagProfilePlatformNewProfileHeader_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformNewProfileHeader;
local l_FFlagPPVBackgroundUse2DAsLoadingState_0 = require(l_Parent_0.SharedFlags).FFlagPPVBackgroundUse2DAsLoadingState;
local l_FFlagPPVEnable3DBackground_0 = require(l_Parent_0.SharedFlags).FFlagPPVEnable3DBackground;
return function(v15) --[[ Line: 31 ]] --[[ Name: UserProfileAvatar ]]
    -- upvalues: l_useStyle_0 (copy), v11 (copy), v10 (copy), l_FFlagPPVEnable3DBackground_0 (copy), l_FFlagProfilePlatformNewProfileHeader_0 (copy), v8 (copy), v5 (copy), l_View_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_DisplayBackground_0 (copy), l_FFlagPPVBackgroundUse2DAsLoadingState_0 (copy)
    local v16 = l_useStyle_0();
    local v17 = v11(v10.Components.ProfileBackground);
    local v18 = if l_FFlagPPVEnable3DBackground_0 then v17 and v17.assetId or -1 else nil;
    local v19 = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1), 
        NumberSequenceKeypoint.new(0.25, 0.75), 
        NumberSequenceKeypoint.new(0.55, 0.4), 
        NumberSequenceKeypoint.new(0.8, 0.15), 
        NumberSequenceKeypoint.new(1, 0)
    });
    local v20 = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1), 
        NumberSequenceKeypoint.new(1, 0)
    });
    local v21 = if l_FFlagProfilePlatformNewProfileHeader_0 and v15.height then v15.height else v8.USER_PROFILE_HEADER_HEIGHT;
    return v5.createElement(if l_FFlagProfilePlatformNewProfileHeader_0 then l_View_0 else v5.Fragment, {
        Size = if l_FFlagProfilePlatformNewProfileHeader_0 then UDim2.new(1, 0, 0, v21) else nil
    }, {
        Background = if l_FFlagPPVEnable3DBackground_0 then nil else v5.createElement(l_ImageSetLabel_0, {
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            Image = l_Images_0[v16.Theme.PlayerBackgroundDefault.Image], 
            ZIndex = 1
        }), 
        AvatarThumbnail = v5.createElement(l_DisplayBackground_0, {
            height = v21, 
            currentBackgroundId = v18, 
            userId = v15.userId, 
            userThumbnail = if l_FFlagPPVBackgroundUse2DAsLoadingState_0 then v15.userThumbnail else nil
        }), 
        TopGradient = if not not l_FFlagPPVEnable3DBackground_0 or l_FFlagProfilePlatformNewProfileHeader_0 then nil else v5.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v8.USER_PROFILE_GRADIENT_HEIGHT), 
            Position = UDim2.fromScale(0, 0), 
            BackgroundColor3 = v16.Theme.BackgroundDefault.Color, 
            BorderSizePixel = 0, 
            ZIndex = 3
        }, {
            UIGradient = v5.createElement("UIGradient", {
                Rotation = 90, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0), 
                    NumberSequenceKeypoint.new(1, 1)
                })
            })
        }), 
        BottomGradient = v5.createElement("Frame", {
            Size = if l_FFlagProfilePlatformNewProfileHeader_0 then UDim2.new(1, 0, 0, v8.USER_PROFILE_GRADIENT_HEIGHT) else UDim2.new(1, 0, 0, v21 / 2), 
            Position = UDim2.fromScale(0, 1), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundColor3 = v16.Theme.BackgroundDefault.Color, 
            BorderSizePixel = 0, 
            ZIndex = 3
        }, {
            UIGradient = v5.createElement("UIGradient", {
                Rotation = 90, 
                Transparency = if l_FFlagPPVEnable3DBackground_0 then v19 else v20
            })
        }), 
        CornerRadius = if l_FFlagProfilePlatformNewProfileHeader_0 and v15.isPeekView then v5.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }) else nil
    });
end;