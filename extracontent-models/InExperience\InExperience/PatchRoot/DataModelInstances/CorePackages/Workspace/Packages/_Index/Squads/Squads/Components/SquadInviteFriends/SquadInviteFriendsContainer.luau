local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local v3 = require(l_script_FirstAncestor_0.Enums.SquadInviteSourceEnum);
local v4 = require(l_script_FirstAncestor_0.Thunks.inviteToSquad);
local v5 = require(l_script_FirstAncestor_0.Thunks.InviteToParentChannel);
local v6 = require(l_Parent_0.NotificationModalsManager);
local v7 = require(l_Parent_0.Promise);
local v8 = require(l_Parent_0.UIBlox);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_Cryo_0 = v2.Cryo;
local l_dependencyArray_0 = v2.Hooks.dependencyArray;
local l_React_0 = v2.React;
local l_useCurrentSquadSelector_0 = v2.Hooks.useCurrentSquadSelector;
local l_useDispatch_0 = v2.Hooks.useDispatch;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_Constants_0 = v2.SquadsCore.Common.Constants;
local l_SquadExternalContractContext_0 = v2.SquadsCore.SquadExternalContractProvider.SquadExternalContractContext;
local l_EventNames_0 = v2.SquadsCore.Analytics.EventNames;
local l_SquadPromptType_0 = v2.SquadsCore.Enums.SquadPromptType;
local l_useNavigation_0 = v2.useNavigation;
local l_useStore_0 = v2.Hooks.useStore;
local l_Images_0 = v8.App.ImageSet.Images;
local l_FFlagEnableAppChatFocusableFixes_0 = v2.SharedFlags.FFlagEnableAppChatFocusableFixes;
local v25 = require(script.Parent.SquadInviteFriends);
return function(v26) --[[ Line: 34 ]] --[[ Name: SquadInviteFriendsContainer ]]
    -- upvalues: l_React_0 (copy), l_SquadExternalContractContext_0 (copy), l_useNavigation_0 (copy), l_useDispatch_0 (copy), l_useStore_0 (copy), l_useLocalization_0 (copy), l_useCurrentSquadSelector_0 (copy), l_useLocalUserId_0 (copy), l_useAppPolicy_0 (copy), l_Cryo_0 (copy), v6 (copy), l_Images_0 (copy), v3 (copy), l_EventNames_0 (copy), l_dependencyArray_0 (copy), v7 (copy), v5 (copy), v4 (copy), l_Constants_0 (copy), l_SquadPromptType_0 (copy), v25 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy)
    local v27 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v28 = l_useNavigation_0();
    local v29 = l_useDispatch_0();
    local v30 = l_useStore_0();
    local v31 = l_useLocalization_0({
        addText = "Feature.Squads.Action.Add", 
        user = "Feature.Squads.Description.User", 
        youAddedMoreThanTwoToChat = "Feature.Squads.Description.YouAddedMoreThanTwoToChat", 
        youAddedToChat = "Feature.Squads.Description.YouAddedToChat", 
        youAddedTwoToChat = "Feature.Squads.Description.YouAddedTwoToChat"
    });
    local v32 = l_React_0.useRef(false);
    local v33 = l_useCurrentSquadSelector_0();
    local v34 = if v33 and v33.parentChannelId then v33.parentChannelId else "";
    local v35 = v27.useGetConversationFromId(v34);
    local v36 = l_useLocalUserId_0();
    local v38 = l_React_0.useCallback(function(v37) --[[ Line: 58 ]]
        return v37.getCanUsePlatformChat();
    end, {});
    local v39 = l_useAppPolicy_0(v38);
    local v45 = l_React_0.useCallback(function(v40) --[[ Line: 66 ]]
        -- upvalues: l_Cryo_0 (ref), v31 (copy), v6 (ref), l_Images_0 (ref)
        local v41 = l_Cryo_0.Dictionary.keys(v40);
        local l_displayName_0 = v40[v41[1]].displayName;
        local v43 = nil;
        if #v41 > 2 then
            v43 = v31.youAddedMoreThanTwoToChat:gsub("{(.-)}", {
                username = l_displayName_0, 
                userCountMinusOne = tostring(#v41 - 1)
            });
        elseif #v41 == 2 then
            local l_displayName_1 = v40[v41[2]].displayName;
            v43 = v31.youAddedTwoToChat:gsub("{(.-)}", {
                username1 = l_displayName_0, 
                username2 = l_displayName_1
            });
        else
            v43 = v31.youAddedToChat:gsub("{(.-)}", {
                username = l_displayName_0
            });
        end;
        v6.SetUIBloxToast({
            iconImage = l_Images_0["icons/actions/friends/friendAdd"], 
            toastTitle = v43
        });
    end, {
        v31.youAddedMoreThanTwoToChat, 
        v31.youAddedToChat, 
        v31.youAddedTwoToChat
    });
    local v48 = l_React_0.useCallback(function(v46) --[[ Line: 93 ]]
        -- upvalues: l_Cryo_0 (ref), v34 (copy), v3 (ref), v27 (copy), l_EventNames_0 (ref)
        local v47 = l_Cryo_0.Dictionary.union({
            parentChannelId = v34, 
            source = v3.SourceSquadInvitePage
        }, v46);
        v27.fireSquadAnalytics(l_EventNames_0.SquadInvite, v47);
    end, l_dependencyArray_0(v34, v27.fireSquadAnalytics));
    local v63 = l_React_0.useCallback(function(v49) --[[ Line: 103 ]]
        -- upvalues: v33 (copy), v35 (copy), l_Cryo_0 (ref), v36 (copy), v27 (copy), v29 (copy), v7 (ref), v5 (ref), v28 (copy), v4 (ref), v48 (copy), v45 (copy), l_Constants_0 (ref), v39 (copy), v30 (copy), l_SquadPromptType_0 (ref)
        if not v33 or not v35 then
            return;
        else
            local v50 = l_Cryo_0.Dictionary.keys(v49);
            local v51 = l_Cryo_0.List.toSet(v35.participants);
            local v53 = l_Cryo_0.List.filter(v50, function(v52) --[[ Line: 114 ]]
                -- upvalues: v51 (copy)
                return v51[v52] == nil;
            end);
            local function v62() --[[ Line: 118 ]]
                -- upvalues: l_Cryo_0 (ref), v35 (ref), v50 (copy), v36 (ref), v27 (ref), v29 (ref), v7 (ref), v53 (copy), v5 (ref), v28 (ref), v4 (ref), v33 (ref), v48 (ref), v45 (ref), v49 (copy)
                local v56 = l_Cryo_0.List.filter(v35.participants, function(v54) --[[ Line: 121 ]]
                    -- upvalues: l_Cryo_0 (ref), v50 (ref), v36 (ref)
                    local v55 = false;
                    if l_Cryo_0.List.find(v50, (tostring(v54))) == nil then
                        v55 = v54 ~= v36;
                    end;
                    return v55;
                end);
                local v57 = {};
                if #v56 > 0 then
                    for _, v59 in ipairs(v56) do
                        table.insert(v57, v27.removeUserFromParentChannel(v29, v35.id, v59));
                    end;
                end;
                v7.all(v57):andThen(function() --[[ Line: 138 ]]
                    -- upvalues: v53 (ref), v29 (ref), v5 (ref), v56 (copy), v28 (ref), v35 (ref), v4 (ref), v33 (ref), v36 (ref), v48 (ref), v45 (ref), v49 (ref), v27 (ref)
                    if #v53 > 0 then
                        v29(v5({
                            dispatch = v29, 
                            onErrorCallback = function() --[[ Line: 142 ]] --[[ Name: onErrorCallback ]]
                                -- upvalues: v56 (ref), v28 (ref)
                                if #v56 > 0 then
                                    v28.pop();
                                end;
                            end, 
                            onSuccessCallback = function(v60) --[[ Line: 147 ]] --[[ Name: onSuccessCallback ]]
                                -- upvalues: v35 (ref), v29 (ref), v4 (ref), v33 (ref), v36 (ref), v53 (ref), v48 (ref), v45 (ref), v49 (ref), v28 (ref)
                                local v61 = v60 ~= v35.id;
                                v29(v4(v33.squadId, v60, v36, v53, v48, v61));
                                v45(v49);
                                v28.pop();
                            end, 
                            parentChannel = v35, 
                            userIds = v53, 
                            squadExternalContext = v27
                        }));
                        return;
                    else
                        v28.pop();
                        return;
                    end;
                end);
            end;
            if v35.type == l_Constants_0.CONVERSATION_CHANNEL_GROUP_TYPE and v39 and #v53 > 0 then
                v27.setSquadPrompt(v30, {
                    hideCancelButton = false, 
                    promptType = l_SquadPromptType_0.ConfirmInviteToSquad, 
                    onConfirm = function() --[[ Line: 180 ]] --[[ Name: onConfirm ]]
                        -- upvalues: v62 (copy)
                        v62();
                    end
                });
                return;
            else
                v62();
                return;
            end;
        end;
    end, l_dependencyArray_0(v33, v29, v28, v35, v48, v45, v27.setSquadPrompt, v27.inviteToParentChannel, v30));
    return l_React_0.createElement(v25, {
        participants = v26.participants, 
        onMultiInvite = v63, 
        buttonText = v31.addText, 
        analyticsInfo = {
            selectionPageType = "SquadInvite"
        }, 
        partyStartedRef = v32, 
        onRemoveCallback = v35 and function(v64, v65) --[[ Line: 210 ]]
            -- upvalues: l_Cryo_0 (ref), v35 (copy), v27 (copy), v30 (copy), v31 (copy), l_SquadPromptType_0 (ref)
            if l_Cryo_0.List.find(v35.participants, v64) then
                v27.setSquadPrompt(v30, {
                    bodyTextLocalizationProps = {
                        displayName = v65 or v31.user
                    }, 
                    hideCancelButton = true, 
                    promptType = l_SquadPromptType_0.RemoveFromParty
                });
            end;
        end or nil, 
        preselectedUsers = v35 and v35.participants and l_Cryo_0.List.filter(v35.participants, function(v66) --[[ Line: 225 ]]
            -- upvalues: v36 (copy)
            return v66 ~= v36;
        end), 
        preselectedUsersUnremovable = if v35 then v35.type == l_Constants_0.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE or v35.initiator ~= tostring(v36) else nil, 
        onSelectedFriendsChanged = if l_FFlagEnableAppChatFocusableFixes_0 then v26.onSelectedFriendsChanged else nil, 
        shouldHideFooterButton = if l_FFlagEnableAppChatFocusableFixes_0 then v26.shouldHideFooterButton else nil
    });
end;