game:DefineFastString("ContactsDeepLinkPrefix", "roblox://navigation/contacts");
game:DefineFastString("AppealsPortalPrefix", "roblox://navigation/appeals");
game:DefineFastString("SecurityAlertDeepLinkPrefix", "roblox://navigation/security_alert");
game:DefineFastString("SortDeeplinkPrefix", "roblox://navigation/experience_sort");
return {
    game:GetFastString("ContactsDeepLinkPrefix"), 
    game:GetFastString("AppealsPortalPrefix"), 
    game:GetFastString("SecurityAlertDeepLinkPrefix"), 
    game:GetFastString("SortDeeplinkPrefix")
};