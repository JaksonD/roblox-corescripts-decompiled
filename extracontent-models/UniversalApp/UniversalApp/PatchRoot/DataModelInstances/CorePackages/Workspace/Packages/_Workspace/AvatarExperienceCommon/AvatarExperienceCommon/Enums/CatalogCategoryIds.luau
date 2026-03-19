local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
return require(l_Parent_0.enumerate)(script.Name, {
    All = 1, 
    Characters = 2, 
    Accessories = 11, 
    Heads = 5, 
    AllAnimations = 12, 
    Body = 18, 
    Clothing = 3
});