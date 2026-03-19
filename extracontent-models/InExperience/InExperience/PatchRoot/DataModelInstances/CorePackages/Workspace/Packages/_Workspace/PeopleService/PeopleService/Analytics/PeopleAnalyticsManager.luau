local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PeopleService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.GameInvite);
local v4 = require(l_script_FirstAncestor_0.Flags);
local l_GetFIntInspectButtonThrottleHundredthsPercent_0 = v4.GetFIntInspectButtonThrottleHundredthsPercent;
local l_GetFIntGameInviteEntryPointThrottleHundredthsPercent_0 = v4.GetFIntGameInviteEntryPointThrottleHundredthsPercent;
local l_GetFIntMuteAllThrottleHundredthsPercent_0 = v4.GetFIntMuteAllThrottleHundredthsPercent;
local l_GetFIntUnmuteAllThrottleHundredthsPercent_0 = v4.GetFIntUnmuteAllThrottleHundredthsPercent;
local l_GetFIntMutePlayerThrottleHundredthsPercent_0 = v4.GetFIntMutePlayerThrottleHundredthsPercent;
local l_GetFIntUnmutePlayerThrottleHundredthsPercent_0 = v4.GetFIntUnmutePlayerThrottleHundredthsPercent;
local l_GetFIntRequestFriendshipThrottleHundredthsPercent_0 = v4.GetFIntRequestFriendshipThrottleHundredthsPercent;
local l_GetFIntMuteSelfThrottleHundredthsPercent_0 = v4.GetFIntMuteSelfThrottleHundredthsPercent;
local l_GetFIntUnmuteSelfThrottleHundredthsPercent_0 = v4.GetFIntUnmuteSelfThrottleHundredthsPercent;
local l_GetFIntBlockUserButtonClickThrottleHundredthsPercent_0 = v4.GetFIntBlockUserButtonClickThrottleHundredthsPercent;
local l_GetFIntBlockUserThrottleHundredthsPercent_0 = v4.GetFIntBlockUserThrottleHundredthsPercent;
local l_GetFIntUnblockUserThrottleHundredthsPercent_0 = v4.GetFIntUnblockUserThrottleHundredthsPercent;
local l_GetFIntPeoplePageLayoutChangedThrottleHundredthsPercent_0 = v4.GetFIntPeoplePageLayoutChangedThrottleHundredthsPercent;
local l_GetFIntPersonCardMenuToggledThrottleHundredthsPercent_0 = v4.GetFIntPersonCardMenuToggledThrottleHundredthsPercent;
local l_GetFFlagAddPeoplePageCardLayout_0 = v4.GetFFlagAddPeoplePageCardLayout;
local v20 = {
    ButtonName = {
        SettingsHub = "settingsHub"
    }, 
    EventName = {
        GameInviteEntryPoint = "inputShareGameEntryPoint", 
        GameInviteEntryPointCounter = settings():GetFVariable("LuaShareGameSettingsHubEntryCounter"), 
        InspectButton = "ingame_menu_action", 
        MuteAll = "mute_all", 
        UnmuteAll = "unmute_all", 
        MutePlayer = "mute_player", 
        UnmutePlayer = "unmute_player", 
        MuteSelf = "mute_self", 
        UnmuteSelf = "unmute_self", 
        PlayersMenu = "PlayersMenu", 
        RequestFriendship = "RequestFriendship", 
        BlockUserButtonClick = "blockUserButtonClick", 
        BlockUser = "blockUser", 
        UnblockUser = "unblockUser", 
        PeoplePageLayoutChanged = "people_page_layout_changed", 
        PersonCardMenuToggled = "person_card_menu_toggled"
    }
};
local v21 = {
    GameInviteEntryPoint = {
        eventConfig = {
            eventName = v20.EventName.GameInviteEntryPoint, 
            backends = {
                "EventIngest"
            }, 
            throttlingPercentage = l_GetFIntGameInviteEntryPointThrottleHundredthsPercent_0(), 
            lastUpdated = {
                2025, 
                6, 
                25
            }, 
            description = "Event to track game invite entry point from people tab."
        }, 
        counterConfig = {
            eventName = v20.EventName.GameInviteEntryPointCounter, 
            backends = {
                "RobloxTelemetryCounter"
            }, 
            throttlingPercentage = l_GetFIntGameInviteEntryPointThrottleHundredthsPercent_0(), 
            lastUpdated = {
                2025, 
                6, 
                25
            }, 
            description = "Counter to track game invite entry point clicks from people tab."
        }
    }, 
    InspectButton = {
        eventConfig = {
            eventName = v20.EventName.InspectButton, 
            backends = {
                "EventIngest"
            }, 
            throttlingPercentage = l_GetFIntInspectButtonThrottleHundredthsPercent_0(), 
            lastUpdated = {
                2025, 
                7, 
                14
            }, 
            description = "Event to track inspect button click from people tab."
        }
    }, 
    MuteAll = {
        eventConfig = {
            eventName = v20.EventName.MuteAll, 
            backends = {
                "EventIngest"
            }, 
            throttlingPercentage = l_GetFIntMuteAllThrottleHundredthsPercent_0(), 
            lastUpdated = {
                2025, 
                6, 
                26
            }, 
            description = "Event to track mute all button click."
        }
    }, 
    UnmuteAll = {
        eventConfig = {
            eventName = v20.EventName.UnmuteAll, 
            backends = {
                "EventIngest"
            }, 
            throttlingPercentage = l_GetFIntUnmuteAllThrottleHundredthsPercent_0(), 
            lastUpdated = {
                2025, 
                6, 
                26
            }, 
            description = "Event to track unmute all button click."
        }
    }, 
    MutePlayer = {
        eventConfig = {
            eventName = v20.EventName.MutePlayer, 
            backends = {
                "EventIngest"
            }, 
            throttlingPercentage = l_GetFIntMutePlayerThrottleHundredthsPercent_0(), 
            lastUpdated = {
                2025, 
                7, 
                9
            }, 
            description = "Event to track individual player mute button click."
        }
    }, 
    UnmutePlayer = {
        eventConfig = {
            eventName = v20.EventName.UnmutePlayer, 
            backends = {
                "EventIngest"
            }, 
            throttlingPercentage = l_GetFIntUnmutePlayerThrottleHundredthsPercent_0(), 
            lastUpdated = {
                2025, 
                7, 
                9
            }, 
            description = "Event to track individual player unmute button click."
        }
    }, 
    MuteSelf = {
        eventConfig = {
            eventName = v20.EventName.MuteSelf, 
            backends = {
                "EventIngest"
            }, 
            throttlingPercentage = l_GetFIntMuteSelfThrottleHundredthsPercent_0(), 
            lastUpdated = {
                2025, 
                7, 
                23
            }, 
            description = "Event to track mute self button click."
        }
    }, 
    UnmuteSelf = {
        eventConfig = {
            eventName = v20.EventName.UnmuteSelf, 
            backends = {
                "EventIngest"
            }, 
            throttlingPercentage = l_GetFIntUnmuteSelfThrottleHundredthsPercent_0(), 
            lastUpdated = {
                2025, 
                7, 
                23
            }, 
            description = "Event to track unmute self button click."
        }
    }, 
    RequestFriendship = {
        eventConfig = {
            eventName = if l_GetFFlagAddPeoplePageCardLayout_0() then v20.EventName.RequestFriendship else v20.EventName.PlayersMenu, 
            backends = {
                "EventIngest"
            }, 
            throttlingPercentage = l_GetFIntRequestFriendshipThrottleHundredthsPercent_0(), 
            lastUpdated = {
                2025, 
                7, 
                9
            }, 
            description = "Event to track players menu actions."
        }, 
        counterConfig = {
            eventName = v20.EventName.PlayersMenu, 
            backends = {
                "RobloxTelemetryCounter"
            }, 
            lastUpdated = {
                2025, 
                7, 
                9
            }, 
            description = "Counter to track players menu actions."
        }
    }, 
    BlockUserButtonClick = {
        eventConfig = {
            eventName = v20.EventName.BlockUserButtonClick, 
            backends = {
                "EventIngest"
            }, 
            throttlingPercentage = l_GetFIntBlockUserButtonClickThrottleHundredthsPercent_0(), 
            lastUpdated = {
                2025, 
                7, 
                22
            }, 
            description = "Event to track block user button clicks from people tab."
        }
    }, 
    BlockUser = {
        eventConfig = {
            eventName = v20.EventName.BlockUser, 
            backends = {
                "EventIngest"
            }, 
            throttlingPercentage = l_GetFIntBlockUserThrottleHundredthsPercent_0(), 
            lastUpdated = {
                2025, 
                7, 
                22
            }, 
            description = "Event to track successful user blocking from people tab."
        }
    }, 
    UnblockUser = {
        eventConfig = {
            eventName = v20.EventName.UnblockUser, 
            backends = {
                "EventIngest"
            }, 
            throttlingPercentage = l_GetFIntUnblockUserThrottleHundredthsPercent_0(), 
            lastUpdated = {
                2025, 
                7, 
                22
            }, 
            description = "Event to track user unblocking from people tab."
        }
    }, 
    PeoplePageLayoutChanged = {
        eventConfig = {
            eventName = v20.EventName.PeoplePageLayoutChanged, 
            backends = {
                "EventIngest"
            }, 
            throttlingPercentage = l_GetFIntPeoplePageLayoutChangedThrottleHundredthsPercent_0(), 
            lastUpdated = {
                2025, 
                9, 
                2
            }, 
            description = "Event to track people page layout change."
        }
    }, 
    PersonCardMenuToggled = {
        eventConfig = {
            eventName = v20.EventName.PersonCardMenuToggled, 
            backends = {
                "EventIngest"
            }, 
            throttlingPercentage = l_GetFIntPersonCardMenuToggledThrottleHundredthsPercent_0(), 
            lastUpdated = {
                2025, 
                9, 
                2
            }, 
            description = "Event to track person card menu toggle."
        }
    }
};
v20.TelemetryConfigs = v21;
local l_GameInviteAnalyticsManager_0 = v3.GameInviteAnalyticsManager;
v20.trackGameInviteEntryPoint = function(_) --[[ Line: 211 ]] --[[ Name: trackGameInviteEntryPoint ]]
    -- upvalues: v20 (copy), v21 (copy), l_TelemetryService_0 (copy), l_GameInviteAnalyticsManager_0 (copy)
    local v24 = {
        btn = v20.ButtonName.SettingsHub, 
        placeId = tostring(game.PlaceId), 
        gameId = tostring(game.GameId)
    };
    local l_GameInviteEntryPoint_0 = v21.GameInviteEntryPoint;
    l_TelemetryService_0:LogEvent(l_GameInviteEntryPoint_0.eventConfig, {
        customFields = v24
    });
    l_TelemetryService_0:LogCounter(l_GameInviteEntryPoint_0.counterConfig, {}, 1);
    l_GameInviteAnalyticsManager_0:withButtonName(v20.ButtonName.SettingsHub);
