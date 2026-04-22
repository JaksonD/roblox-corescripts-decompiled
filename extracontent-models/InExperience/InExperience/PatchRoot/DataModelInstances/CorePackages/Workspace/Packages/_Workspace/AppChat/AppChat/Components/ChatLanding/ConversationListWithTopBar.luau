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
local l_FFlagIsSquadEnabledAMP_0 = require(l_Parent_0.SharedFlags).FFlagIsSquadEnabledAMP;
local v20 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatGroupOsaAnalytics);
local l_FFlagAppChatTelemetryStats_0 = require(l_script_FirstAncestor_0.Flags).FFlagAppChatTelemetryStats;
local v22 = v4.PureComponent:extend("ConversationListWithTopBar");
v22.defaultProps = {
    filterText = nil, 
    isDebugEnabled = false, 
    itemList = {}, 
    navigateToSquadLobby = function() --[[ Line: 37 ]] --[[ Name: navigateToSquadLobby ]]

    end, 
    topBarHeight = 0, 
    entryHeight = 64, 
    canvasTopPadding = l_FFlagAppIaScrollAway_0 and 0 or nil, 
    isPartyQuickStartEnabled = not l_FFlagIsSquadEnabledAMP_0 and nil
};
v22.getDerivedStateFromProps = function(v23) --[[ Line: 44 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v3 (copy), l_searchFilterPredicate_0 (copy)
    local l_filterText_0 = v23.filterText;
    local l_itemList_0 = v23.itemList;
    return {
        filteredItemList = v3.List.filterMap(l_itemList_0, function(v26) --[[ Line: 49 ]]
            -- upvalues: l_searchFilterPredicate_0 (ref), l_filterText_0 (copy)
            local l_title_0 = v26.title;
            if l_searchFilterPredicate_0(l_filterText_0, l_title_0) then
                return v26;
            else
                return nil;
            end;
        end)
    };
end;
v22.init = function(v28) --[[ Line: 61 ]] --[[ Name: init ]]
    -- upvalues: l_memoize_0 (copy), l_RoactPaginator_0 (copy), v12 (copy), v13 (copy), v3 (copy), l_HttpService_0 (copy), v15 (copy), v20 (copy), l_FFlagAppChatTelemetryStats_0 (copy)
    v28.showErrorToast = function(v29) --[[ Line: 62 ]]
        -- upvalues: v28 (copy)
        v28.props.navigateToToast({
            toastProps = {
                toastContent = {
                    toastTitle = v29
                }
            }
        });
    end;
    v28.reportAnalytics = function(v30) --[[ Line: 72 ]]
        -- upvalues: v28 (copy)
        if not v28.props.conversationsIsFetching and not v28.props.oldestConversationIsFetched then
            v30:userFetchedOlderConversations(v28.props.localUserId);
        end;
    end;
    v28.loadNext = l_memoize_0(function(v31) --[[ Line: 78 ]]
        -- upvalues: v28 (copy), l_RoactPaginator_0 (ref), v12 (ref), v13 (ref)
        return function(v32) --[[ Line: 79 ]]
            -- upvalues: v28 (ref), l_RoactPaginator_0 (ref), v31 (copy), v12 (ref), v13 (ref)
            if v28.props[l_RoactPaginator_0.loadNext] then
                v28.reportAnalytics(v31);
                if v12 then
                    v13.start(v13.Events.PaginationConversationList);
                end;
                v28.props[l_RoactPaginator_0.loadNext](v32);
            end;
        end;
    end);
    v28.isFiltered = v28.props.filterText and v28.props.filterText:match("%S");
    v28.indexOfList = l_memoize_0(function(v33, v34) --[[ Line: 92 ]]
        -- upvalues: v3 (ref)
        local v36 = table.find(v3.List.map(v33, function(v35) --[[ Line: 94 ]]
            return v35.id;
        end), v34);
        if v36 then
            return v36;
        else
            return 0;
        end;
    end);
    v28.formatParticipantIds = function(v37) --[[ Line: 105 ]]
        -- upvalues: v3 (ref), l_HttpService_0 (ref)
        local v39 = v3.List.filterMap(v37 or {}, function(v38) --[[ Line: 106 ]]
            if not v38.id then
                return nil;
            else
                return (tonumber(v38.id));
            end;
        end);
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 113 ]]
            -- upvalues: l_HttpService_0 (ref), v39 (copy)
            return l_HttpService_0:JSONEncode(v39);
        end);
        if l_status_0 then
            return l_result_0;
        else
            return "[]";
        end;
    end;
    v28.fireClickEvent = function(v42, v43, v44) --[[ Line: 119 ]]
        -- upvalues: v15 (ref), v28 (copy), v20 (ref), l_FFlagAppChatTelemetryStats_0 (ref)
        local l_id_0 = v42.id;
        v43.emit(v15.ConversationClicked, {
            isFiltered = v28.isFiltered ~= nil, 
            conversationListCount = #v28.state.filteredItemList, 
            selectedConversationId = l_id_0, 
            selectedIndex = v28.indexOfList(v28.state.filteredItemList, l_id_0), 
            hasUnreadMessages = v42.hasUnreadMessages, 
            selectedConversationModerationType = if v42 then v42.moderationType else nil, 
            selectedConversationUserPendingStatus = if v42 then v42.userPendingStatus else nil, 
            participantUserIds = v28.formatParticipantIds(v42.participants), 
            osaAcknowledgementStatus = if v20 then v42.osaAcknowledgementStatus else nil, 
            osaImpressionId = if v20 then v44 else nil
        });
        if l_FFlagAppChatTelemetryStats_0 then
            v43.emit(v15.ConversationClickedIndexStat, {
                statValue = v28.indexOfList(v28.state.filteredItemList, l_id_0) or 0
            });
        end;
    end;
    v28.fireConversationImpressionEvent = l_memoize_0(function(v46) --[[ Line: 143 ]]
        -- upvalues: v15 (ref), v28 (copy), v20 (ref), l_FFlagAppChatTelemetryStats_0 (ref)
        return function(v47) --[[ Line: 144 ]]
            -- upvalues: v46 (copy), v15 (ref), v28 (ref), v20 (ref), l_FFlagAppChatTelemetryStats_0 (ref)
            local l_id_1 = v47.id;
            v46.emit(v15.ConversationCellRendered, {
                isFiltered = v28.isFiltered ~= nil, 
                conversationListCount = #v28.state.filteredItemList, 
                selectedConversationId = l_id_1, 
                selectedIndex = v28.indexOfList(v28.state.filteredItemList, l_id_1), 
                hasUnreadMessages = v47.hasUnreadMessages, 
                selectedConversationModerationType = v47.moderationType, 
                selectedConversationUserPendingStatus = v47.userPendingStatus, 
                participantUserIds = v28.formatParticipantIds(v47.participants), 
                osaAcknowledgementStatus = if v20 then v47.osaAcknowledgementStatus else nil
            });
            if l_FFlagAppChatTelemetryStats_0 then
                v46.emit(v15.ConversationCellRenderedIndexStat, {
                    statValue = v28.indexOfList(v28.state.filteredItemList, l_id_1) or 0
                });
            end;
        end;
    end);
    v28.onActivated = v20 and function(v49) --[[ Line: 170 ]]
        -- upvalues: v12 (ref), v13 (ref), v28 (copy)
        if v12 then
            v13.start(v13.Events.ChatConversationTTI, {
                conversationId = tostring(v49.id)
            });
        end;
        v28.props.navigateToConversation(v49.id);
    end or l_memoize_0(function(_, v51) --[[ Line: 178 ]]
        -- upvalues: v12 (ref), v13 (ref), v28 (copy)
        return function(v52) --[[ Line: 179 ]]
            -- upvalues: v12 (ref), v13 (ref), v28 (ref), v51 (copy)
            if v12 then
                v13.start(v13.Events.ChatConversationTTI, {
                    conversationId = tostring(v52.id)
                });
            end;
            v28.props.navigateToConversation(v52.id);
            v28.fireClickEvent(v52, v51);
        end;
    end);
