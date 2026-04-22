local l_script_FirstAncestor_0 = script:FindFirstAncestor("Groups");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.ReactUtils);
local v6 = require(l_Parent_0.UserLib);
local l_getRbxthumbWithTypeSizeAndOptions_0 = v6.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_Constants_0 = v6.Utils.Constants;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useContext_0 = v4.useContext;
local l_useEventConnection_0 = v5.useEventConnection;
local v12 = require(l_Parent_0.ProfilePlatform.Enums);
local v13 = require(l_script_FirstAncestor_0.Common.fetchGroupDetails);
local v14 = require(l_script_FirstAncestor_0.Common.postJoinGroup);
local v15 = require(l_script_FirstAncestor_0.Common.fetchGroupActions);
local v16 = require(l_script_FirstAncestor_0.Components.CoreUI.ServiceOverrideContext);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_THUMBNAIL_SIZE_0 = require(l_script_FirstAncestor_0.Common.constants).THUMBNAIL_SIZE;
local function v28(v19) --[[ Line: 40 ]] --[[ Name: parseMembershipStatusFromActions ]]
    -- upvalues: v12 (copy)
    local v20 = v19.buttons or {};
    local v21 = nil;
    local v22 = nil;
    if #v20 > 0 then
        v21 = v20[1].type;
        v22 = v20[1].disabledReason;
    end;
    local v23 = true;
    if v21 ~= v12.ProfileActions.ViewCommunity then
        v23 = v21 == v12.ProfileActions.ViewFullProfile;
    end;
    local v24 = v21 == v12.ProfileActions.CancelJoinCommunityRequest;
    local v25 = true;
    if v21 ~= v12.ProfileActions.JoinCommunity then
        v25 = v21 == v12.ProfileActions.Follow;
    end;
    local v26 = v23 and not v22;
    local v27 = v25 and not v22;
    return {
        isAlreadyMember = v26, 
        hasPendingRequest = v24, 
        isEligible = v27, 
        disabledReason = v22
    };
end;
local function v34(v29) --[[ Line: 73 ]] --[[ Name: buildGroupJoinPromptData ]]
    -- upvalues: v28 (copy)
    if not v29 then
        return nil;
    else
        local v30 = v29.components or {};
        local v31 = v30.CommunityProfileHeader or {};
        local v32 = v30.Actions or {};
        local v33 = v28(v32);
        return {
            groupName = v31.name, 
            isGroupVerified = v31.isVerified, 
            ownerName = v31.ownerName, 
            ownerIsVerified = v31.ownerIsVerified, 
            ownerUserId = v31.ownerUserId, 
            membersCount = if v31.counts then v31.counts.membersCount else nil, 
            isAlreadyMember = v33.isAlreadyMember, 
            hasPendingRequest = v33.hasPendingRequest, 
            isEligible = v33.isEligible, 
            disabledReason = v33.disabledReason, 
            hasSocialModules = v31.hasSocialModules
        };
    end;
