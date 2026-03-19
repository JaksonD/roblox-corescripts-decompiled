local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_PlayButtonStates_0 = require(l_Parent_0.GamePlayButton).PlayButtonStates;
local l_ButtonType_0 = require(l_Parent_0.UIBlox).App.Button.Enum.ButtonType;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local l_FFlagLuaAppPlayButtonLoadingPrimary_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppPlayButtonLoadingPrimary;
return function(v5, v6) --[[ Line: 39 ]] --[[ Name: getPlayButtonProps ]]
    -- upvalues: l_PlayButtonStates_0 (copy), l_FFlagLuaAppPlayButtonLoadingPrimary_0 (copy), l_ButtonType_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy)
    assert(v5 ~= nil, "Expect playButtonState ~= nil");
    local v7 = {};
    if v5 == l_PlayButtonStates_0.Loading then
        v7.icon = "icons/status/unavailable";
        v7.isLoading = true;
        v7.isDisabled = true;
        v7.buttonType = if l_FFlagLuaAppPlayButtonLoadingPrimary_0 then l_ButtonType_0.PrimaryContextual else l_ButtonType_0.Secondary;
        return v7;
    elseif v5 == l_PlayButtonStates_0.Playable then
        v7.icon = "icons/common/play";
        v7.isDisabled = false;
        return v7;
    elseif v5 == l_PlayButtonStates_0.PaidAccess then
        assert(v6 ~= nil, "gameProductInfo cannot be nil when PlayButtonStates.PaidAccess");
        v7.price = v6.price;
        v7.icon = "icons/common/robux";
        v7.isDisabled = false;
        return v7;
    elseif v5 == l_PlayButtonStates_0.FiatPaidAccess then
        assert(v6 ~= nil, "gameProductInfo cannot be nil when PlayButtonStates.FiatPaidAccess");
        v7.localizedFiatPrice = v6.localizedFiatPrice;
        v7.isDisabled = false;
        return v7;
    elseif v5 == l_PlayButtonStates_0.UnplayableOther then
        v7.icon = "icons/status/unavailable";
        v7.textKey = "Feature.ExperienceDetails.PlayButtonText.Unavailable";
        v7.isDisabled = true;
        v7.buttonType = l_ButtonType_0.Secondary;
        return v7;
    elseif l_GetFFlagIsSquadEnabled_0() and v5 == l_PlayButtonStates_0.PlayableWithParty then
        v7.icon = "icons/common/play";
        v7.textKey = "Feature.Squads.Action.JoinWithParty";
        v7.isDisabled = false;
        v7.showSquadButton = true;
        return v7;
    elseif l_GetFFlagIsSquadEnabled_0() and v5 == l_PlayButtonStates_0.WaitingForParty then
        v7.icon = "icons/common/play";
        v7.textKey = "Feature.Squads.Action.WaitingForParty";
        v7.isDisabled = true;
        v7.showSquadButton = true;
        v7.isSquadButtonDisabled = true;
        return v7;
    elseif v5 == l_PlayButtonStates_0.ActionNeeded then
        v7.icon = "icons/status/private";
        v7.textKey = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded";
        v7.isDisabled = false;
        v7.buttonType = l_ButtonType_0.PrimarySystem;
        return v7;
    else
        v7.icon = "icons/status/unavailable";
        v7.textKey = "Feature.ExperienceDetails.PlayButtonText.Unavailable";
        v7.isDisabled = true;
        v7.buttonType = l_ButtonType_0.Secondary;
        return v7;
    end;
end;