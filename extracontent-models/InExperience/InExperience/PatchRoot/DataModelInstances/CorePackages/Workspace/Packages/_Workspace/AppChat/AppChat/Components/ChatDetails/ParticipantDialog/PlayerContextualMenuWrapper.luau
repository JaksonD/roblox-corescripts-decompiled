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
PlayerContextualMenuWrapper = function(v25) --[[ Line: 45 ]] --[[ Name: PlayerContextualMenuWrapper ]]
    -- upvalues: l_useDispatch_0 (copy), v10 (copy), l_useSelector_0 (copy), l_useEffect_0 (copy), v18 (copy), l_dependencyArray_0 (copy), v16 (copy), v20 (copy), v21 (copy), v3 (copy), l_Interactable_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_Component_0 (copy), l_convertUserPresenceTypeToString_0 (copy), v17 (copy), l_FFlagSkipBlockModal_0 (copy), l_Images_0 (copy), v22 (copy)
    local v26 = l_useDispatch_0();
    local v27 = v10.useBreakpointXOrSmaller(v10.Keys.Small);
    local v29 = l_useSelector_0(function(v28) --[[ Line: 49 ]]
        return v28.ChatAppReducer.Presence.byUserId;
    end)[v25.participantId];
    local v31 = l_useSelector_0(function(v30) --[[ Line: 54 ]]
        return v30.ChatAppReducer.Friends.friendshipStatus;
    end)[v25.participantId];
    l_useEffect_0(function() --[[ Line: 59 ]]
        -- upvalues: v26 (copy), v18 (ref), v25 (copy)
        v26(v18.GetExtendedFriendshipStatus.API({
            targetUserId = v25.participantId
        }));
    end, l_dependencyArray_0(v25.participantId));
    local v32 = v16();
    local v33 = not v20 and (not v21 or not v32 or false);
    return v3.createElement(l_Interactable_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        onStateChanged = function() --[[ Line: 74 ]] --[[ Name: onStateChanged ]]

        end, 
        Selectable = not l_FFlagEnableAppChatFocusableFixes_0 and nil, 
        [v3.Event.Activated] = v25.onDismiss
    }, {
        PCM = v3.createElement(l_Component_0, {
            enableExperienceCTAs = v33, 
            subjectPresence = if v29 then {
                locationString = v29.lastLocation, 
                locationPlaceId = v29.placeId, 
                locationRootPlaceId = v29.rootPlaceId, 
                locationUniverseId = v29.universeId, 
                status = l_convertUserPresenceTypeToString_0(v29.userPresenceType)
            } else nil, 
            subjectUserId = v25.participantId, 
            robloxFriendshipStatus = v31, 
            closeCentralOverlayThunk = function() --[[ Line: 91 ]] --[[ Name: closeCentralOverlayThunk ]]

            end, 
            onReportActivated = v25.openReportUser and function() --[[ Line: 92 ]]
                -- upvalues: v17 (ref), v25 (copy)
                v17:info("User activated reportUser | userId: {}, conversationId: {}", v25.participantId, v25.conversationId);
                v25.openReportUser(v25.participantId, v25.conversationId);
            end, 
            onBlockActivated = v25.openBlockingModal and function() --[[ Line: 101 ]]
                -- upvalues: v25 (copy)
                v25.openBlockingModal(v25.participantId, v25.conversationId);
            end, 
            skipBlockModal = l_FFlagSkipBlockModal_0, 
            additionalButtons = if v25.showRemoveUserButton then {
                {
                    icon = l_Images_0["icons/actions/leave"], 
                    text = v25.removeFromGroupText, 
                    onActivated = function() --[[ Line: 112 ]] --[[ Name: onActivated ]]
                        -- upvalues: v25 (copy)
                        v25.openRemoveUserDialog(v25.participantId, v25.conversationId);
                    end
                }
            } else nil, 
            width = if v22 then UDim.new(0, v27 and 300 or 400) else nil
        })
    });
end;
return l_memo_0(PlayerContextualMenuWrapper);