local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
local v1 = require(l_Parent_0.SocialLuaAnalytics);
local v2 = require(script.Parent.Enums.EventNames);
return {
    [v2.EditProfileOpened] = {
        name = game:DefineFastString("EditProfileOpened", "EditProfileOpened")
    }, 
    [v2.DisplayNameSaved] = {
        name = game:DefineFastString("DisplayNameSaved", "DisplayNameSaved")
    }, 
    [v2.DisplayNameModalOpened] = {
        name = game:DefineFastString("DisplayNameModalOpened", "DisplayNameModalOpened")
    }, 
    [v2.DisplayNameModalLoaded] = {
        name = game:DefineFastString("DisplayNameModalLoaded", "DisplayNameModalLoaded")
    }, 
    [v2.EditUsernameOpened] = {
        name = game:DefineFastString("EditUsernameOpened", "EditUsernameOpened")
    }, 
    [v2.UsernameSaved] = {
        name = game:DefineFastString("UsernameSaved", "UsernameSaved")
    }, 
    [v2.FilteredDisplayName] = {
        name = game:DefineFastString("FilteredDisplayName", "FilteredDisplayName")
    }, 
    [v2.DisplayNameTooShort] = {
        name = game:DefineFastString("DisplayNameTooShort", "DisplayNameTooShort")
    }, 
    [v2.DescriptionPINBlocked] = {
        name = game:DefineFastString("DescriptionPINBlocked", "DescriptionPINBlocked")
    }, 
    [v2.OpenAvatarMarketplace] = {
        name = "OpenAvatarMarketplace", 
        platformSpecificity = v1.Analytics.Enums.PlatformSpecificity.BucketsOnly
    }, 
    [v2.OpenPersonaOutfitSelect] = {
        name = game:DefineFastString("OpenPersonaOutfitSelect", "OpenPersonaOutfitSelect")
    }, 
    [v2.OpenPersonaNameModal] = {
        name = game:DefineFastString("OpenPersonaNameModal", "OpenPersonaNameModal")
    }, 
    [v2.TogglePersona] = {
        name = game:DefineFastString("TogglePersona", "TogglePersona")
    }, 
    [v2.PersonaOutfitSelectLoaded] = {
        name = game:DefineFastString("PersonaOutfitSelectLoaded", "PersonaOutfitSelectLoaded")
    }, 
    [v2.PersonaToAvatarCreator] = {
        name = game:DefineFastString("PersonaToAvatarCreator", "PersonaToAvatarCreator")
    }, 
    [v2.PersonaNameSaved] = {
        name = game:DefineFastString("PersonaNameSaved", "PersonaNameSaved")
    }
};