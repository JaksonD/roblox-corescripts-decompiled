game:DefineFastString("PremiumSponsoredExperienceInstances", "");
game:DefineFastInt("PremiumSponsoredExperienceWaitTimeSeconds", 5);
return {
    GetFStringPremiumSponsoredExperienceInstances = function() --[[ Line: 5 ]] --[[ Name: GetFStringPremiumSponsoredExperienceInstances ]]
        return game:GetFastString("PremiumSponsoredExperienceInstances");
    end, 
    GetFIntPremiumSponsoredExperienceWaitTimeSeconds = function() --[[ Line: 8 ]] --[[ Name: GetFIntPremiumSponsoredExperienceWaitTimeSeconds ]]
        return game:GetFastInt("PremiumSponsoredExperienceWaitTimeSeconds");
    end
};