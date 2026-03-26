local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Component_0 = require(l_Parent_0.PlayerContextualMenu).Component;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.SharedFlags);
local v5 = require(l_Parent_0.SocialCommon);
local v6 = require(l_Parent_0.UIBlox);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v10 = require(l_Parent_0.Responsive);
local l_memo_0 = v3.memo;
local l_convertUserPresenceTypeToString_0 = v5.Utils.convertUserPresenceTypeToString;
local l_Images_0 = v6.App.ImageSet.Images;
local l_Interactable_0 = v6.Core.Control.Interactable;
local l_useEffect_0 = v3.useEffect;
local v16 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local v17 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v18 = require(l_script_FirstAncestor_0.Http.NetworkingFriends);
local _ = require(l_script_FirstAncestor_0.types);
local v20 = game:DefineFastFlag("AppChatDisablePCMExperienceCTAs", false);
local v21 = game:DefineFastFlag("AppChatDisablePCMExperienceCTAsInExp", false);
local v22 = game:DefineFastFlag("UseBreakpointForPCM", false);
local l_FFlagEnableAppChatFocusableFixes_0 = v4.FFlagEnableAppChatFocusableFixes;
local l_FFlagSkipBlockModal_0 = v4.FFlagSkipBlockModal;
local l_FFlagRemoveDependencyArrayAntipattern_0 = v4.FFlagRemoveDependencyArrayAntipattern;
PlayerContextualMenuWrapper = function(v26) --[[ Line: 47 ]] --[[ Name: PlayerContextualMenuWrapper ]]
    -- upvalues: l_useDispatch_0 (copy), v10 (copy), l_useSelector_0 (copy), l_useEffect_0 (copy), v18 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v16 (copy), v20 (copy), v21 (copy), v3 (copy), l_Interactable_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_Component_0 (copy), l_convertUserPresenceTypeToString_0 (copy), v17 (copy), l_FFlagSkipBlockModal_0 (copy), l_Images_0 (copy), v22 (copy)
    local v27 = l_useDispatch_0();
    local v28 = v10.useBreakpointXOrSmaller(v10.Keys.Small);
    local v30 = l_useSelector_0(function(v29) --[[ Line: 51 ]]
        return v29.ChatAppReducer.Presence.byUserId;
    end)[v26.participantId];
    local v32 = l_useSelector_0(function(v31) --[[ Line: 56 ]]
        return v31.ChatAppReducer.Friends.friendshipStatus;
    end)[v26.participantId];
    l_useEffect_0(function() --[[ Line: 62 ]]
        -- upvalues: v27 (copy), v18 (ref), v26 (copy)
        v27(v18.GetExtendedFriendshipStatus.API({
            targetUserId = v26.participantId
        }));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v26.participantId
    } else l_dependencyArray_0(v26.participantId));
    local v33 = v16();
    local v34 = not v20 and (not v21 or not v33 or false);
    return v3.createElement(l_Interactable_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        onStateChanged = function() --[[ Line: 79 ]] --[[ Name: onStateChanged ]]

        end, 
        Selectable = not l_FFlagEnableAppChatFocusableFixes_0 and nil, 
        [v3.Event.Activated] = v26.onDismiss
    }, {
        PCM = v3.createElement(l_Component_0, {
            enableExperienceCTAs = v34, 
            subjectPresence = if v30 then {
                locationString = v30.lastLocation, 
                locationPlaceId = v30.placeId, 
                locationRootPlaceId = v30.rootPlaceId, 
                locationUniverseId = v30.universeId, 
                status = l_convertUserPresenceTypeToString_0(v30.userPresenceType)
            } else nil, 
            subjectUserId = v26.participantId, 
            robloxFriendshipStatus = v32, 
            closeCentralOverlayThunk = function() --[[ Line: 96 ]] --[[ Name: closeCentralOverlayThunk ]]

            end, 
            onReportActivated = v26.openReportUser and function() --[[ Line: 97 ]]
                -- upvalues: v17 (ref), v26 (copy)
                v17:info("User activated reportUser | userId: {}, conversationId: {}", v26.participantId, v26.conversationId);
                v26.openReportUser(v26.participantId, v26.conversationId);
            end, 
            onBlockActivated = v26.openBlockingModal and function() --[[ Line: 106 ]]
                -- upvalues: v26 (copy)
                v26.openBlockingModal(v26.participantId, v26.conversationId);
            end, 
            skipBlockModal = l_FFlagSkipBlockModal_0, 
            additionalButtons = if v26.showRemoveUserButton then {
                {
                    icon = l_Images_0["icons/actions/leave"], 
                    text = v26.removeFromGroupText, 
                    onActivated = function() --[[ Line: 117 ]] --[[ Name: onActivated ]]
                        -- upvalues: v26 (copy)
                        v26.openRemoveUserDialog(v26.participantId, v26.conversationId);
                    end
                }
            } else nil, 
            width = if v22 then UDim.new(0, v28 and 300 or 400) else nil
        })
    });
end;
return l_memo_0(PlayerContextualMenuWrapper);