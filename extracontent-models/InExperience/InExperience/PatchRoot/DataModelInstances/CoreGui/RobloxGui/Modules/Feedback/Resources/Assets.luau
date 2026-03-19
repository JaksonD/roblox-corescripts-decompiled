local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v1.App.ImageSet.Images;
local l_getIconSize_0 = v1.App.ImageSet.getIconSize;
local l_IconSize_0 = v1.App.ImageSet.Enum.IconSize;
return {
    Images = {
        RoundedRect = {
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 8, 9, 9), 
            Image = l_Images_0["component_assets/circle_17"]
        }, 
        BiometricIcon = {
            Size = UDim2.fromOffset(l_getIconSize_0(l_IconSize_0.Medium), l_getIconSize_0(l_IconSize_0.Medium)), 
            Image = l_Images_0["icons/menu/biometric"]
        }, 
        FeedbackBarHintIcon = {
            Size = UDim2.fromOffset(l_getIconSize_0(l_IconSize_0.Medium), l_getIconSize_0(l_IconSize_0.Medium)), 
            Image = l_Images_0["icons/actions/edit/add"]
        }
    }
};