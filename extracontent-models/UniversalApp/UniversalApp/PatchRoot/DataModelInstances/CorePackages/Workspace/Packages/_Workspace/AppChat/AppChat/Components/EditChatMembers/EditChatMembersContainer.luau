local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_script_FirstAncestor_0.SocialLibraries);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.Promise);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v5.memo;
local l_useCallback_0 = v5.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v5.useEffect;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useState_0 = v5.useState;
local l_useRef_0 = v5.useRef;
local v15 = require(l_Parent_0.AppChatNetworking);
local v16 = require(l_script_FirstAncestor_0.Conversations.Thunks.createConversation);
local v17 = require(l_script_FirstAncestor_0.Conversations.Thunks.parseCreateConversationErrors);
local v18 = require(l_script_FirstAncestor_0.Conversations.Thunks.expandToGroupConversation);
local v19 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local l_ResponseIndicator_0 = v3.Components.ResponseIndicator;
local v21 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatUseNewSelectChatMembersContainer);
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local v23 = if v21 then require(l_script_FirstAncestor_0.Components.SelectChatMembers.SelectChatMembersContainer) else require(l_script_FirstAncestor_0.Components.SelectChatMembers.SelectChatMembersContainerDeprecated);
local v24 = require(l_script_FirstAncestor_0.Models.Conversation);
local _ = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local v29 = {
    systemButtonText = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Action.Create" or "Feature.Chat.Action.StartChatWithFriends", 
    pageHeaderText = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Heading.PartyWithConnections" or "Feature.Chat.Heading.ChatWithConnections", 
    minSelections = 1, 
    maxSelections = 5, 
    maxConversationSize = 5, 
    topBarHeight = nil, 
    conversation = nil, 
    setSystemButtonActivated = function(_) --[[ Line: 76 ]] --[[ Name: setSystemButtonActivated ]]

    end, 
    setSystemButtonEnabled = function(_) --[[ Line: 77 ]] --[[ Name: setSystemButtonEnabled ]]

    end
};
return l_memo_0(function(v30) --[[ Line: 81 ]] --[[ Name: EditChatMembersContainer ]]
    -- upvalues: v4 (copy), v29 (copy), l_useRef_0 (copy), l_useState_0 (copy), v19 (copy), l_useSelector_0 (copy), l_useCallback_0 (copy), l_useDispatch_0 (copy), v15 (copy), l_dependencyArray_0 (copy), v16 (copy), v6 (copy), v17 (copy), v24 (copy), v18 (copy), l_useEffect_0 (copy), v5 (copy), l_ResponseIndicator_0 (copy), v23 (copy)
    local v31 = v4.Dictionary.join(v29, v30);
    local v32 = l_useRef_0({});
    local v33 = l_useRef_0(false);
    local v34, v35 = l_useState_0(false);
    local v36 = v19();
    local v38 = l_useSelector_0(l_useCallback_0(function(v37) --[[ Line: 88 ]]
        return v37.LocalUserId;
    end, {}));
    local v39 = l_useDispatch_0();
    local v42 = l_useCallback_0(function(v40, v41) --[[ Line: 94 ]]
        -- upvalues: v39 (copy), v15 (ref)
        return v39(v15.rodux.AddUserToConversation.API(v41, v40));
    end, l_dependencyArray_0(v39));
    local v44 = l_useCallback_0(function(v43) --[[ Line: 98 ]]
        -- upvalues: v39 (copy), v16 (ref), v36 (copy)
        return v39(v16("group", v43, v36, "userAddedParticipantToOneToOne"));
    end, l_dependencyArray_0(v39));
    local v46 = l_useCallback_0(function(v45) --[[ Line: 104 ]]
        -- upvalues: v31 (copy)
        v31.navigateToToast({
            toastProps = {
                toastContent = {
                    toastTitle = v45
                }
            }
        });
    end, l_dependencyArray_0(v31.navigateToToast));
    local function v51(v47, v48) --[[ Line: 114 ]]
        -- upvalues: v32 (copy), v4 (ref), v33 (copy), v31 (copy)
        v32.current = v4.List.map(v47, function(v49) --[[ Line: 115 ]]
            return v49.id;
        end);
        local v50 = v48 <= #v47;
        if v33.current ~= v50 then
            v33.current = v50;
            v31.setSystemButtonEnabled(v50);
        end;
    end;
    local v64 = l_useCallback_0(function(v52) --[[ Line: 126 ]]
        -- upvalues: v34 (copy), v6 (ref), v31 (copy), v17 (ref), v46 (copy), v35 (copy), v24 (ref), v42 (copy), v32 (copy), v4 (ref), v38 (copy), v39 (copy), v18 (ref), v36 (copy), v44 (copy)
        if v34 then
            return v6.resolve();
        else
            local l_id_0 = v31.conversation.id;
            local l_conversationType_0 = v31.conversation.conversationType;
            local function v57(v55) --[[ Line: 132 ]]
                -- upvalues: v17 (ref), v52 (copy), v46 (ref), v35 (ref)
                local v56 = if v17(v55) == "participant_chat_disabled" then v52.invalidParticipantText else v52.networkErrorText;
                v46(v56);
                v35(false);
            end;
            v35(true);
            if l_conversationType_0 == v24.Type.MULTI_USER_CONVERSATION then
                return v42(v32.current, l_id_0):andThen(function() --[[ Line: 144 ]]
                    -- upvalues: v31 (ref), l_id_0 (copy)
                    v31.navigateToConversation(l_id_0);
                end, v57);
            elseif l_conversationType_0 == v24.Type.ONE_TO_ONE_CONVERSATION then
                local v59 = v4.List.filter(v4.List.join(v32.current, v31.conversation.participants), function(v58) --[[ Line: 150 ]]
                    -- upvalues: v38 (ref)
                    return v58 ~= v38;
                end);
                if v31.conversation.source == "channels" or v31.conversation.source == "chat" then
                    return v39(v18(l_id_0, v59, v36)):andThen(function(v60) --[[ Line: 158 ]]
                        -- upvalues: v31 (ref)
                        v31.navigateToConversation(v60.id);
                    end, v57);
                else
                    return v44(v59):andThen(function(v61) --[[ Line: 162 ]]
                        -- upvalues: v31 (ref)
                        v31.navigateToConversation(v61.id);
                    end, v57);
                end;
            else
                local v62 = {
                    Body = "conversationType not supported", 
                    StatusCode = 400
                };
                local v63 = if v17(v62) == "participant_chat_disabled" then v52.invalidParticipantText else v52.networkErrorText;
                v46(v63);
                v35(false);
                return v6.reject(string.format("conversationType not supported: %q", (tostring(l_conversationType_0))));
            end;
        end;
    end, {
        v39, 
        v34, 
        v35, 
        v32, 
        v31.navigateToConversation, 
        v31.conversation.id, 
        v31.conversation.conversationType, 
        v31.conversation.participants, 
        v31.conversation.source, 
        v46, 
        v36
    });
    l_useEffect_0(function() --[[ Line: 188 ]]
        -- upvalues: v31 (copy), v64 (copy)
        v31.setSystemButtonActivated(v64);
    end, {
        v31.setSystemButtonActivated, 
        v64
    });
    return v5.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Active = true, 
        AutoButtonColor = false
    }, {
        responseIndicator = v34 and v5.createElement(l_ResponseIndicator_0, {
            soakAreaColor3 = Color3.fromRGB(25, 25, 25), 
            soakAreaTransparency = 0.8
        }), 
        selectChatMembers = v5.createElement(v23, v4.Dictionary.join(v31, {
            maxSelections = v31.maxSelections - #v31.conversation.participants + 1, 
            selectedUsersChanged = v51, 
            localUserId = v38
        }))
    });
end);