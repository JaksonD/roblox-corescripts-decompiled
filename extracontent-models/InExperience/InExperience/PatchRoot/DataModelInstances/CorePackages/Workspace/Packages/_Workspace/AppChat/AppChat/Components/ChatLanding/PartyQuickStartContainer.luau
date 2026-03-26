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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v18 = if game.PlaceId > 0 then tostring(game.PlaceId) else nil;
local v19 = if game.GameId > 0 then tostring(game.GameId) else nil;
PartyQuickStartContainer = function(v20) --[[ Line: 33 ]] --[[ Name: PartyQuickStartContainer ]]
    -- upvalues: v5 (copy), l_useChatPlacementContext_0 (copy), l_useNavigation_0 (copy), l_useLocalization_0 (copy), v8 (copy), l_HttpService_0 (copy), v4 (copy), v18 (copy), v19 (copy), v16 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v14 (copy), l_Images_0 (copy), v15 (copy), v13 (copy)
    local v21 = v5();
    local v22 = l_useChatPlacementContext_0();
    local v23 = l_useNavigation_0();
    local v24 = l_useLocalization_0({
        titleText = "Feature.Squads.Label.StartParty", 
        subTitleText = "Feature.Squads.Label.JoinExperiencesTogether"
    });
    local v26 = v8.useCallback(function() --[[ Line: 43 ]]
        -- upvalues: l_HttpService_0 (ref), v21 (copy), v4 (ref), v22 (copy), v18 (ref), v19 (ref), v23 (copy), v16 (ref)
        local v25 = l_HttpService_0:GenerateGUID(false);
        v21.fireAnalyticsEvent(v4.ChatLandingPartyQuickStartButtonClicked, {
            clickLocation = v22.chatPlacement, 
            partyAttemptId = v25, 
            placeId = v18, 
            universeId = v19
        });
        v23.navigate(v16.QuickStartSquadInviteFriends, {
            partyAttemptId = v25
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v21, 
        v23, 
        v22.chatPlacement
    } else l_dependencyArray_0(v21, v23, v22.chatPlacement));
    return v8.createElement(v14, {
        entryHeight = v20.entryHeight, 
        entryIcon = l_Images_0["icons/actions/friends/friendsplaying"], 
        onActivated = v26, 
        titleText = v24.titleText, 
        subTitleText = v24.subTitleText, 
        testId = if v15 then v13.chatLandingConversationListHeader("startParty") else nil
    });
end;
return PartyQuickStartContainer;