local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.Contexts.ChatPlacementContext);
local v4 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v5 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local l_useChatPlacementContext_0 = v3.useChatPlacementContext;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v8 = require(l_Parent_0.React);
local v9 = require(l_Parent_0.UIBlox);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_Images_0 = v9.App.ImageSet.Images;
local v13 = require(l_script_FirstAncestor_0.Utils.DomLocators);
local v14 = require(script.Parent.CustomConversationListEntry);
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableDomLocators);
local v16 = require(l_script_FirstAncestor_0.EnumScreens);
local v17 = if game.PlaceId > 0 then tostring(game.PlaceId) else nil;
local v18 = if game.GameId > 0 then tostring(game.GameId) else nil;
PartyQuickStartContainer = function(v19) --[[ Line: 31 ]] --[[ Name: PartyQuickStartContainer ]]
    -- upvalues: v5 (copy), l_useChatPlacementContext_0 (copy), l_useNavigation_0 (copy), l_useLocalization_0 (copy), v8 (copy), l_HttpService_0 (copy), v4 (copy), v17 (copy), v18 (copy), v16 (copy), l_dependencyArray_0 (copy), v14 (copy), l_Images_0 (copy), v15 (copy), v13 (copy)
    local v20 = v5();
    local v21 = l_useChatPlacementContext_0();
    local v22 = l_useNavigation_0();
    local v23 = l_useLocalization_0({
        titleText = "Feature.Squads.Label.StartParty", 
        subTitleText = "Feature.Squads.Label.JoinExperiencesTogether"
    });
    local v25 = v8.useCallback(function() --[[ Line: 40 ]]
        -- upvalues: l_HttpService_0 (ref), v20 (copy), v4 (ref), v21 (copy), v17 (ref), v18 (ref), v22 (copy), v16 (ref)
        local v24 = l_HttpService_0:GenerateGUID(false);
        v20.fireAnalyticsEvent(v4.ChatLandingPartyQuickStartButtonClicked, {
            clickLocation = v21.chatPlacement, 
            partyAttemptId = v24, 
            placeId = v17, 
            universeId = v18
        });
        v22.navigate(v16.QuickStartSquadInviteFriends, {
            partyAttemptId = v24
        });
    end, l_dependencyArray_0(v20, v22, v21.chatPlacement));
    return v8.createElement(v14, {
        entryHeight = v19.entryHeight, 
        entryIcon = l_Images_0["icons/actions/friends/friendsplaying"], 
        onActivated = v25, 
        titleText = v23.titleText, 
        subTitleText = v23.subTitleText, 
        testId = if v15 then v13.chatLandingConversationListHeader("startParty") else nil
    });
end;
return PartyQuickStartContainer;