local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RealtimeDelivery);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_LoginStatus_0 = require(l_Parent_0.RobloxAppEnums).LoginStatus;
local v7 = require(l_script_FirstAncestor_0.Conversations.Thunks.fetchChatMetadata);
local v8 = require(l_script_FirstAncestor_0.Hooks.useIsAppLoaded);
local v9 = require(l_script_FirstAncestor_0.App.Hooks.useKeybind);
local l_usePrevious_0 = require(l_Parent_0.RoactUtils).Hooks.usePrevious;
local v11 = require(l_script_FirstAncestor_0.Hooks.useIsChatEnabled);
local v12 = require(l_script_FirstAncestor_0.Conversations.Thunks.reloadAllMessages);
local v13 = require(l_script_FirstAncestor_0.Utils.getDeepValue2);
local v14 = require(l_Parent_0.AppChatNetworking);
local v15 = require(l_script_FirstAncestor_0.Conversations.Actions.DismissedAllConversationModalsForSequence);
local v16 = require(l_script_FirstAncestor_0.App.Hooks.useIsAppChatVisible);
local v17 = require(l_script_FirstAncestor_0.Flags.getFFlagDebugAppChat);
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatHandleAgeChange);
local l_FFlagEnableAEGIS2AppChatBanner_0 = require(l_Parent_0.SharedFlags).FFlagEnableAEGIS2AppChatBanner;
local l_FFlagEnableAEGIS2AppChatConversationBanner_0 = require(l_Parent_0.SharedFlags).FFlagEnableAEGIS2AppChatConversationBanner;
local l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0 = require(l_Parent_0.SharedFlags).FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace;
local v22 = game:DefineFastFlag("AppChatEnableAgeVerifiedRTNInAccountSettingsReceiver", false);
local v23 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
return function(v24) --[[ Line: 39 ]] --[[ Name: AppChatAccountSettingsEventReceiver ]]
    -- upvalues: l_useDispatch_0 (copy), v8 (copy), l_useSelector_0 (copy), l_LoginStatus_0 (copy), v17 (copy), v9 (copy), v23 (copy), v2 (copy), v7 (copy), v18 (copy), v11 (copy), v13 (copy), l_usePrevious_0 (copy), v12 (copy), v3 (copy), v22 (copy), l_FFlagEnableAEGIS2AppChatBanner_0 (copy), l_FFlagEnableAEGIS2AppChatConversationBanner_0 (copy), v16 (copy), v14 (copy), v15 (copy), l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0 (copy)
    local v25 = l_useDispatch_0();
    local v26 = v8();
    local v28 = l_useSelector_0(function(v27) --[[ Line: 42 ]]
        -- upvalues: l_LoginStatus_0 (ref)
        return v27.AuthenticationStatus and v27.AuthenticationStatus.status == l_LoginStatus_0.LOGGED_IN;
    end);
    if v17() then
        v9({
            keyCode = Enum.KeyCode.G, 
            modifierKey = Enum.ModifierKey.Ctrl
        }, function() --[[ Line: 47 ]]
            -- upvalues: v23 (ref), v25 (copy)
            v23:debug("Ctrl + G pressed, toggling group chat enabled");
            v25({
                type = "Debug_GroupChatEnabledToggled"
            });
        end, {
            v25
        });
    end;
    local v30 = v2.useCallback(function() --[[ Line: 55 ]]
        -- upvalues: v25 (copy), v7 (ref), v23 (ref)
        v25(v7()):andThen(function(v29) --[[ Line: 56 ]]
            -- upvalues: v23 (ref)
            v23:info("Finished fetching chat metadata. Determined isChatEnabled as {}", v29);
        end);
    end, {
        v25
    });
    v2.useEffect(function() --[[ Line: 61 ]]
        -- upvalues: v24 (copy), v28 (copy), v26 (copy), v23 (ref), v30 (copy)
        if (not not v24.isInExperience or v28) and not v26 then
            v23:info("App is not loaded, fetching chat metadata");
            v30();
        end;
    end, {
        v30, 
        v26, 
        v24.isInExperience, 
        v28
    });
    if v18 then
        local v31 = v11();
        local v33 = l_useSelector_0(function(v32) --[[ Line: 71 ]]
            -- upvalues: v13 (ref)
            return v13(v32, "ChatAppReducer.ChatSettings.chatUserMessagesEnabled");
        end);
        local v34 = l_usePrevious_0(v33);
        local l_v31_0 = v31 --[[ copy: 5 -> 8 ]];
        local l_v33_0 = v33 --[[ copy: 6 -> 9 ]];
        v2.useEffect(function() --[[ Line: 76 ]]
            -- upvalues: l_v31_0 (copy), v34 (copy), l_v33_0 (copy), v23 (ref), v25 (copy), v12 (ref)
            if l_v31_0 and v34 ~= nil and v34 ~= l_v33_0 then
                v23:info("Chat messages eligibility changed, reloading all messages");
                v25(v12()):catch(function(v37) --[[ Line: 83 ]]
                    -- upvalues: v23 (ref)
                    v23:warn("Failed to reload all messages after chat user messages eligibility change", v37);
                end);
            end;
        end, {
            v25, 
            v31, 
            v34, 
            v33
        });
    end;
    v3.useRealtimeNamespace("UserSettingsChanged", function(v38) --[[ Line: 90 ]]
        -- upvalues: v23 (ref), v30 (copy)
        if v38.SettingsChanged and (table.find(v38.SettingsChanged, "WhoCanChatWithMeInApp") or table.find(v38.SettingsChanged, "WhoCanGroupChatWithMeInApp") or table.find(v38.SettingsChanged, "WhoCanOneOnOnePartyWithMe") or table.find(v38.SettingsChanged, "WhoCanGroupPartyWithMe")) then
            v23:info("Received privacy setting notification, fetching chat metadata");
            v30();
        end;
    end, {
        v30
    });
    v3.useRealtimeConnectionStateChanged("UserSettingsChanged", function(v39, v40) --[[ Line: 103 ]]
        -- upvalues: v23 (ref), v30 (copy)
        if v39 == Enum.ConnectionState.Connected and v40 then
            v23:info("Reconnected to UserSettingsChanged, fetching chat metadata");
            v30();
        end;
    end, {
        v30
    });
    if v22 and (l_FFlagEnableAEGIS2AppChatBanner_0 or l_FFlagEnableAEGIS2AppChatConversationBanner_0) then
        local v41 = v16();
        local function v44(v42) --[[ Line: 116 ]]
            -- upvalues: l_FFlagEnableAEGIS2AppChatBanner_0 (ref), v25 (copy), v14 (ref), v23 (ref), l_FFlagEnableAEGIS2AppChatConversationBanner_0 (ref), v15 (ref)
            if l_FFlagEnableAEGIS2AppChatBanner_0 then
                v25(v14.rodux.GetChatLandingModal.API(v42)):catch(function(v43) --[[ Line: 118 ]]
                    -- upvalues: v23 (ref)
                    v23:warning("Error in GetChatLandingModal request. Error: {}", (tostring(v43)));
                end);
            end;
            if l_FFlagEnableAEGIS2AppChatConversationBanner_0 then
                v25(v15(v14.Constants.ModalSequence.ConversationBottomModal));
            end;
        end;
        v3.useRealtimeNamespace(l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0, function(_) --[[ Line: 133 ]]
            -- upvalues: v23 (ref), l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0 (ref), v26 (copy), v44 (copy), v24 (copy), v30 (copy)
            v23:info("Received Realtime: {}", l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0);
            if not v26 then
                return;
            else
                v44(v24.isInExperience);
                v30();
                return;
            end;
        end, {
            v30, 
            v26, 
            v24.isInExperience, 
            v41
        });
        v3.useRealtimeConnectionStateChanged(l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0, function(v46, v47) --[[ Line: 145 ]]
            -- upvalues: v23 (ref), l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0 (ref), v26 (copy), v44 (copy), v24 (copy), v30 (copy)
            v23:info("Reconnected to Realtime: {}, hasMissedEvents: {}", l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0, (tostring(v47)));
            if v46 ~= Enum.ConnectionState.Connected or not v47 or not v26 then
                return;
            else
                v44(v24.isInExperience);
                v30();
                return;
            end;
        end, {
            v30, 
            v26, 
            v24.isInExperience, 
            v41
        });
    end;
    return nil;
end;