end;
v20.trackToggleMuteSelf = function(_, v27) --[[ Line: 225 ]] --[[ Name: trackToggleMuteSelf ]]
    -- upvalues: l_TelemetryService_0 (copy), v21 (copy)
    if v27 then
        l_TelemetryService_0:LogEvent(v21.UnmuteSelf.eventConfig, {});
        return;
    else
        l_TelemetryService_0:LogEvent(v21.MuteSelf.eventConfig, {});
        return;
    end;
end;
v20.trackInspectButton = function(_, v29, v30, v31) --[[ Line: 233 ]] --[[ Name: trackInspectButton ]]
    -- upvalues: l_GetFFlagAddPeoplePageCardLayout_0 (copy), v21 (copy), l_TelemetryService_0 (copy)
    local v32 = {
        playsessionid = v30, 
        universeid = tostring(v29)
    };
    if l_GetFFlagAddPeoplePageCardLayout_0() then
        v32.entrypoint = v31;
    end;
    local l_InspectButton_0 = v21.InspectButton;
    l_TelemetryService_0:LogEvent(l_InspectButton_0.eventConfig, {
        eventContext = l_GetFFlagAddPeoplePageCardLayout_0() and "examine_avatar" or nil, 
        customFields = v32
    });
end;
v20.trackToggleMuteAll = function(_, v35) --[[ Line: 249 ]] --[[ Name: trackToggleMuteAll ]]
    -- upvalues: l_TelemetryService_0 (copy), v21 (copy)
    if v35 then
        l_TelemetryService_0:LogEvent(v21.UnmuteAll.eventConfig, {});
        return;
    else
        l_TelemetryService_0:LogEvent(v21.MuteAll.eventConfig, {});
        return;
    end;
