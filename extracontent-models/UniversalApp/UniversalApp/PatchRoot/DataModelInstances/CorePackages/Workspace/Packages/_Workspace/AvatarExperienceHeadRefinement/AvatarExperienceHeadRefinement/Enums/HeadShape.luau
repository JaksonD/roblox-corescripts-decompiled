local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement").Parent;
if not require(l_Parent_0.AvatarExperienceFlags).FFlagDynamicHeadsMigration then
    return {
        Default = "Default", 
        ManHead = "ManHead", 
        WomanHead = "WomanHead", 
        Cheeks = "Cheeks", 
        Narrow = "Narrow", 
        StrongJaw = "StrongJaw", 
        Paragon = "Paragon", 
        Chiseled = "Chiseled", 
        Roundy = "Roundy", 
        Blockhead = "Blockhead", 
        Trim = "Trim"
    };
else
    return {
        Default = "Default", 
        Blockhead = "Blockhead", 
        Octoblox = "Octoblox", 
        ROXBOX = "ROXBOX", 
        EraserHead = "EraserHead", 
        Roll = "Roll", 
        FlatTop = "FlatTop", 
        Roundy = "Roundy", 
        Trim = "Trim", 
        CoolThing = "CoolThing", 
        Perfection = "Perfection", 
        FatHead = "FatHead", 
        Peabrain = "Peabrain", 
        ManHead = "ManHead", 
        WomanHead = "WomanHead", 
        IBot = "IBot", 
        Chiseled = "Chiseled", 
        Paragon = "Paragon", 
        StrongJaw = "StrongJaw", 
        Cheeks = "Cheeks", 
        Narrow = "Narrow", 
        KnightOfChivalry = "KnightOfChivalry", 
        KnightOfCourage = "KnightOfCourage", 
        MrToilet = "MrToilet", 
        NeoClassicMaleV2 = "NeoClassicMaleV2", 
        ClassicMaleV2 = "ClassicMaleV2", 
        ClassicFemaleV2 = "ClassicFemaleV2", 
        NeoClassicFemaleV2 = "NeoClassicFemaleV2", 
        WonderWomansGoldenArmor = "WonderWomansGoldenArmor", 
        MercilessNinja = "MercilessNinja", 
        GoldenMrRobot = "GoldenMrRobot", 
        GoldenKorbloxGeneral = "GoldenKorbloxGeneral", 
        TheEngineer = "TheEngineer"
    };
end;