end;
v22.render = function(v53) --[[ Line: 192 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), v11 (copy), v16 (copy), l_withLocalization_0 (copy), v4 (copy), v9 (copy), l_PartyPageCarouselExperimentation_0 (copy), v20 (copy), l_FFlagAppIaScrollAway_0 (copy)
    return v10(function(v54) --[[ Line: 193 ]]
        -- upvalues: v11 (ref), v16 (ref), l_withLocalization_0 (ref), v53 (copy), v4 (ref), v9 (ref), l_PartyPageCarouselExperimentation_0 (ref), v20 (ref), l_FFlagAppIaScrollAway_0 (ref)
        return v11(v16.Context)(function(v55) --[[ Line: 194 ]]
            -- upvalues: l_withLocalization_0 (ref), v53 (ref), v4 (ref), v9 (ref), v54 (copy), l_PartyPageCarouselExperimentation_0 (ref), v20 (ref), l_FFlagAppIaScrollAway_0 (ref)
            return l_withLocalization_0({
                somethingWrongText = "Feature.Toast.NetworkingError.SomethingIsWrong"
            })(function(v56) --[[ Line: 197 ]]
                -- upvalues: v53 (ref), v4 (ref), v9 (ref), v54 (ref), l_PartyPageCarouselExperimentation_0 (ref), v20 (ref), v55 (copy), l_FFlagAppIaScrollAway_0 (ref)
                local v57 = v53.props.filterText and v53.props.filterText:match("%S");
                local v58 = v4.createElement(v9, {
                    Size = UDim2.fromScale(1, 1), 
                    itemList = v57 and v53.state.filteredItemList or v53.props.itemList, 
                    loadNext = v53.loadNext(v54), 
                    isDebugEnabled = v53.props.isDebugEnabled, 
                    isWideMode = if l_PartyPageCarouselExperimentation_0.getPartyPageCarouselEnabled() then v53.props.isWideMode else nil, 
                    filterText = v53.props.filterText, 
                    onActivated = if v20 then v53.onActivated else v53.onActivated(v56, v55), 
                    entryHeight = v53.props.entryHeight, 
                    navigateToSquadLobby = v53.props.navigateToSquadLobby, 
                    isInExperience = v53.props.isInExperience, 
                    navigateToConversationFromUserId = if l_PartyPageCarouselExperimentation_0.getPartyPageCarouselEnabled() then v53.props.navigateToConversationFromUserId else nil, 
                    navigateToQuickStartSquadInviteFriends = if l_PartyPageCarouselExperimentation_0.getPartyPageCarouselEnabled() then v53.props.navigateToQuickStartSquadInviteFriends else nil, 
                    shouldShowPhoneVerificationUpsell = v53.props.shouldShowPhoneVerificationUpsell, 
                    shouldShowUnfilteredAccessFtux = v53.props.shouldShowUnfilteredAccessFtux, 
                    shouldShowPartyUpsellFtux = v53.props.shouldShowPartyUpsellFtux, 
                    dismissUnfilteredThreadsFtux = v53.props.dismissUnfilteredThreadsFtux, 
                    showGroupsLink = v53.props.showGroupsLink, 
                    canvasTopPadding = if l_FFlagAppIaScrollAway_0 then v53.props.canvasTopPadding else nil, 
                    fireConversationImpressionEvent = v53.fireConversationImpressionEvent(v55), 
                    isPartyQuickStartEnabled = v53.props.isPartyQuickStartEnabled, 
                    fireConversationClickedEvent = if v20 then v53.fireClickEvent else nil
                });
                return v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    conversationList = v58
                });
            end);
        end);
    end);
end;
v22.didMount = function(v59) --[[ Line: 242 ]] --[[ Name: didMount ]]
    v59.isMounted = true;
end;
v22.didUpdate = function(v60, v61) --[[ Line: 246 ]] --[[ Name: didUpdate ]]
    -- upvalues: v12 (copy), v13 (copy)
    if v12 and #v60.props.itemList > #v61.itemList then
        v13.finish(v13.Events.PaginationConversationList);
    end;
end;
v22.willUnmount = function(v62) --[[ Line: 252 ]] --[[ Name: willUnmount ]]
    v62.isMounted = false;
end;
return v22;