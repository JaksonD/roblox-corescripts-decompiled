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
local v32 = {
    systemButtonText = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Action.Create" or "Feature.Chat.Action.StartChatWithFriends", 
    pageHeaderText = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Heading.PartyWithConnections" or "Feature.Chat.Heading.ChatWithConnections", 
    topBarHeight = nil, 
    minSelections = 1, 
    maxSelections = 5, 
    maxConversationSize = 5, 
    conversation = v17.empty(), 
    setSystemButtonActivated = function(_) --[[ Line: 81 ]] --[[ Name: setSystemButtonActivated ]]

    end, 
    setSystemButtonEnabled = function(_) --[[ Line: 82 ]] --[[ Name: setSystemButtonEnabled ]]

    end
};
CreateNewChatContainer = function(v33) --[[ Line: 86 ]] --[[ Name: CreateNewChatContainer ]]
    -- upvalues: v4 (copy), v32 (copy), l_useRef_0 (copy), l_useState_0 (copy), l_FFlagAppIaScrollAway_0 (copy), l_FFlagAppIaScrollAwayFixSocial_0 (copy), v13 (copy), v12 (copy), l_useDispatch_0 (copy), l_useCallback_0 (copy), l_dependencyArray_0 (copy), v23 (copy), v8 (copy), v19 (copy), v20 (copy), v22 (copy), v24 (copy), l_useEffect_0 (copy), v5 (copy), v16 (copy), l_ResponseIndicator_0 (copy), v21 (copy)
    local v34 = v4.Dictionary.join(v32, v33);
    local v35 = l_useRef_0({});
    local v36 = l_useRef_0(false);
    local v37, v38 = l_useState_0(false);
    local v39 = if not l_FFlagAppIaScrollAway_0 or l_FFlagAppIaScrollAwayFixSocial_0 then nil else v13();
    local l_maxSelections_0 = v34.maxSelections;
    local l_maxConversationSize_0 = v34.maxConversationSize;
    local v42 = false;
    if not v12() then
        l_maxSelections_0 = 1;
        l_maxConversationSize_0 = 1;
        v42 = true;
    end;
    local v43 = l_useDispatch_0();
    local v45 = l_useCallback_0(function(v44) --[[ Line: 107 ]]
        -- upvalues: v34 (copy)
        v34.navigateToToast({
            toastProps = {
                toastContent = {
                    toastTitle = v44
                }
            }
        });
    end, l_dependencyArray_0(v34.navigateToToast));
    local function v50(v46, v47) --[[ Line: 117 ]]
        -- upvalues: v35 (copy), v4 (ref), v36 (copy), v34 (copy)
        v35.current = v4.List.map(v46, function(v48) --[[ Line: 118 ]]
            return v48.id;
        end);
        local v49 = v47 <= #v46;
        if v36.current ~= v49 then
            v36.current = v49;
            v34.setSystemButtonEnabled(v49);
        end;
    end;
    local v51 = v23();
    local v57 = l_useCallback_0(function(v52) --[[ Line: 131 ]]
        -- upvalues: v37 (copy), v35 (copy), v8 (ref), v38 (copy), v43 (copy), v19 (ref), v51 (copy), v34 (copy), v20 (ref), v45 (copy), v22 (ref), v24 (ref)
        if v37 or not v35.current then
            return v8.resolve();
        else
            v38(true);
            local v53 = #v35.current == 1 and "one_to_one" or "group";
            return v43(v19(v53, v35.current, v51, "userCreatedNewConversation")):andThen(function(v54) --[[ Line: 152 ]]
                -- upvalues: v34 (ref)
                v34.navigateToConversation(v54.id);
            end):catch(function(v55) --[[ Line: 156 ]]
                -- upvalues: v20 (ref), v52 (copy), v45 (ref), v38 (ref), v51 (ref), v22 (ref), v24 (ref)
                local v56 = if v20(v55) == "participant_chat_disabled" then v52.invalidParticipantText else v52.networkErrorText;
                v45(v56);
                v38(false);
                if v51 then
                    v51.fireAnalyticsEvent(v22.NewConversationCreated, {
                        createConversationResult = v24.FetchConversationError
                    });
                end;
            end);
        end;
    end, {
        v43, 
        v37, 
        v38, 
        v35, 
        v34.navigateToConversation, 
        v45, 
        v51
    });
    l_useEffect_0(function() --[[ Line: 186 ]]
        -- upvalues: v34 (copy), v57 (copy)
        v34.setSystemButtonActivated(v57);
    end, {
        v34.setSystemButtonActivated, 
        v57
    });
    return v5.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Active = true, 
        AutoButtonColor = false
    }, {
        UIPadding = if not (not l_FFlagAppIaScrollAway_0 or l_FFlagAppIaScrollAwayFixSocial_0 or v39) and v16.getScrollAwayEnabled() and v34.topBarHeight ~= nil then v5.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v34.topBarHeight)
        }) else nil, 
        responseIndicator = v37 and v5.createElement(l_ResponseIndicator_0, {
            soakAreaColor3 = Color3.fromRGB(25, 25, 25), 
            soakAreaTransparency = 0.8
        }), 
        selectChatMembers = v5.createElement(v21, v4.Dictionary.join(v34, {
            selectedUsersChanged = v50, 
            maxSelections = l_maxSelections_0, 
            maxConversationSize = l_maxConversationSize_0, 
            canOnlyCreateOneToOneChat = v42
        }))
    });
end;
return l_memo_0(CreateNewChatContainer);