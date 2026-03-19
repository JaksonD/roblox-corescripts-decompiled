local l_Parent_0 = script:FindFirstAncestor("PurchasePrompt").Parent;
local _ = require(l_Parent_0.IAPExperience);
local _ = require(l_Parent_0.PurchasePromptLite);
local _ = require(l_Parent_0.LuauPolyfill);
return {
    ProductTypeEnum = {
        Asset = "Asset", 
        Bundle = "Bundle", 
        Experience = "Experience", 
        Gamepass = "Gamepass", 
        Product = "Product", 
        Look = "Look", 
        DeveloperSubscription = "DeveloperSubscription", 
        AvatarCreationFee = "AvatarCreationFee", 
        Unknown = "Unknown"
    }
};