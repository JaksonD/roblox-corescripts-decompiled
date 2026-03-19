local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v3 = require(l_script_FirstAncestor_0.Flags.RealNamesInDisplayNamesIXP);
local v4 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileDisplayNameUseUnder17Description);
local v5 = require(script.Parent.useRealNamesInDisplayNamesEnabled);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v7 = {
    displayNameCaption = v2.DisplayNameCaption, 
    displayNameChangeError = v2.DisplayNameError, 
    displayNameChangeMixedCharactersError = v2.DisplayNameError, 
    displayNameModalCaption = v2.DisplayNameModalCaption, 
    displayNameCoolDownMessage = v2.DisplayNameRecently, 
    displayNameTooShortError = v2.DisplayNameTooShort, 
    displayNameUpdatedMessage = v2.DisplayNameUpdated, 
    displayNameEditMessage = v2.EditDisplayName, 
    displayNameTitle = v2.DisplayName, 
    nameTooShortError = v2.NameTooShortError, 
    nameTooLongError = v2.NameTooLongError, 
    nameUnsupportedCharsError = v2.NameUnsupportedCharsError, 
    nameInappropriateError = v2.NameInappropriateError, 
    nameHasChangedError = v2.NameHasChangedError, 
    nameNotAvailableError = v2.NameNotAvailableError, 
    searchForFriendsPrompt = v2.SearchForFriendPrompt
};
local v8 = {
    displayNameCaption = v2.AgedUpDisplayNameConnectionsCaption, 
    displayNameChangeError = v2.AgedUpDisplayNameError, 
    displayNameChangeMixedCharactersError = v2.AgedUpDisplayNameMixedCharactersError, 
    displayNameModalCaption = v2.AgedUpDisplayNameModalCaption, 
    displayNameCoolDownMessage = v2.AgedUpDisplayNameRecently, 
    displayNameTooShortError = v2.AgedUpDisplayNameTooShort, 
    displayNameUpdatedMessage = v2.AgedUpDisplayNameUpdated, 
    displayNameEditMessage = v2.EditAgedUpDisplayName, 
    displayNameTitle = v2.AgedUpDisplayName, 
    nameTooShortError = v2.AgedUpNameTooShortError, 
    nameTooLongError = v2.AgedUpNameTooLongError, 
    nameUnsupportedCharsError = v2.AgedUpNameUnsupportedCharsError, 
    nameInappropriateError = v2.AgedUpNameInappropriateError, 
    nameHasChangedError = v2.AgedUpNameHasChangedError, 
    nameNotAvailableError = v2.AgedUpNameNotAvailableError, 
    searchForFriendsPrompt = v2.AgedUpSearchForFriendsPrompt
};
return function() --[[ Line: 55 ]]
    -- upvalues: v5 (copy), v3 (copy), v8 (copy), v7 (copy), v4 (copy), l_useLocalization_0 (copy)
    local v9 = v5();
    local v10 = if v3.useIsExperimentEnabled({
        isExposureEnabled = true
    }) and v9 then v8 else v7;
    local l_v10_0 = v10;
    if v4 then
        l_v10_0 = table.clone(v10);
        l_v10_0.displayNameCaption = v7.displayNameCaption;
        l_v10_0.displayNameModalCaption = v7.displayNameModalCaption;
    end;
    return l_useLocalization_0(l_v10_0);
end;