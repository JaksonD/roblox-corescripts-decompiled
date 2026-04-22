local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.AvatarExperienceFlags);
local _ = require(script.Parent.Parent.Types.CategoryTypes.CategoryTypes);
local l_FFlagAXCustomizeMakeupSupport_0 = v1.FFlagAXCustomizeMakeupSupport;
return {
    Avatar = "Avatar", 
    EditableAvatar = "EditableAvatar", 
    DynamicHead = "DynamicHead", 
    Shoes = "Shoes", 
    Animations = "Animations", 
    Makeup = l_FFlagAXCustomizeMakeupSupport_0 and "Makeup" or nil
};