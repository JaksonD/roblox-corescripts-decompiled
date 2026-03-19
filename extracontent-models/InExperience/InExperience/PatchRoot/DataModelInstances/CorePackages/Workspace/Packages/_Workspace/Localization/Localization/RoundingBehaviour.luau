local l_Parent_0 = script:FindFirstAncestor("Localization").Parent;
return require(l_Parent_0.enumerate)("RoundingBehaviour", {
    "RoundToClosest", 
    "Truncate"
});