local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Roact);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_RoactPaginator_0 = require(l_script_FirstAncestor_0.SocialLibraries).RoactPaginator;
local l_searchFilterPredicate_0 = require(l_script_FirstAncestor_0.SocialLibraries).Utils.searchFilterPredicate;
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local v9 = require(script.Parent.ConversationList);
local v10 = require(l_script_FirstAncestor_0.LegacyAnalytics.withAnalytics);
local v11 = require(l_script_FirstAncestor_0.Telemetry.withTelemetry);
local v12 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatPerfTracking);
local v13 = require(l_script_FirstAncestor_0.Telemetry.AppChatPerfTracker);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("ChatLanding");
local v15 = require(l_script_FirstAncestor_1.ChatLandingTelemetryEvents);
local v16 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatLandingTelemetryLayer);
local l_FFlagAppIaScrollAway_0 = require(l_Parent_0.SharedFlags).FFlagAppIaScrollAway;
local l_PartyPageCarouselExperimentation_0 = require(l_Parent_0.SocialExperiments).PartyPageCarouselExperimentation;
local v19 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatConversationBadgingLogging);
local l_FFlagIsSquadEnabledAMP_0 = require(l_Parent_0.SharedFlags).FFlagIsSquadEnabledAMP;
local v21 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatGroupOsaAnalytics);
local l_FFlagAppChatTelemetryStats_0 = require(l_script_FirstAncestor_0.Flags).FFlagAppChatTelemetryStats;
local v23 = v4.PureComponent:extend("ConversationListWithTopBar");
v23.defaultProps = {
    filterText = nil, 
    isDebugEnabled = false, 
    itemList = {}, 
    navigateToSquadLobby = function() --[[ Line: 38 ]] --[[ Name: navigateToSquadLobby ]]

    end, 
    topBarHeight = 0, 
    entryHeight = 64, 
    canvasTopPadding = l_FFlagAppIaScrollAway_0 and 0 or nil, 
    isPartyQuickStartEnabled = not l_FFlagIsSquadEnabledAMP_0 and nil
};
v23.getDerivedStateFromProps = function(v24) --[[ Line: 45 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v3 (copy), l_searchFilterPredicate_0 (copy)
    local l_filterText_0 = v24.filterText;
    local l_itemList_0 = v24.itemList;
    return {
        filteredItemList = v3.List.filterMap(l_itemList_0, function(v27) --[[ Line: 50 ]]
            -- upvalues: l_searchFilterPredicate_0 (ref), l_filterText_0 (copy)
            local l_title_0 = v27.title;
            if l_searchFilterPredicate_0(l_filterText_0, l_title_0) then
                return v27;
            else
                return nil;
            end;
        end)
    };
end;
v23.init = function(v29) --[[ Line: 62 ]] --[[ Name: init ]]
    -- upvalues: l_memoize_0 (copy), l_RoactPaginator_0 (copy), v12 (copy), v13 (copy), v3 (copy), l_HttpService_0 (copy), v15 (copy), v19 (copy), v21 (copy), l_FFlagAppChatTelemetryStats_0 (copy)
    v29.showErrorToast = function(v30) --[[ Line: 63 ]]
        -- upvalues: v29 (copy)
        v29.props.navigateToToast({
            toastProps = {
                toastContent = {
                    toastTitle = v30
                }
            }
        });
    end;
    v29.reportAnalytics = function(v31) --[[ Line: 73 ]]
        -- upvalues: v29 (copy)
        if not v29.props.conversationsIsFetching and not v29.props.oldestConversationIsFetched then
            v31:userFetchedOlderConversations(v29.props.localUserId);
        end;
    end;
    v29.loadNext = l_memoize_0(function(v32) --[[ Line: 79 ]]
        -- upvalues: v29 (copy), l_RoactPaginator_0 (ref), v12 (ref), v13 (ref)
        return function(v33) --[[ Line: 80 ]]
            -- upvalues: v29 (ref), l_RoactPaginator_0 (ref), v32 (copy), v12 (ref), v13 (ref)
            if v29.props[l_RoactPaginator_0.loadNext] then
                v29.reportAnalytics(v32);
                if v12 then
                    v13.start(v13.Events.PaginationConversationList);
                end;
                v29.props[l_RoactPaginator_0.loadNext](v33);
            end;
        end;
    end);
    v29.isFiltered = v29.props.filterText and v29.props.filterText:match("%S");
    v29.indexOfList = l_memoize_0(function(v34, v35) --[[ Line: 93 ]]
        -- upvalues: v3 (ref)
        local v37 = table.find(v3.List.map(v34, function(v36) --[[ Line: 95 ]]
            return v36.id;
        end), v35);
        if v37 then
            return v37;
        else
            return 0;
        end;
    end);
    v29.formatParticipantIds = function(v38) --[[ Line: 106 ]]
        -- upvalues: v3 (ref), l_HttpService_0 (ref)
        local v40 = v3.List.filterMap(v38 or {}, function(v39) --[[ Line: 107 ]]
            if not v39.id then
                return nil;
            else
                return (tonumber(v39.id));
            end;
        end);
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 114 ]]
            -- upvalues: l_HttpService_0 (ref), v40 (copy)
            return l_HttpService_0:JSONEncode(v40);
        end);
        if l_status_0 then
            return l_result_0;
        else
            return "[]";
        end;
    end;
    v29.fireClickEvent = function(v43, v44, v45) --[[ Line: 120 ]]
        -- upvalues: v15 (ref), v29 (copy), v19 (ref), v21 (ref), l_FFlagAppChatTelemetryStats_0 (ref)
        local l_id_0 = v43.id;
        v44.emit(v15.ConversationClicked, {
            isFiltered = v29.isFiltered ~= nil, 
            conversationListCount = #v29.state.filteredItemList, 
            selectedConversationId = l_id_0, 
            selectedIndex = v29.indexOfList(v29.state.filteredItemList, l_id_0), 
            hasUnreadMessages = v43.hasUnreadMessages, 
            selectedConversationModerationType = if v43 then v43.moderationType else nil, 
            selectedConversationUserPendingStatus = if v43 then v43.userPendingStatus else nil, 
            participantUserIds = if v19 then v29.formatParticipantIds(v43.participants) else nil, 
            osaAcknowledgementStatus = if v21 then v43.osaAcknowledgementStatus else nil, 
            osaImpressionId = if v21 then v45 else nil
        });
        if l_FFlagAppChatTelemetryStats_0 then
            v44.emit(v15.ConversationClickedIndexStat, {
                statValue = v29.indexOfList(v29.state.filteredItemList, l_id_0) or 0
            });
        end;
    end;
    if v19 then
        v29.fireConversationImpressionEvent = l_memoize_0(function(v47) --[[ Line: 148 ]]
            -- upvalues: v15 (ref), v29 (copy), v21 (ref), l_FFlagAppChatTelemetryStats_0 (ref)
            return function(v48) --[[ Line: 149 ]]
                -- upvalues: v47 (copy), v15 (ref), v29 (ref), v21 (ref), l_FFlagAppChatTelemetryStats_0 (ref)
                local l_id_1 = v48.id;
                v47.emit(v15.ConversationCellRendered, {
                    isFiltered = v29.isFiltered ~= nil, 
                    conversationListCount = #v29.state.filteredItemList, 
                    selectedConversationId = l_id_1, 
                    selectedIndex = v29.indexOfList(v29.state.filteredItemList, l_id_1), 
                    hasUnreadMessages = v48.hasUnreadMessages, 
                    selectedConversationModerationType = v48.moderationType, 
                    selectedConversationUserPendingStatus = v48.userPendingStatus, 
                    participantUserIds = v29.formatParticipantIds(v48.participants), 
                    osaAcknowledgementStatus = if v21 then v48.osaAcknowledgementStatus else nil
                });
                if l_FFlagAppChatTelemetryStats_0 then
                    v47.emit(v15.ConversationCellRenderedIndexStat, {
                        statValue = v29.indexOfList(v29.state.filteredItemList, l_id_1) or 0
                    });
                end;
            end;
        end);
    end;
    v29.onActivated = v21 and function(v50) --[[ Line: 176 ]]
        -- upvalues: v12 (ref), v13 (ref), v29 (copy)
        if v12 then
            v13.start(v13.Events.ChatConversationTTI, {
                conversationId = tostring(v50.id)
            });
        end;
        v29.props.navigateToConversation(v50.id);
    end or l_memoize_0(function(_, v52) --[[ Line: 184 ]]
        -- upvalues: v12 (ref), v13 (ref), v29 (copy)
        return function(v53) --[[ Line: 185 ]]
            -- upvalues: v12 (ref), v13 (ref), v29 (ref), v52 (copy)
            if v12 then
                v13.start(v13.Events.ChatConversationTTI, {
                    conversationId = tostring(v53.id)
                });
            end;
            v29.props.navigateToConversation(v53.id);
            v29.fireClickEvent(v53, v52);
        end;
    end);
