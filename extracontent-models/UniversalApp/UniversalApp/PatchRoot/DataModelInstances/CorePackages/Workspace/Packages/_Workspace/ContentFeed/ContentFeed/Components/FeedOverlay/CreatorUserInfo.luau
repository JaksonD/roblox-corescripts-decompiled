local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.RoactUtils);
local v3 = require(l_Parent_0.UserLib);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v6 = require(l_Parent_0.UIBlox);
local l_getDeepValue_0 = v5.SocialLibraries.config({}).Dictionary.getDeepValue;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v3.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_LoadableImage_0 = v6.App.Loading.LoadableImage;
local l_Skeleton_0 = v4.Skeleton;
local l_Text_0 = v4.Text;
local l_View_0 = v4.View;
local l_useSelector_0 = v2.Hooks.RoactRodux.useSelector;
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_AvatarHeadShot_0 = v3.Utils.Constants.RbxthumbTypes.AvatarHeadShot;
return function(v16) --[[ Line: 37 ]]
    -- upvalues: l_useStyle_0 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), v1 (copy), l_View_0 (copy), l_LoadableImage_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_AvatarHeadShot_0 (copy), l_Text_0 (copy), l_Skeleton_0 (copy)
    local v17 = l_useStyle_0();
    local v19 = l_useSelector_0(function(v18) --[[ Line: 40 ]]
        -- upvalues: l_getDeepValue_0 (ref), v16 (copy)
        return l_getDeepValue_0(v18, "Users.byUserId." .. tostring(v16.creatorUserId) .. ".username");
    end);
    return v1.createElement(l_View_0, {
        LayoutOrder = v16.layoutOrder, 
        tag = "align-x-left align-y-center auto-y bg-action-subtle gap-small row size-full-0"
    }, {
        CreatorThumbnail = v1.createElement(l_LoadableImage_0, {
            BackgroundColor3 = v17.Theme.PlaceHolder.Color, 
            BackgroundTransparency = v17.Theme.PlaceHolder.Transparency, 
            cornerRadius = UDim.new(0, 30), 
            Image = l_getRbxthumbWithTypeSizeAndOptions_0(tostring(v16.creatorUserId), l_AvatarHeadShot_0, 150, true), 
            LayoutOrder = 1, 
            ScaleType = Enum.ScaleType.Fit, 
            Size = UDim2.fromOffset(30, 30), 
            useShimmerAnimationWhileLoading = true
        }), 
        CreatorUsername = if v19 then v1.createElement(l_Text_0, {
            LayoutOrder = 2, 
            tag = "auto-y content-action-emphasis grow text-align-x-left text-align-y-top text-title-large text-truncate-end", 
            Text = v19, 
            ZIndex = 2
        }) else nil, 
        ShimmerPanel = if not v19 then v1.createElement(l_Skeleton_0, {
            LayoutOrder = 2, 
            Size = UDim2.fromOffset(160, 16)
        }) else nil
    });
end;