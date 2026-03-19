local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.enumerate);
local v2 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXCustomizeMakeupSupport_0 = v2.FFlagAXCustomizeMakeupSupport;
local l_FFlagAXCatalogMakeupSupport_0 = v2.FFlagAXCatalogMakeupSupport;
local l_FFlagAXCatalogM41Props_0 = v2.FFlagAXCatalogM41Props;
return v1(script.Name, {
    Featured = "Featured", 
    Recommended = "Recommended", 
    Characters = "Characters", 
    Avatars = "Avatars", 
    Clothing = "Clothing", 
    Accessories = "Accessories", 
    Head = "Head", 
    Body = "Body", 
    Makeup = (not not l_FFlagAXCustomizeMakeupSupport_0 or l_FFlagAXCatalogMakeupSupport_0) and "Makeup" or nil, 
    Props = l_FFlagAXCatalogM41Props_0 and "Props" or nil, 
    AllAnimations = "AllAnimations", 
    Emotes = "Emotes"
});