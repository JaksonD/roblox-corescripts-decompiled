local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local l_ResponseIndicator_0 = require(l_script_FirstAncestor_0.SocialLibraries).Components.ResponseIndicator;
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v5.memo;
local v8 = require(l_Parent_0.Promise);
local l_useCallback_0 = v5.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v5.useEffect;
local v12 = require(l_script_FirstAncestor_0.Hooks.useIsGroupChatEnabled);
local v13 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local l_useState_0 = v5.useState;
local l_useRef_0 = v5.useRef;
local v16 = require(l_Parent_0.AppNavBar);
local v17 = require(l_script_FirstAncestor_0.Models.Conversation);
local _ = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v19 = require(l_script_FirstAncestor_0.Conversations.Thunks.createConversation);
local v20 = require(l_script_FirstAncestor_0.Conversations.Thunks.parseCreateConversationErrors);
local v21 = if require(l_script_FirstAncestor_0.Flags.FFlagAppChatUseNewSelectChatMembersContainer) then require(l_script_FirstAncestor_0.Components.SelectChatMembers.SelectChatMembersContainer) else require(l_script_FirstAncestor_0.Components.SelectChatMembers.SelectChatMembersContainerDeprecated);
local v22 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v23 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local v24 = require(l_script_FirstAncestor_0.Analytics.Enums.CreateConversationError);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local v26 = require(l_Parent_0.SharedFlags);
local l_FFlagAppIaScrollAway_0 = v26.FFlagAppIaScrollAway;
local l_FFlagAppIaScrollAwayFixSocial_0 = v26.FFlagAppIaScrollAwayFixSocial;
local l_GetFFlagIsSquadEnabled_0 = v26.GetFFlagIsSquadEnabled;
local l_FFlagConnectionsToFriendsRename_0 = v26.FFlagConnectionsToFriendsRename;
local l_FFlagRemoveDependencyArrayAntipattern_0 = v26.FFlagRemoveDependencyArrayAntipattern;
local v34 = {
    systemButtonText = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Action.Create" or "Feature.Chat.Action.StartChatWithFriends", 
    pageHeaderText = if l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() then l_FFlagConnectionsToFriendsRename_0 and "Feature.Chat.Heading.PartyWithFriends" or "Feature.Chat.Heading.PartyWithConnections" else "Feature.Chat.Heading.ChatWithConnections", 
    topBarHeight = nil, 
    minSelections = 1, 
    maxSelections = 5, 
    maxConversationSize = 5, 
    conversation = v17.empty(), 
    setSystemButtonActivated = function(_) --[[ Line: 86 ]] --[[ Name: setSystemButtonActivated ]]

    end, 
    setSystemButtonEnabled = function(_) --[[ Line: 87 ]] --[[ Name: setSystemButtonEnabled ]]

    end
};
CreateNewChatContainer = function(v35) --[[ Line: 91 ]] --[[ Name: CreateNewChatContainer ]]
    -- upvalues: v4 (copy), v34 (copy), l_useRef_0 (copy), l_useState_0 (copy), l_FFlagAppIaScrollAway_0 (copy), l_FFlagAppIaScrollAwayFixSocial_0 (copy), v13 (copy), v12 (copy), l_useDispatch_0 (copy), l_useCallback_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v23 (copy), v8 (copy), v19 (copy), v20 (copy), v22 (copy), v24 (copy), l_useEffect_0 (copy), v5 (copy), v16 (copy), l_ResponseIndicator_0 (copy), v21 (copy)
    local v36 = v4.Dictionary.join(v34, v35);
    local v37 = l_useRef_0({});
    local v38 = l_useRef_0(false);
    local v39, v40 = l_useState_0(false);
    local v41 = if not l_FFlagAppIaScrollAway_0 or l_FFlagAppIaScrollAwayFixSocial_0 then nil else v13();
    local l_maxSelections_0 = v36.maxSelections;
    local l_maxConversationSize_0 = v36.maxConversationSize;
    local v44 = false;
    if not v12() then
        l_maxSelections_0 = 1;
        l_maxConversationSize_0 = 1;
        v44 = true;
    end;
    local v45 = l_useDispatch_0();
    local v47 = l_useCallback_0(function(v46) --[[ Line: 113 ]]
        -- upvalues: v36 (copy)
        v36.navigateToToast({
            toastProps = {
                toastContent = {
                    toastTitle = v46
                }
            }
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v36.navigateToToast
    } else l_dependencyArray_0(v36.navigateToToast));
    local function v52(v48, v49) --[[ Line: 127 ]]
        -- upvalues: v37 (copy), v4 (ref), v38 (copy), v36 (copy)
        v37.current = v4.List.map(v48, function(v50) --[[ Line: 128 ]]
            return v50.id;
        end);
        local v51 = v49 <= #v48;
        if v38.current ~= v51 then
            v38.current = v51;
            v36.setSystemButtonEnabled(v51);
        end;
    end;
    local v53 = v23();
    local v59 = l_useCallback_0(function(v54) --[[ Line: 141 ]]
        -- upvalues: v39 (copy), v37 (copy), v8 (ref), v40 (copy), v45 (copy), v19 (ref), v53 (copy), v36 (copy), v20 (ref), v47 (copy), v22 (ref), v24 (ref)
        if v39 or not v37.current then
            return v8.resolve();
        else
            v40(true);
            local v55 = #v37.current == 1 and "one_to_one" or "group";
            return v45(v19(v55, v37.current, v53, "userCreatedNewConversation")):andThen(function(v56) --[[ Line: 162 ]]
                -- upvalues: v36 (ref)
                v36.navigateToConversation(v56.id);
            end):catch(function(v57) --[[ Line: 166 ]]
                -- upvalues: v20 (ref), v54 (copy), v47 (ref), v40 (ref), v53 (ref), v22 (ref), v24 (ref)
                local v58 = if v20(v57) == "participant_chat_disabled" then v54.invalidParticipantText else v54.networkErrorText;
                v47(v58);
                v40(false);
                if v53 then
                    v53.fireAnalyticsEvent(v22.NewConversationCreated, {
                        createConversationResult = v24.FetchConversationError
                    });
                end;
            end);
        end;
    end, {
        v45, 
        v39, 
        v40, 
        v37, 
        v36.navigateToConversation, 
        v47, 
        v53
    });
    l_useEffect_0(function() --[[ Line: 196 ]]
        -- upvalues: v36 (copy), v59 (copy)
        v36.setSystemButtonActivated(v59);
    end, {
        v36.setSystemButtonActivated, 
        v59
    });
    return v5.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Active = true, 
        AutoButtonColor = false
    }, {
        UIPadding = if not (not l_FFlagAppIaScrollAway_0 or l_FFlagAppIaScrollAwayFixSocial_0 or v41) and v16.getScrollAwayEnabled() and v36.topBarHeight ~= nil then v5.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v36.topBarHeight)
        }) else nil, 
        responseIndicator = v39 and v5.createElement(l_ResponseIndicator_0, {
            soakAreaColor3 = Color3.fromRGB(25, 25, 25), 
            soakAreaTransparency = 0.8
        }), 
        selectChatMembers = v5.createElement(v21, v4.Dictionary.join(v36, {
            selectedUsersChanged = v52, 
            maxSelections = l_maxSelections_0, 
            maxConversationSize = l_maxConversationSize_0, 
            canOnlyCreateOneToOneChat = v44
        }))
    });
end;
return l_memo_0(CreateNewChatContainer);