local l_Parent_0 = script:FindFirstAncestor("ChatLineReporting").Parent;
local l_AbuseCategory_0 = require(l_Parent_0.GenericAbuseReporting).Enums.AbuseCategory;
return {
    {
        localizationKey = "Feature.ReportAbuse.Problem.Bullying", 
        value = l_AbuseCategory_0.ABUSE_CATEGORY_BULLYING, 
        descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Bullying"
    }, 
    {
        localizationKey = "Feature.ReportAbuse.Problem.Cheating", 
        value = l_AbuseCategory_0.ABUSE_CATEGORY_CHEATING, 
        descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Cheating"
    }, 
    {
        localizationKey = "Feature.ReportAbuse.Problem.Dating", 
        value = l_AbuseCategory_0.ABUSE_CATEGORY_DATING, 
        descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Dating"
    }, 
    {
        localizationKey = "Feature.ReportAbuse.Problem.Hate", 
        value = l_AbuseCategory_0.ABUSE_CATEGORY_HATE_SPEECH, 
        descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Hate"
    }, 
    {
        localizationKey = "Feature.ReportAbuse.Problem.Links", 
        value = l_AbuseCategory_0.ABUSE_CATEGORY_OFFSITE_LINKS, 
        descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Links"
    }, 
    {
        localizationKey = "Feature.ReportAbuse.Problem.Personal", 
        value = l_AbuseCategory_0.ABUSE_CATEGORY_PERSONAL_QUESTION, 
        descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Personal"
    }, 
    {
        localizationKey = "Feature.ReportAbuse.Problem.Scamming", 
        value = l_AbuseCategory_0.ABUSE_CATEGORY_SCAMMING, 
        descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Scamming"
    }, 
    {
        localizationKey = "Feature.ReportAbuse.Problem.Spamming", 
        value = l_AbuseCategory_0.ABUSE_CATEGORY_SPAMMING, 
        descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Spamming"
    }, 
    {
        localizationKey = "Feature.ReportAbuse.Problem.Swearing", 
        value = l_AbuseCategory_0.ABUSE_CATEGORY_SWEARING, 
        descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Swearing"
    }, 
    {
        localizationKey = "Feature.ReportAbuse.Problem.Violence", 
        value = l_AbuseCategory_0.ABUSE_CATEGORY_VIOLENCE_OR_TERRORISM, 
        descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Violence"
    }
};