end;
v20.trackToggleMutePlayer = function(_, v37, v38, v39) --[[ Line: 257 ]] --[[ Name: trackToggleMutePlayer ]]
    -- upvalues: l_TelemetryService_0 (copy), v21 (copy), l_GetFFlagAddPeoplePageCardLayout_0 (copy)
    if v38 then
        l_TelemetryService_0:LogEvent(v21.UnmutePlayer.eventConfig, {
            customFields = {
                mutedUserId = v37, 
                entryPoint = if l_GetFFlagAddPeoplePageCardLayout_0() then v39 else nil
            }
        });
        return;
    else
        l_TelemetryService_0:LogEvent(v21.MutePlayer.eventConfig, {
            customFields = {
                mutedUserId = v37, 
                entryPoint = if l_GetFFlagAddPeoplePageCardLayout_0() then v39 else nil
            }
        });
        return;
    end;
end;
v20.trackRequestFriendship = function(_, v41) --[[ Line: 275 ]] --[[ Name: trackRequestFriendship ]]
    -- upvalues: l_GetFFlagAddPeoplePageCardLayout_0 (copy), v21 (copy), l_TelemetryService_0 (copy)
    local v42 = {
        selectedItem = "RequestFriendship", 
        category = "Game", 
        entryPoint = if l_GetFFlagAddPeoplePageCardLayout_0() then v41 else nil
    };
    local l_RequestFriendship_0 = v21.RequestFriendship;
    l_TelemetryService_0:LogEvent(l_RequestFriendship_0.eventConfig, {
        eventContext = l_GetFFlagAddPeoplePageCardLayout_0() and "PlayersMenu" or nil, 
        customFields = v42
    });
    l_TelemetryService_0:LogCounter(l_RequestFriendship_0.counterConfig, {
        customFields = {
            selectedItem = "RequestFriendship"
        }
    }, 1);
