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
local v23 = game:DefineFastFlag("AppChatEnableNewChatSettings1", false);
local v24 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
return function(v25) --[[ Line: 40 ]] --[[ Name: AppChatAccountSettingsEventReceiver ]]
    -- upvalues: l_useDispatch_0 (copy), v8 (copy), l_useSelector_0 (copy), l_LoginStatus_0 (copy), v17 (copy), v9 (copy), v24 (copy), v2 (copy), v7 (copy), v18 (copy), v11 (copy), v13 (copy), l_usePrevious_0 (copy), v12 (copy), v3 (copy), v23 (copy), v22 (copy), l_FFlagEnableAEGIS2AppChatBanner_0 (copy), l_FFlagEnableAEGIS2AppChatConversationBanner_0 (copy), v16 (copy), v14 (copy), v15 (copy), l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0 (copy)
    local v26 = l_useDispatch_0();
    local v27 = v8();
    local v29 = l_useSelector_0(function(v28) --[[ Line: 43 ]]
        -- upvalues: l_LoginStatus_0 (ref)
        return v28.AuthenticationStatus and v28.AuthenticationStatus.status == l_LoginStatus_0.LOGGED_IN;
    end);
    if v17() then
        v9({
            keyCode = Enum.KeyCode.G, 
            modifierKey = Enum.ModifierKey.Ctrl
        }, function() --[[ Line: 48 ]]
            -- upvalues: v24 (ref), v26 (copy)
            v24:debug("Ctrl + G pressed, toggling group chat enabled");
            v26({
                type = "Debug_GroupChatEnabledToggled"
            });
        end, {
            v26
        });
    end;
    local v31 = v2.useCallback(function() --[[ Line: 56 ]]
        -- upvalues: v26 (copy), v7 (ref), v24 (ref)
        v26(v7()):andThen(function(v30) --[[ Line: 57 ]]
            -- upvalues: v24 (ref)
            v24:info("Finished fetching chat metadata. Determined isChatEnabled as {}", v30);
        end);
    end, {
        v26
    });
    v2.useEffect(function() --[[ Line: 62 ]]
        -- upvalues: v25 (copy), v29 (copy), v27 (copy), v24 (ref), v31 (copy)
        if (not not v25.isInExperience or v29) and not v27 then
            v24:info("App is not loaded, fetching chat metadata");
            v31();
        end;
    end, {
        v31, 
        v27, 
        v25.isInExperience, 
        v29
    });
    if v18 then
        local v32 = v11();
        local v34 = l_useSelector_0(function(v33) --[[ Line: 72 ]]
            -- upvalues: v13 (ref)
            return v13(v33, "ChatAppReducer.ChatSettings.chatUserMessagesEnabled");
        end);
        local v35 = l_usePrevious_0(v34);
        local l_v32_0 = v32 --[[ copy: 5 -> 8 ]];
        local l_v34_0 = v34 --[[ copy: 6 -> 9 ]];
        v2.useEffect(function() --[[ Line: 77 ]]
            -- upvalues: l_v32_0 (copy), v35 (copy), l_v34_0 (copy), v24 (ref), v26 (copy), v12 (ref)
            if l_v32_0 and v35 ~= nil and v35 ~= l_v34_0 then
                v24:info("Chat messages eligibility changed, reloading all messages");
                v26(v12()):catch(function(v38) --[[ Line: 84 ]]
                    -- upvalues: v24 (ref)
                    v24:warn("Failed to reload all messages after chat user messages eligibility change", v38);
                end);
            end;
        end, {
            v26, 
            v32, 
            v35, 
            v34
        });
    end;
    v3.useRealtimeNamespace("UserSettingsChanged", function(v39) --[[ Line: 91 ]]
        -- upvalues: v23 (ref), v24 (ref), v31 (copy)
        if v39.SettingsChanged and (table.find(v39.SettingsChanged, "WhoCanChatWithMeInApp") or table.find(v39.SettingsChanged, "WhoCanGroupChatWithMeInApp") or table.find(v39.SettingsChanged, "WhoCanOneOnOnePartyWithMe") or table.find(v39.SettingsChanged, "WhoCanGroupPartyWithMe") or v23 and (table.find(v39.SettingsChanged, "WhoCanPartyWithMe") or table.find(v39.SettingsChanged, "WhoCanUsePartyChatWithMe") or table.find(v39.SettingsChanged, "WhoCanUsePartyVoiceWithMe"))) then
            v24:info("Received privacy setting notification, fetching chat metadata");
            v31();
        end;
    end, {
        v31
    });
    if v23 then
        v3.useRealtimeNamespace("UserSettingsChanged", function(v40) --[[ Line: 110 ]]
            -- upvalues: v24 (ref), v26 (copy), v12 (ref)
            if v40.SettingsChanged and table.find(v40.SettingsChanged, "WhoCanUsePartyChatWithMe") then
                v24:info("Received privacy setting notification, fetching chat metadata");
                v26(v12()):catch(function(v41) --[[ Line: 115 ]]
                    -- upvalues: v24 (ref)
                    v24:warn("Failed to reload all messages after party setting change", v41);
                end);
            end;
        end, {
            v26
        });
    end;
    v3.useRealtimeConnectionStateChanged("UserSettingsChanged", function(v42, v43) --[[ Line: 123 ]]
        -- upvalues: v24 (ref), v31 (copy)
        if v42 == Enum.ConnectionState.Connected and v43 then
            v24:info("Reconnected to UserSettingsChanged, fetching chat metadata");
            v31();
        end;
    end, {
        v31
    });
    if v22 and (l_FFlagEnableAEGIS2AppChatBanner_0 or l_FFlagEnableAEGIS2AppChatConversationBanner_0) then
        local v44 = v16();
        local function v47(v45) --[[ Line: 136 ]]
            -- upvalues: l_FFlagEnableAEGIS2AppChatBanner_0 (ref), v26 (copy), v14 (ref), v24 (ref), l_FFlagEnableAEGIS2AppChatConversationBanner_0 (ref), v15 (ref)
            if l_FFlagEnableAEGIS2AppChatBanner_0 then
                v26(v14.rodux.GetChatLandingModal.API(v45)):catch(function(v46) --[[ Line: 138 ]]
                    -- upvalues: v24 (ref)
                    v24:warning("Error in GetChatLandingModal request. Error: {}", (tostring(v46)));
                end);
            end;
            if l_FFlagEnableAEGIS2AppChatConversationBanner_0 then
                v26(v15(v14.Constants.ModalSequence.ConversationBottomModal));
            end;
        end;
        v3.useRealtimeNamespace(l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0, function(_) --[[ Line: 153 ]]
            -- upvalues: v24 (ref), l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0 (ref), v27 (copy), v47 (copy), v25 (copy), v31 (copy)
            v24:info("Received Realtime: {}", l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0);
            if not v27 then
                return;
            else
                v47(v25.isInExperience);
                v31();
                return;
            end;
        end, {
            v31, 
            v27, 
            v25.isInExperience, 
            v44
        });
        v3.useRealtimeConnectionStateChanged(l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0, function(v49, v50) --[[ Line: 165 ]]
            -- upvalues: v24 (ref), l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0 (ref), v27 (copy), v47 (copy), v25 (copy), v31 (copy)
            v24:info("Reconnected to Realtime: {}, hasMissedEvents: {}", l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0, (tostring(v50)));
            if v49 ~= Enum.ConnectionState.Connected or not v50 or not v27 then
                return;
            else
                v47(v25.isInExperience);
                v31();
                return;
            end;
        end, {
            v31, 
            v27, 
            v25.isInExperience, 
            v44
        });
    end;
    return nil;
end;