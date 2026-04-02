local v0 = {
    ruleTitle = "Feature.NotApproved.Heading.RuleExplanation.Swearing", 
    ruleSubtitle = "Feature.NotApproved.SubHeading.RuleExplanation.Swearing", 
    ruleDescription = "Feature.NotApproved.Description.RuleExplanation.Swearing", 
    importanceTitle = "Feature.NotApproved.Heading.RuleImportance", 
    importanceDescription = "Feature.NotApproved.Description.RuleImportance.Swearing", 
    policyKey = "swearing"
};
local v1 = {
    ruleTitle = "Feature.NotApproved.Heading.RuleExplanation.Dating", 
    ruleSubtitle = "Feature.NotApproved.SubHeading.RuleExplanation.Dating", 
    ruleDescription = "Feature.NotApproved.Description.RuleExplanation.Dating", 
    importanceTitle = "Feature.NotApproved.Heading.RuleImportance", 
    importanceDescription = "Feature.NotApproved.Description.RuleImportance.Dating", 
    policyKey = "dating"
};
local v2 = {
    ruleTitle = "Feature.NotApproved.Heading.RuleExplanation.BullyingHarassmentDiscrimination", 
    ruleSubtitle = "Feature.NotApproved.SubHeading.RuleExplanation.BullyingHarassmentDiscrimination", 
    ruleDescription = "Feature.NotApproved.Description.RuleExplanation.BullyingHarassmentDiscrimination", 
    importanceTitle = "Feature.NotApproved.Heading.RuleImportance", 
    importanceDescription = "Feature.NotApproved.Description.RuleImportance.BullyingHarassmentDiscrimination", 
    policyKey = "bullying-harassment-discrimination"
};
local v3 = {
    ruleTitle = "Feature.NotApproved.Heading.RuleExplanation.DirectingUsersOffPlatform", 
    ruleSubtitle = "Feature.NotApproved.SubHeading.RuleExplanation.DirectingUsersOffPlatform", 
    ruleDescription = "Feature.NotApproved.Description.RuleExplanation.DirectingUsersOffPlatform", 
    importanceTitle = "Feature.NotApproved.Heading.RuleImportance", 
    importanceDescription = "Feature.NotApproved.Description.RuleImportance.DirectingUsersOffPlatform", 
    policyKey = "directing-users-off-platform"
};
local v4 = {
    ruleTitle = "Feature.NotApproved.Heading.RuleExplanation.MisusingRobloxSystems", 
    ruleSubtitle = "Feature.NotApproved.SubHeading.RuleExplanation.MisusingRobloxSystems", 
    ruleDescription = "Feature.NotApproved.Description.RuleExplanation.MisusingRobloxSystems", 
    ruleDescriptionBullets = "Feature.NotApproved.Description.RuleExplanation.Bullets.MisusingRobloxSystems", 
    importanceTitle = "Feature.NotApproved.Heading.RuleImportance", 
    importanceDescription = "Feature.NotApproved.Description.RuleImportance.MisusingRobloxSystems", 
    policyKey = "misusing-roblox-systems"
};
local v5 = {
    ruleTitle = "Feature.NotApproved.Heading.RuleExplanation.PII", 
    ruleSubtitle = "Feature.NotApproved.SubHeading.RuleExplanation.PII", 
    ruleDescription = "Feature.NotApproved.Description.RuleExplanation.PII", 
    ruleDescriptionBullets = "Feature.NotApproved.Description.RuleExplanation.Bullets.PII", 
    importanceTitle = "Feature.NotApproved.Heading.RuleImportance", 
    importanceDescription = "Feature.NotApproved.Description.RuleImportance.PII", 
    policyKey = "pii"
};
local v6 = {
    ruleTitle = "Feature.NotApproved.Heading.RuleExplanation.RealLifeEvents", 
    ruleSubtitle = "Feature.NotApproved.SubHeading.RuleExplanation.RealLifeEvents", 
    ruleDescription = "Feature.NotApproved.Description.RuleExplanation.RealLifeEvents", 
    ruleDescriptionBullets = "Feature.NotApproved.Description.RuleExplanation.Bullets.RealLifeEvents", 
    importanceTitle = "Feature.NotApproved.Heading.RuleImportance", 
    importanceDescription = "Feature.NotApproved.Description.RuleImportance.RealLifeEvents", 
    policyKey = "real-life-events"
};
local v7 = {
    ruleTitle = "Feature.NotApproved.Heading.RuleExplanation.Spam", 
    ruleSubtitle = "Feature.NotApproved.SubHeading.RuleExplanation.Spam", 
    ruleDescription = "Feature.NotApproved.Description.RuleExplanation.Spam", 
    importanceTitle = "Feature.NotApproved.Heading.RuleImportance", 
    importanceDescription = "Feature.NotApproved.Description.RuleImportance.Spam", 
    policyKey = "spam"
};
local v8 = {
    ruleTitle = "Feature.NotApproved.Heading.RuleExplanation.SSHAndIllegalRegulatedActivities", 
    ruleSubtitle = "Feature.NotApproved.SubHeading.RuleExplanation.SSHAndIllegalRegulatedActivities", 
    ruleDescription = "Feature.NotApproved.Description.RuleExplanation.SSHAndIllegalRegulatedActivities", 
    ruleDescriptionBullets = "Feature.NotApproved.Description.RuleExplanation.Bullets.SSHAndIllegalRegAct", 
    importanceTitle = "Feature.NotApproved.Heading.RuleImportance", 
    importanceDescription = "Feature.NotApproved.Description.RuleImportance.SSHAndIllegalRegulatedActivities", 
    policyKey = "ssh-and-illegal-regulated-activities"
};
local v9 = {
    ruleTitle = "Feature.NotApproved.Heading.RuleExplanation.ViolentContentAndGore", 
    ruleSubtitle = "Feature.NotApproved.SubHeading.RuleExplanation.ViolentContentAndGore", 
    ruleDescription = "Feature.NotApproved.Description.RuleExplanation.ViolentContentAndGore", 
    importanceTitle = "Feature.NotApproved.Heading.RuleImportance", 
    importanceDescription = "Feature.NotApproved.Description.RuleImportance.ViolentContentAndGore", 
    policyKey = "violent-content-and-gore"
};
return {
    ["Label.AbuseType.CheatandExploits"] = v4, 
    ["Label.AbuseType.ContestsandSweepstakes"] = v8, 
    ["Label.AbuseType.Dating"] = v1, 
    ["Label.AbuseType.DirectingUsersOffPlatform"] = v3, 
    ["Label.AbuseType.DiscriminatoryContent"] = v2, 
    ["Label.AbuseType.DisruptiveAudio"] = v4, 
    ["Label.AbuseType.EncouragingDangerousBehavior"] = v8, 
    ["Label.AbuseType.ExtortionandBlackmail"] = v2, 
    ["Label.AbuseType.Harassment"] = v2, 
    ["Label.AbuseType.IllegalandRegulatedContent"] = v8, 
    ["Label.AbuseType.Impersonation"] = v2, 
    ["Label.AbuseType.IrlDangerousActivities"] = v8, 
    ["Label.AbuseType.MisusingRobloxSystems"] = v4, 
    ["Label.AbuseType.OffPlatformSpeechandBehavior"] = v2, 
    ["Label.AbuseType.PrivacyAskingforPII"] = v5, 
    ["Label.AbuseType.PrivacyGivingPII"] = v5, 
    ["Label.AbuseType.RealLifeThreats"] = v2, 
    ["Label.AbuseType.Scamming"] = v4, 
    ["Label.AbuseType.SexualContent"] = v1, 
    ["Label.AbuseType.Spam"] = v7, 
    ["Label.AbuseType.SuicideSelfHarm"] = v8, 
    ["Label.AbuseType.Swearing"] = v0, 
    ["Label.AbuseType.ThreatsOrAbuseOfRobloxEmployeesOrAffiliates"] = v2, 
    ["Label.AbuseType.ViolentContentAndGore"] = v9, 
    ["Label.AbuseType.VirtualCasino"] = v8, 
    ["Label.Sublabel.RealLifeEvents"] = v6, 
    ["Label.Sublabel.RomanceOrSex"] = v1
};