end;
v20.trackBlockUserButtonClick = function(_, v45, v46, v47) --[[ Line: 290 ]] --[[ Name: trackBlockUserButtonClick ]]
    -- upvalues: v21 (copy), l_TelemetryService_0 (copy)
    local v48 = {
        blockeeUserId = v45, 
        blockerUserId = v46, 
        source = v47
    };
    local l_BlockUserButtonClick_0 = v21.BlockUserButtonClick;
    l_TelemetryService_0:LogEvent(l_BlockUserButtonClick_0.eventConfig, {
        customFields = v48
    });
end;
v20.trackBlockUser = function(_, v51, v52, v53) --[[ Line: 301 ]] --[[ Name: trackBlockUser ]]
    -- upvalues: v21 (copy), l_TelemetryService_0 (copy)
    local v54 = {
        blockeeUserId = v51, 
        blockerUserId = v52, 
        source = v53
    };
    local l_BlockUser_0 = v21.BlockUser;
    l_TelemetryService_0:LogEvent(l_BlockUser_0.eventConfig, {
        customFields = v54
    });
end;
v20.trackUnblockUser = function(_, v57, v58, v59) --[[ Line: 312 ]] --[[ Name: trackUnblockUser ]]
    -- upvalues: l_GetFFlagAddPeoplePageCardLayout_0 (copy), v21 (copy), l_TelemetryService_0 (copy)
    local v60 = {
        blockeeUserId = v57, 
        blockerUserId = v58, 
        entryPoint = if l_GetFFlagAddPeoplePageCardLayout_0() then v59 else nil
    };
    local l_UnblockUser_0 = v21.UnblockUser;
    l_TelemetryService_0:LogEvent(l_UnblockUser_0.eventConfig, {
        customFields = v60
    });
end;
if l_GetFFlagAddPeoplePageCardLayout_0() then
    v20.trackPeoplePageLayoutChanged = function(_, v63) --[[ Line: 324 ]] --[[ Name: trackPeoplePageLayoutChanged ]]
        -- upvalues: v21 (copy), l_TelemetryService_0 (copy)
        local v64 = {
            layout = v63.Name
        };
        local l_PeoplePageLayoutChanged_0 = v21.PeoplePageLayoutChanged;
        l_TelemetryService_0:LogEvent(l_PeoplePageLayoutChanged_0.eventConfig, {
            customFields = v64, 
            standardizedFields = {
                "addPlaceId", 
                "addUniverseId", 
                "addPlaySessionId", 
                "addSessionInfo"
            }
        });
    end;
    v20.trackPersonCardMenuToggled = function(_, v67) --[[ Line: 336 ]] --[[ Name: trackPersonCardMenuToggled ]]
        -- upvalues: v21 (copy), l_TelemetryService_0 (copy)
        local v68 = {
            is_toggled_on = tostring(v67)
        };
        local l_PersonCardMenuToggled_0 = v21.PersonCardMenuToggled;
        l_TelemetryService_0:LogEvent(l_PersonCardMenuToggled_0.eventConfig, {
            customFields = v68, 
            standardizedFields = {
                "addPlaceId", 
                "addUniverseId", 
                "addPlaySessionId", 
                "addSessionInfo"
            }
        });
    end;
end;
return v20;