end;
v23.render = function(v54) --[[ Line: 198 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), v11 (copy), v16 (copy), l_withLocalization_0 (copy), v4 (copy), v9 (copy), l_PartyPageCarouselExperimentation_0 (copy), v21 (copy), l_FFlagAppIaScrollAway_0 (copy), v19 (copy)
    return v10(function(v55) --[[ Line: 199 ]]
        -- upvalues: v11 (ref), v16 (ref), l_withLocalization_0 (ref), v54 (copy), v4 (ref), v9 (ref), l_PartyPageCarouselExperimentation_0 (ref), v21 (ref), l_FFlagAppIaScrollAway_0 (ref), v19 (ref)
        return v11(v16.Context)(function(v56) --[[ Line: 200 ]]
            -- upvalues: l_withLocalization_0 (ref), v54 (ref), v4 (ref), v9 (ref), v55 (copy), l_PartyPageCarouselExperimentation_0 (ref), v21 (ref), l_FFlagAppIaScrollAway_0 (ref), v19 (ref)
            return l_withLocalization_0({
                somethingWrongText = "Feature.Toast.NetworkingError.SomethingIsWrong"
            })(function(v57) --[[ Line: 203 ]]
                -- upvalues: v54 (ref), v4 (ref), v9 (ref), v55 (ref), l_PartyPageCarouselExperimentation_0 (ref), v21 (ref), v56 (copy), l_FFlagAppIaScrollAway_0 (ref), v19 (ref)
                local v58 = v54.props.filterText and v54.props.filterText:match("%S");
                local v59 = v4.createElement(v9, {
                    Size = UDim2.fromScale(1, 1), 
                    itemList = v58 and v54.state.filteredItemList or v54.props.itemList, 
                    loadNext = v54.loadNext(v55), 
                    isDebugEnabled = v54.props.isDebugEnabled, 
                    isWideMode = if l_PartyPageCarouselExperimentation_0.getPartyPageCarouselEnabled() then v54.props.isWideMode else nil, 
                    filterText = v54.props.filterText, 
                    onActivated = if v21 then v54.onActivated else v54.onActivated(v57, v56), 
                    entryHeight = v54.props.entryHeight, 
                    navigateToSquadLobby = v54.props.navigateToSquadLobby, 
                    isInExperience = v54.props.isInExperience, 
                    navigateToConversationFromUserId = if l_PartyPageCarouselExperimentation_0.getPartyPageCarouselEnabled() then v54.props.navigateToConversationFromUserId else nil, 
                    navigateToQuickStartSquadInviteFriends = if l_PartyPageCarouselExperimentation_0.getPartyPageCarouselEnabled() then v54.props.navigateToQuickStartSquadInviteFriends else nil, 
                    shouldShowPhoneVerificationUpsell = v54.props.shouldShowPhoneVerificationUpsell, 
                    shouldShowUnfilteredAccessFtux = v54.props.shouldShowUnfilteredAccessFtux, 
                    shouldShowPartyUpsellFtux = v54.props.shouldShowPartyUpsellFtux, 
                    dismissUnfilteredThreadsFtux = v54.props.dismissUnfilteredThreadsFtux, 
                    showGroupsLink = v54.props.showGroupsLink, 
                    canvasTopPadding = if l_FFlagAppIaScrollAway_0 then v54.props.canvasTopPadding else nil, 
                    fireConversationImpressionEvent = if v19 then v54.fireConversationImpressionEvent(v56) else nil, 
                    isPartyQuickStartEnabled = v54.props.isPartyQuickStartEnabled, 
                    fireConversationClickedEvent = if v21 then v54.fireClickEvent else nil
                });
                return v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    conversationList = v59
                });
            end);
        end);
    end);
end;
v23.didMount = function(v60) --[[ Line: 250 ]] --[[ Name: didMount ]]
    v60.isMounted = true;
end;
v23.didUpdate = function(v61, v62) --[[ Line: 254 ]] --[[ Name: didUpdate ]]
    -- upvalues: v12 (copy), v13 (copy)
    if v12 and #v61.props.itemList > #v62.itemList then
        v13.finish(v13.Events.PaginationConversationList);
    end;
end;
v23.willUnmount = function(v63) --[[ Line: 260 ]] --[[ Name: willUnmount ]]
    v63.isMounted = false;
end;
return v23;