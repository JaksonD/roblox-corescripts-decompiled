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
local l_FFlagRemoveDependencyArrayAntipattern_0 = v2.SharedFlags.FFlagRemoveDependencyArrayAntipattern;
return function(v27) --[[ Line: 37 ]] --[[ Name: SquadInviteFriendsContainer ]]
    -- upvalues: l_React_0 (copy), l_SquadExternalContractContext_0 (copy), l_useNavigation_0 (copy), l_useDispatch_0 (copy), l_useStore_0 (copy), l_useLocalization_0 (copy), l_useCurrentSquadSelector_0 (copy), l_useLocalUserId_0 (copy), l_useAppPolicy_0 (copy), l_Cryo_0 (copy), v6 (copy), l_Images_0 (copy), v3 (copy), l_EventNames_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v7 (copy), v5 (copy), v4 (copy), l_Constants_0 (copy), l_SquadPromptType_0 (copy), v25 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy)
    local v28 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v29 = l_useNavigation_0();
    local v30 = l_useDispatch_0();
    local v31 = l_useStore_0();
    local v32 = l_useLocalization_0({
        addText = "Feature.Squads.Action.Add", 
        user = "Feature.Squads.Description.User", 
        youAddedMoreThanTwoToChat = "Feature.Squads.Description.YouAddedMoreThanTwoToChat", 
        youAddedToChat = "Feature.Squads.Description.YouAddedToChat", 
        youAddedTwoToChat = "Feature.Squads.Description.YouAddedTwoToChat"
    });
    local v33 = l_React_0.useRef(false);
    local v34 = l_useCurrentSquadSelector_0();
    local v35 = if v34 and v34.parentChannelId then v34.parentChannelId else "";
    local v36 = v28.useGetConversationFromId(v35);
    local v37 = l_useLocalUserId_0();
    local v39 = l_React_0.useCallback(function(v38) --[[ Line: 61 ]]
        return v38.getCanUsePlatformChat();
    end, {});
    local v40 = l_useAppPolicy_0(v39);
    local v46 = l_React_0.useCallback(function(v41) --[[ Line: 69 ]]
        -- upvalues: l_Cryo_0 (ref), v32 (copy), v6 (ref), l_Images_0 (ref)
        local v42 = l_Cryo_0.Dictionary.keys(v41);
        local l_displayName_0 = v41[v42[1]].displayName;
        local v44 = nil;
        if #v42 > 2 then
            v44 = v32.youAddedMoreThanTwoToChat:gsub("{(.-)}", {
                username = l_displayName_0, 
                userCountMinusOne = tostring(#v42 - 1)
            });
        elseif #v42 == 2 then
            local l_displayName_1 = v41[v42[2]].displayName;
            v44 = v32.youAddedTwoToChat:gsub("{(.-)}", {
                username1 = l_displayName_0, 
                username2 = l_displayName_1
            });
        else
            v44 = v32.youAddedToChat:gsub("{(.-)}", {
                username = l_displayName_0
            });
        end;
        v6.SetUIBloxToast({
            iconImage = l_Images_0["icons/actions/friends/friendAdd"], 
            toastTitle = v44
        });
    end, {
        v32.youAddedMoreThanTwoToChat, 
        v32.youAddedToChat, 
        v32.youAddedTwoToChat
    });
    local v49 = l_React_0.useCallback(function(v47) --[[ Line: 97 ]]
        -- upvalues: l_Cryo_0 (ref), v35 (copy), v3 (ref), v28 (copy), l_EventNames_0 (ref)
        local v48 = l_Cryo_0.Dictionary.union({
            parentChannelId = v35, 
            source = v3.SourceSquadInvitePage
        }, v47);
        v28.fireSquadAnalytics(l_EventNames_0.SquadInvite, v48);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v35, 
        v28.fireSquadAnalytics
    } else l_dependencyArray_0(v35, v28.fireSquadAnalytics));
    local v64 = l_React_0.useCallback(function(v50) --[[ Line: 111 ]]
        -- upvalues: v34 (copy), v36 (copy), l_Cryo_0 (ref), v37 (copy), v28 (copy), v30 (copy), v7 (ref), v5 (ref), v29 (copy), v4 (ref), v49 (copy), v46 (copy), l_Constants_0 (ref), v40 (copy), v31 (copy), l_SquadPromptType_0 (ref)
        if not v34 or not v36 then
            return;
        else
            local v51 = l_Cryo_0.Dictionary.keys(v50);
            local v52 = l_Cryo_0.List.toSet(v36.participants);
            local v54 = l_Cryo_0.List.filter(v51, function(v53) --[[ Line: 122 ]]
                -- upvalues: v52 (copy)
                return v52[v53] == nil;
            end);
            local function v63() --[[ Line: 126 ]]
                -- upvalues: l_Cryo_0 (ref), v36 (ref), v51 (copy), v37 (ref), v28 (ref), v30 (ref), v7 (ref), v54 (copy), v5 (ref), v29 (ref), v4 (ref), v34 (ref), v49 (ref), v46 (ref), v50 (copy)
                local v57 = l_Cryo_0.List.filter(v36.participants, function(v55) --[[ Line: 129 ]]
                    -- upvalues: l_Cryo_0 (ref), v51 (ref), v37 (ref)
                    local v56 = false;
                    if l_Cryo_0.List.find(v51, (tostring(v55))) == nil then
                        v56 = v55 ~= v37;
                    end;
                    return v56;
                end);
                local v58 = {};
                if #v57 > 0 then
                    for _, v60 in ipairs(v57) do
                        table.insert(v58, v28.removeUserFromParentChannel(v30, v36.id, v60));
                    end;
                end;
                v7.all(v58):andThen(function() --[[ Line: 146 ]]
                    -- upvalues: v54 (ref), v30 (ref), v5 (ref), v57 (copy), v29 (ref), v36 (ref), v4 (ref), v34 (ref), v37 (ref), v49 (ref), v46 (ref), v50 (ref), v28 (ref)
                    if #v54 > 0 then
                        v30(v5({
                            dispatch = v30, 
                            onErrorCallback = function() --[[ Line: 150 ]] --[[ Name: onErrorCallback ]]
                                -- upvalues: v57 (ref), v29 (ref)
                                if #v57 > 0 then
                                    v29.pop();
                                end;
                            end, 
                            onSuccessCallback = function(v61) --[[ Line: 155 ]] --[[ Name: onSuccessCallback ]]
                                -- upvalues: v36 (ref), v30 (ref), v4 (ref), v34 (ref), v37 (ref), v54 (ref), v49 (ref), v46 (ref), v50 (ref), v29 (ref)
                                local v62 = v61 ~= v36.id;
                                v30(v4(v34.squadId, v61, v37, v54, v49, v62));
                                v46(v50);
                                v29.pop();
                            end, 
                            parentChannel = v36, 
                            userIds = v54, 
                            squadExternalContext = v28
                        }));
                        return;
                    else
                        v29.pop();
                        return;
                    end;
                end);
            end;
            if v36.type == l_Constants_0.CONVERSATION_CHANNEL_GROUP_TYPE and v40 and #v54 > 0 then
                v28.setSquadPrompt(v31, {
                    hideCancelButton = false, 
                    promptType = l_SquadPromptType_0.ConfirmInviteToSquad, 
                    onConfirm = function() --[[ Line: 188 ]] --[[ Name: onConfirm ]]
                        -- upvalues: v63 (copy)
                        v63();
                    end
                });
                return;
            else
                v63();
                return;
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v34, 
        v30, 
        v29, 
        v36, 
        v49, 
        v46, 
        v28.setSquadPrompt, 
        v28.inviteToParentChannel, 
        v31
    } else l_dependencyArray_0(v34, v30, v29, v36, v49, v46, v28.setSquadPrompt, v28.inviteToParentChannel, v31));
    return l_React_0.createElement(v25, {
        participants = v27.participants, 
        onMultiInvite = v64, 
        buttonText = v32.addText, 
        analyticsInfo = {
            selectionPageType = "SquadInvite"
        }, 
        partyStartedRef = v33, 
        onRemoveCallback = v36 and function(v65, v66) --[[ Line: 230 ]]
            -- upvalues: l_Cryo_0 (ref), v36 (copy), v28 (copy), v31 (copy), v32 (copy), l_SquadPromptType_0 (ref)
            if l_Cryo_0.List.find(v36.participants, v65) then
                v28.setSquadPrompt(v31, {
                    bodyTextLocalizationProps = {
                        displayName = v66 or v32.user
                    }, 
                    hideCancelButton = true, 
                    promptType = l_SquadPromptType_0.RemoveFromParty
                });
            end;
        end or nil, 
        preselectedUsers = v36 and v36.participants and l_Cryo_0.List.filter(v36.participants, function(v67) --[[ Line: 245 ]]
            -- upvalues: v37 (copy)
            return v67 ~= v37;
        end), 
        preselectedUsersUnremovable = if v36 then v36.type == l_Constants_0.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE or v36.initiator ~= tostring(v37) else nil, 
        onSelectedFriendsChanged = if l_FFlagEnableAppChatFocusableFixes_0 then v27.onSelectedFriendsChanged else nil, 
        shouldHideFooterButton = if l_FFlagEnableAppChatFocusableFixes_0 then v27.shouldHideFooterButton else nil
    });
end;