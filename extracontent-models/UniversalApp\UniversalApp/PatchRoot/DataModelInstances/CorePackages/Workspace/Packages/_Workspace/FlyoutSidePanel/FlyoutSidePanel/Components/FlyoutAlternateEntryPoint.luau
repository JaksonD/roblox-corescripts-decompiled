local l_Parent_0 = script:FindFirstAncestor("FlyoutSidePanel").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.BuilderIcons);
local v3 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v3.Hooks.useTokens;
local l_LoadableImage_0 = require(l_Parent_0.UIBlox).App.Loading.LoadableImage;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_Parent_0.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
return function() --[[ Line: 13 ]] --[[ Name: FlyoutAlternateEntryPoint ]]
    -- upvalues: l_useTokens_0 (copy), l_useSelector_0 (copy), v1 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), v3 (copy), v2 (copy), l_LoadableImage_0 (copy)
    local v8 = l_useTokens_0();
    local v10 = l_useSelector_0(function(v9) --[[ Line: 15 ]]
        return v9.Users[v9.LocalUserId];
    end);
    local v11 = v1.useMemo(function() --[[ Line: 18 ]]
        -- upvalues: v10 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (ref)
        if v10 and v10.id then
            return l_getStandardSizeAvatarHeadShotRbxthumb_0(v10.id);
        else
            return nil;
        end;
    end, {
        v10
    });
    return v1.createElement(v3.Icon, {
        tag = "position-center-center anchor-center-center content-emphasis align-y-center", 
        name = v2.Icon.ThreeHorizontalBarsWrappingRight, 
        size = v8.Size.Size_800
    }, {
        UserAvatar = v1.createElement(l_LoadableImage_0, {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, v8.Size.Size_50, 0.5, 0), 
            Size = UDim2.new(0, v8.Size.Size_400, 0, v8.Size.Size_400), 
            BackgroundColor3 = v8.Semantic.Color.Common.Placeholder.Color3, 
            BackgroundTransparency = v8.Semantic.Color.Common.Placeholder.Transparency, 
            Image = v11, 
            useShimmerAnimationWhileLoading = true, 
            cornerRadius = UDim.new(0.5, 0), 
            shouldHandleReloads = true
        })
    });
end;