end;
return function(v35) --[[ Line: 99 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useContext_0 (copy), v16 (copy), l_useLocalization_0 (copy), v4 (copy), v14 (copy), v15 (copy), v28 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy), l_THUMBNAIL_SIZE_0 (copy), v13 (copy), v34 (copy), l_useEventConnection_0 (copy)
    local v36 = l_useRoactService_0(l_RoactNetworking_0);
    local v37 = l_useContext_0(v16);
    local l_groupService_0 = v37.groupService;
    local l_guiService_0 = v37.guiService;
    local v40 = l_useLocalization_0({
        notificationJoined = "Feature.Groups.Notification.Joined", 
        notificationFollowing = "Feature.Groups.Notification.Following", 
        notificationJoinRequestPending = "Feature.Groups.Notification.JoinRequestPending", 
        notificationFailedToLoad = "Feature.Groups.Notification.FailedToLoad", 
        notificationFailedToJoin = "Feature.Groups.Notification.FailedToJoin", 
        notificationFailedToFollow = "Feature.Groups.Notification.FailedToFollow", 
        notificationGroupDoesNotExist = "Feature.Groups.Notification.GroupDoesNotExist", 
        notificationGroupModerated = "Feature.Groups.Notification.GroupModerated"
    });
    local v41 = v4.useRef(nil);
    local function _() --[[ Line: 123 ]] --[[ Name: closePrompt ]]
        -- upvalues: v41 (copy), v35 (copy)
        v41.current = nil;
        v35.closePrompt();
    end;
    local v46 = v4.useCallback(function(v43, v44, v45) --[[ Line: 130 ]]
        -- upvalues: l_groupService_0 (copy), l_guiService_0 (copy), v41 (copy), v35 (copy)
        l_groupService_0:PromptJoinCompleted(v43, false, Enum.GroupMembershipStatus.None, v44);
        l_guiService_0:SendNotification({
            Title = v45, 
            Icon = "rbxasset://textures/ui/ErrorIcon.png"
        });
        v41.current = nil;
        v35.closePrompt();
    end, {
        l_groupService_0, 
        l_guiService_0, 
        v35.closePrompt
    });
    local v52 = v4.useCallback(function(v47, v48, v49, v50) --[[ Line: 148 ]]
        -- upvalues: v40 (copy), v46 (copy)
        local v51 = nil;
        v51 = if v50 then v40.notificationFailedToLoad else if v48 then v40.notificationFailedToJoin else v40.notificationFailedToFollow;
        v46(v47, v49, v51);
    end, {
        v46
    });
    local v66 = v4.useCallback(function(v53, v54) --[[ Line: 163 ]]
        -- upvalues: v14 (ref), v36 (copy), v15 (ref), v52 (copy), v28 (ref), v40 (copy), l_groupService_0 (copy), v41 (copy), v35 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), l_Constants_0 (ref), l_THUMBNAIL_SIZE_0 (ref), l_guiService_0 (copy)
        return function() --[[ Line: 164 ]]
            -- upvalues: v54 (copy), v14 (ref), v36 (ref), v53 (copy), v15 (ref), v52 (ref), v28 (ref), v40 (ref), l_groupService_0 (ref), v41 (ref), v35 (ref), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), l_Constants_0 (ref), l_THUMBNAIL_SIZE_0 (ref), l_guiService_0 (ref)
            local v55 = not v54 or not (v54.hasSocialModules ~= nil) or v54.hasSocialModules;
            local v56 = if v54 then v54.groupName or "" else "";
            v14(v36, v53):andThen(function() --[[ Line: 172 ]]
                -- upvalues: v15 (ref), v36 (ref), v53 (ref), v52 (ref), v55 (copy), v28 (ref), v40 (ref), l_groupService_0 (ref), v41 (ref), v35 (ref), v56 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), l_Constants_0 (ref), l_THUMBNAIL_SIZE_0 (ref), l_guiService_0 (ref)
                return v15(v36, v53):andThen(function(v57) --[[ Line: 173 ]]
                    -- upvalues: v52 (ref), v53 (ref), v55 (ref), v28 (ref), v40 (ref), l_groupService_0 (ref), v41 (ref), v35 (ref), v56 (ref), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), l_Constants_0 (ref), l_THUMBNAIL_SIZE_0 (ref), l_guiService_0 (ref)
                    if v57.errors then
                        v52(v53, v55, "Network error on join prompt: Some group components failed to load", false);
                        return;
                    else
                        local v58 = (v57.components or {}).Actions or {};
                        local v59 = v28(v58);
                        local v60 = nil;
                        local v61 = nil;
                        if v59.isAlreadyMember then
                            v60 = Enum.GroupMembershipStatus.Joined;
                            v61 = if v55 then v40.notificationJoined else v40.notificationFollowing;
                        elseif v59.hasPendingRequest then
                            v60 = Enum.GroupMembershipStatus.JoinRequestPending;
                            v61 = v40.notificationJoinRequestPending;
                        else
                            v52(v53, v55, "Unexpected membership status after join prompt", false);
                            return;
                        end;
                        l_groupService_0:PromptJoinCompleted(v53, true, v60, "");
                        v41.current = nil;
                        v35.closePrompt();
                        local v62 = string.gsub(v61, "{groupName}", v56);
                        local v63 = l_getRbxthumbWithTypeSizeAndOptions_0(tostring(v53), l_Constants_0.RbxthumbTypes.GroupIcon, l_THUMBNAIL_SIZE_0);
                        l_guiService_0:SendNotification({
                            Title = v62, 
                            Icon = v63
                        });
                        return;
                    end;
                end, function(v64) --[[ Line: 227 ]]
                    -- upvalues: v52 (ref), v53 (ref), v55 (ref)
                    v52(v53, v55, "Network error on join prompt: " .. v64.StatusMessage, false);
                end);
            end, function(v65) --[[ Line: 235 ]]
                -- upvalues: v52 (ref), v53 (ref), v55 (copy)
                v52(v53, v55, "Network error on join prompt: " .. v65.StatusMessage, false);
            end);
        end;
    end, {
        v36, 
        v52, 
        v40, 
        l_groupService_0, 
        l_guiService_0, 
        v35.closePrompt
    });
    local v70 = v4.useCallback(function(v67, v68) --[[ Line: 247 ]]
        -- upvalues: l_groupService_0 (copy), v41 (copy), v35 (copy)
        return function() --[[ Line: 248 ]]
            -- upvalues: v68 (copy), l_groupService_0 (ref), v67 (copy), v41 (ref), v35 (ref)
            local v69 = v68 and v68.isAlreadyMember and true or false;
            l_groupService_0:PromptJoinCompleted(v67, true, if v69 then Enum.GroupMembershipStatus.AlreadyMember else Enum.GroupMembershipStatus.None, "");
            v41.current = nil;
            v35.closePrompt();
        end;
    end, {
        l_groupService_0, 
        v35.closePrompt
    });
    local v84 = v4.useCallback(function(v71) --[[ Line: 268 ]]
        -- upvalues: v41 (copy), v66 (copy), v70 (copy), v35 (copy), v13 (ref), v36 (copy), v52 (copy), v46 (copy), v40 (copy), v34 (ref)
        local v72 = {};
        v41.current = v72;
        local v73 = {
            onJoin = v66(v71, nil), 
            onClose = v70(v71, nil)
        };
        v35.openGroupJoinPrompt(v71, nil, v73);
        v13(v36, v71):andThen(function(v74) --[[ Line: 284 ]]
            -- upvalues: v41 (ref), v72 (copy), v52 (ref), v71 (copy), v46 (ref), v40 (ref), v34 (ref), v66 (ref), v70 (ref), v35 (ref)
            if v41.current ~= v72 then
                return;
            else
                local v75 = v74.components or {};
                local v76 = next(v75) ~= nil;
                local v77 = v75.CommunityLocked ~= nil;
                local v78 = v74.errors ~= nil;
                local v79 = v75.CommunityProfileHeader or {};
                local v80 = v79.hasSocialModules == nil or v79.hasSocialModules;
                if v78 then
                    if v41.current ~= v72 then
                        return;
                    else
                        v52(v71, v80, "Network error on join prompt: Some group components failed to load", true);
                        return;
                    end;
                elseif not v76 then
                    if v41.current ~= v72 then
                        return;
                    else
                        v46(v71, "Group does not exist", v40.notificationGroupDoesNotExist);
                        return;
                    end;
                elseif v77 then
                    if v41.current ~= v72 then
                        return;
                    else
                        v46(v71, "Group is currently moderated", v40.notificationGroupModerated);
                        return;
                    end;
                elseif v41.current ~= v72 then
                    return;
                else
                    local v81 = v34(v74);
                    local v82 = {
                        onJoin = v66(v71, v81), 
                        onClose = v70(v71, v81)
                    };
                    v35.openGroupJoinPrompt(v71, v81, v82);
                    return;
                end;
            end;
        end, function(v83) --[[ Line: 334 ]]
            -- upvalues: v41 (ref), v72 (copy), v46 (ref), v71 (copy), v40 (ref)
            if v41.current ~= v72 then
                return;
            else
                v46(v71, "Network error on join prompt: " .. v83.StatusMessage, v40.notificationFailedToLoad);
                return;
            end;
        end);
    end, {
        v35.openGroupJoinPrompt, 
        v36, 
        v40, 
        v66, 
        v70, 
        v46, 
        v52
    });
    l_useEventConnection_0(l_groupService_0.ShowJoinPrompt, v84);
    return v4.createElement(v4.Fragment, {}, {});
end;