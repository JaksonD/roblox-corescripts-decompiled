local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.ClientBinding.SduiPolicyFieldKey);
local _ = require(l_Parent_0.UniversalAppPolicy);
return function(v4, v5) --[[ Line: 16 ]] --[[ Name: resolveSduiPolicyField ]]
    -- upvalues: v2 (copy)
    if v5 == v2.SearchBar then
        return true, v4.getSearchBar();
    elseif v5 == v2.GameDetailsMorePage then
        return true, v4.getGameDetailsMorePage();
    elseif v5 == v2.GameDetailsSubtitle then
        return true, v4.getGameDetailsSubtitle();
    elseif v5 == v2.GameDetailsPlayWithFriends then
        return true, v4.getGameDetailsPlayWithFriends();
    elseif v5 == v2.ShowGlobalCounters then
        return true, v4.getShowGlobalCounters();
    elseif v5 == v2.GameInfoList then
        return true, v4.getGameInfoList();
    elseif v5 == v2.GamePlaysAndRatings then
        return true, v4.getGamePlaysAndRatings();
    elseif v5 == v2.GameReportingDisabled then
        return true, v4.getGameReportingDisabled();
    elseif v5 == v2.RecommendedGames then
        return true, v4.getRecommendedGames();
    elseif v5 == v2.SocialLinks then
        return true, v4.getSocialLinks();
    elseif v5 == v2.SocialGroupLinks then
        return true, v4.getSocialGroupLinks();
    elseif v5 == v2.CommunityLinksEnabled then
        return true, v4.getCommunityLinksEnabled();
    elseif v5 == v2.GameInfoShowBadges then
        return true, v4.getGameInfoShowBadges();
    elseif v5 == v2.GameInfoShowCreated then
        return true, v4.getGameInfoShowCreated();
    elseif v5 == v2.GameInfoShowGamepasses then
        return true, v4.getGameInfoShowGamepasses();
    elseif v5 == v2.GameInfoShowGenre then
        return true, v4.getGameInfoShowGenre();
    elseif v5 == v2.GameInfoShowSubgenre then
        return true, v4.getGameInfoShowSubgenre();
    elseif v5 == v2.GameInfoShowMaxPlayers then
        return true, v4.getGameInfoShowMaxPlayers();
    elseif v5 == v2.GameInfoShowServers then
        return true, v4.getGameInfoShowServers();
    elseif v5 == v2.GameInfoShowUpdated then
        return true, v4.getGameInfoShowUpdated();
    elseif v5 == v2.GameInfoShowAgeRecommendation then
        return true, v4.getGameInfoShowAgeRecommendation();
    elseif v5 == v2.GameInfoShowVoiceAndChatFeatures then
        return true, v4.getGameInfoShowVoiceAndChatFeatures();
    elseif v5 == v2.GameInfoShowChatFeatures then
        return true, v4.getGameInfoShowChatFeatures();
    elseif v5 == v2.GameInfoListDeveloper then
        return true, v4.getGameInfoListDeveloper();
    elseif v5 == v2.GameInfoListShowRNVDeveloper then
        return true, v4.getGameInfoListShowRNVDeveloper();
    elseif v5 == v2.ShowPassesOnExperienceDetails then
        return true, v4.getShowPassesOnExperienceDetails();
    elseif v5 == v2.EnableAggregateLikesFavoritesCount then
        return true, v4.getEnableAggregateLikesFavoritesCount();
    elseif v5 == v2.ExperienceDetailsNoticeType then
        return true, v4.getExperienceDetailsNoticeType();
    elseif v5 == v2.NotificationsCanReceiveExperience then
        return true, v4.getNotificationsCanReceiveExperience();
    elseif v5 == v2.InviteFriendsDisabled then
        return true, v4.getInviteFriendsDisabled();
    elseif v5 == v2.WebViewSupport then
        return true, v4.getWebViewSupport();
    elseif v5 == v2.UseRoundedCorners then
        return true, v4.getUseRoundedCorners();
    elseif v5 == v2.RenameFriendsToConnections then
        return true, v4.getRenameFriendsToConnections();
    elseif v5 == v2.UseLuafiedReportFlow then
        return true, v4.getUseLuafiedReportFlow();
    elseif v5 == v2.ExperienceInviteShareLinkEnabled then
        return true, v4.getExperienceInviteShareLinkEnabled();
    elseif v5 == v2.ExperienceChatAvailability then
        return true, v4.getExperienceChatAvailability();
    elseif v5 == v2.DisableIAPEntryPoint then
        return true, v4.getDisableIAPEntryPoint();
    elseif v5 == v2.PurchasePromptIncludingWarning then
        return true, v4.getPurchasePromptIncludingWarning();
    elseif v5 == v2.DisableResellingCollectiblesForCompliance then
        return true, v4.getDisableResellingCollectiblesForCompliance();
    elseif v5 == v2.CatalogPremiumCategory then
        return true, v4.getCatalogPremiumCategory();
    elseif v5 == v2.CatalogPremiumContent then
        return true, v4.getShowCatalogPremiumContent();
    elseif v5 == v2.ShowVNGTosForRobuxUpsell then
        return true, v4.getShowVNGTosForRobuxUpsell();
    elseif v5 == v2.ShouldUseDMCCALegalDisclosureInApp then
        return true, v4.getShouldUseDMCCALegalDisclosureInApp();
    elseif v5 == v2.RedirectBuyRobuxToVNG then
        return true, v4.getRedirectBuyRobuxToVNG();
    elseif v5 == v2.RobuxUpsellFlowMobile then
        return true, v4.getRobuxUpsellFlowMobile();
    elseif v5 == v2.EnablePremiumUserFeatures then
        return true, v4.getEnablePremiumUserFeatures();
    elseif v5 == v2.DisablePremiumEntrypoint then
        return true, v4.getDisablePremiumEntrypoint();
    else
        return false, nil;
    end;
end;