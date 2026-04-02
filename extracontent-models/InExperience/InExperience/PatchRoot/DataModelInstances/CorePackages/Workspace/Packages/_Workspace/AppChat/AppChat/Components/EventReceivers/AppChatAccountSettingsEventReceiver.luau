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
local v24 = game:DefineFastFlag("AppChatDeprecateOldChatSettings", false);
local v25 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
return function(v26) --[[ Line: 41 ]] --[[ Name: AppChatAccountSettingsEventReceiver ]]
    -- upvalues: l_useDispatch_0 (copy), v8 (copy), l_useSelector_0 (copy), l_LoginStatus_0 (copy), v17 (copy), v9 (copy), v25 (copy), v2 (copy), v7 (copy), v18 (copy), v11 (copy), v13 (copy), l_usePrevious_0 (copy), v12 (copy), v3 (copy), v24 (copy), v23 (copy), v22 (copy), l_FFlagEnableAEGIS2AppChatBanner_0 (copy), l_FFlagEnableAEGIS2AppChatConversationBanner_0 (copy), v16 (copy), v14 (copy), v15 (copy), l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0 (copy)
    local v27 = l_useDispatch_0();
    local v28 = v8();
    local v30 = l_useSelector_0(function(v29) --[[ Line: 44 ]]
        -- upvalues: l_LoginStatus_0 (ref)
        return v29.AuthenticationStatus and v29.AuthenticationStatus.status == l_LoginStatus_0.LOGGED_IN;
    end);
    if v17() then
        v9({
            keyCode = Enum.KeyCode.G, 
            modifierKey = Enum.ModifierKey.Ctrl
        }, function() --[[ Line: 49 ]]
            -- upvalues: v25 (ref), v27 (copy)
            v25:debug("Ctrl + G pressed, toggling group chat enabled");
            v27({
                type = "Debug_GroupChatEnabledToggled"
            });
        end, {
            v27
        });
    end;
    local v32 = v2.useCallback(function() --[[ Line: 57 ]]
        -- upvalues: v27 (copy), v7 (ref), v25 (ref)
        v27(v7()):andThen(function(v31) --[[ Line: 58 ]]
            -- upvalues: v25 (ref)
            v25:info("Finished fetching chat metadata. Determined isChatEnabled as {}", v31);
        end);
    end, {
        v27
    });
    v2.useEffect(function() --[[ Line: 63 ]]
        -- upvalues: v26 (copy), v30 (copy), v28 (copy), v25 (ref), v32 (copy)
        if (not not v26.isInExperience or v30) and not v28 then
            v25:info("App is not loaded, fetching chat metadata");
            v32();
        end;
    end, {
        v32, 
        v28, 
        v26.isInExperience, 
        v30
    });
    if v18 then
        local v33 = v11();
        local v35 = l_useSelector_0(function(v34) --[[ Line: 73 ]]
            -- upvalues: v13 (ref)
            return v13(v34, "ChatAppReducer.ChatSettings.chatUserMessagesEnabled");
        end);
        local v36 = l_usePrevious_0(v35);
        local l_v33_0 = v33 --[[ copy: 5 -> 8 ]];
        local l_v35_0 = v35 --[[ copy: 6 -> 9 ]];
        v2.useEffect(function() --[[ Line: 78 ]]
            -- upvalues: l_v33_0 (copy), v36 (copy), l_v35_0 (copy), v25 (ref), v27 (copy), v12 (ref)
            if l_v33_0 and v36 ~= nil and v36 ~= l_v35_0 then
                v25:info("Chat messages eligibility changed, reloading all messages");
                v27(v12()):catch(function(v39) --[[ Line: 85 ]]
                    -- upvalues: v25 (ref)
                    v25:warn("Failed to reload all messages after chat user messages eligibility change", v39);
                end);
            end;
        end, {
            v27, 
            v33, 
            v36, 
            v35
        });
    end;
    v3.useRealtimeNamespace("UserSettingsChanged", function(v40) --[[ Line: 92 ]]
        -- upvalues: v24 (ref), v23 (ref), v25 (ref), v27 (copy), v12 (ref), v32 (copy)
        if v40.SettingsChanged then
            local v41 = not v24 and (table.find(v40.SettingsChanged, "WhoCanChatWithMeInApp") or table.find(v40.SettingsChanged, "WhoCanGroupChatWithMeInApp") or table.find(v40.SettingsChanged, "WhoCanOneOnOnePartyWithMe") or table.find(v40.SettingsChanged, "WhoCanGroupPartyWithMe"));
            if v23 then
                local v42 = table.find(v40.SettingsChanged, "WhoCanUsePartyChatWithMe");
                if v42 then
                    v25:info("Received privacy setting notification, reloading all messages");
                    v27(v12()):catch(function(v43) --[[ Line: 105 ]]
                        -- upvalues: v25 (ref)
                        v25:warn("Failed to reload all messages after party setting change", v43);
                    end);
                end;
                v41 = v41 or table.find(v40.SettingsChanged, "WhoCanPartyWithMe") or table.find(v40.SettingsChanged, "WhoCanUsePartyVoiceWithMe") or v42;
            end;
            if v41 then
                v25:info("Received privacy setting notification, fetching chat metadata");
                v32();
            end;
        end;
    end, {
        v32, 
        v27
    });
    v3.useRealtimeConnectionStateChanged("UserSettingsChanged", function(v44, v45) --[[ Line: 122 ]]
        -- upvalues: v25 (ref), v32 (copy)
        if v44 == Enum.ConnectionState.Connected and v45 then
            v25:info("Reconnected to UserSettingsChanged, fetching chat metadata");
            v32();
        end;
    end, {
        v32
    });
    if v22 and (l_FFlagEnableAEGIS2AppChatBanner_0 or l_FFlagEnableAEGIS2AppChatConversationBanner_0) then
        local v46 = v16();
        local function v49(v47) --[[ Line: 135 ]]
            -- upvalues: l_FFlagEnableAEGIS2AppChatBanner_0 (ref), v27 (copy), v14 (ref), v25 (ref), l_FFlagEnableAEGIS2AppChatConversationBanner_0 (ref), v15 (ref)
            if l_FFlagEnableAEGIS2AppChatBanner_0 then
                v27(v14.rodux.GetChatLandingModal.API(v47)):catch(function(v48) --[[ Line: 137 ]]
                    -- upvalues: v25 (ref)
                    v25:warning("Error in GetChatLandingModal request. Error: {}", (tostring(v48)));
                end);
            end;
            if l_FFlagEnableAEGIS2AppChatConversationBanner_0 then
                v27(v15(v14.Constants.ModalSequence.ConversationBottomModal));
            end;
        end;
        v3.useRealtimeNamespace(l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0, function(_) --[[ Line: 152 ]]
            -- upvalues: v25 (ref), l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0 (ref), v28 (copy), v49 (copy), v26 (copy), v32 (copy)
            v25:info("Received Realtime: {}", l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0);
            if not v28 then
                return;
            else
                v49(v26.isInExperience);
                v32();
                return;
            end;
        end, {
            v32, 
            v28, 
            v26.isInExperience, 
            v46
        });
        v3.useRealtimeConnectionStateChanged(l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0, function(v51, v52) --[[ Line: 164 ]]
            -- upvalues: v25 (ref), l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0 (ref), v28 (copy), v49 (copy), v26 (copy), v32 (copy)
            v25:info("Reconnected to Realtime: {}, hasMissedEvents: {}", l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0, (tostring(v52)));
            if v51 ~= Enum.ConnectionState.Connected or not v52 or not v28 then
                return;
            else
                v49(v26.isInExperience);
                v32();
                return;
            end;
        end, {
            v32, 
            v28, 
            v26.isInExperience, 
            v46
        });
    end;
    return nil;
end;