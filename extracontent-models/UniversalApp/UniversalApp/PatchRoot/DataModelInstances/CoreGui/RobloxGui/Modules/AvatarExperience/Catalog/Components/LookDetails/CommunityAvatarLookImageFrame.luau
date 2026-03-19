local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Common_0 = l_Modules_0.AvatarExperience.Common;
local _ = require(l_Common_0.Types);
local l_LoadableImage_0 = v4.App.Loading.LoadableImage;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v5.Utils.getRbxthumbWithTypeSizeAndOptions;
return function(v10) --[[ Line: 30 ]] --[[ Name: CommunityAvatarLookImageFrame ]]
    -- upvalues: l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v3 (copy), v2 (copy), l_LoadableImage_0 (copy)
    local l_lookId_0 = v10.lookId;
    local l_size_0 = v10.size;
    local l_layoutOrder_0 = v10.layoutOrder;
    local v14 = l_getRbxthumbWithTypeSizeAndOptions_0(l_lookId_0, "Look", 420);
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, l_size_0), 
        SizeConstraint = Enum.SizeConstraint.RelativeXY, 
        LayoutOrder = l_layoutOrder_0, 
        ZIndex = 0
    }, {
        CommunityAvatarImage = v2.createElement(l_LoadableImage_0, {
            BackgroundTransparency = 1, 
            Image = v14, 
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.fromScale(0.5, 0), 
            Size = UDim2.fromOffset(l_size_0, l_size_0), 
            useShimmerAnimationWhileLoading = true
        })
    });
end;