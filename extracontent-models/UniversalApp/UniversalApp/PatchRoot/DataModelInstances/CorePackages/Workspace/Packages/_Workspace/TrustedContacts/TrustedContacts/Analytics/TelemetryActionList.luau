local l_Parent_0 = script:FindFirstAncestor("TrustedContacts").Parent;
local v1 = require(l_Parent_0.SocialLuaAnalytics);
local l_SupportedTelemetryBackends_0 = v1.Analytics.Enums.SupportedTelemetryBackends;
local l_EventTypes_0 = v1.Analytics.Enums.EventTypes;
local l_Contexts_0 = v1.Analytics.Enums.Contexts;
local v5 = require(script.Parent.EventNames);
local v6 = require(script.Parent.ButtonNames);
local l_FFlagTCStreamNotifEventReceiver_0 = require(l_Parent_0.SharedFlags).FFlagTCStreamNotifEventReceiver;
local l_FFlagTCNotifFixEventName_0 = require(l_Parent_0.SharedFlags).FFlagTCNotifFixEventName;
local l_FFlagTCShareLinkSenderUI_0 = require(l_Parent_0.SharedFlags).FFlagTCShareLinkSenderUI;
return {
    defaults = {
        throttlingThousandths = game:DefineFastInt("TrustedContactsAnalyticsThrottlingThousandths", 10000), 
        links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/social/trusted_connections.proto"
    }, 
    [v5.FriendsRenameInfoModalSeen] = {
        description = "Friends rename info modal mounted", 
        lastUpdated = {
            25, 
            6, 
            4
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 27 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.UserSeen;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.FriendsRenameInfoModal
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v5.TCUpsellModalSeen] = {
        description = "TC Upsell modal mounted", 
        lastUpdated = {
            25, 
            6, 
            4
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 45 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.UserSeen;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCUpsellModal
                }, 
                dynamicCustomFields = {
                    modalVariant = function(v10) --[[ Line: 52 ]] --[[ Name: modalVariant ]]
                        return v10;
                    end, 
                    source = function(v11) --[[ Line: 55 ]] --[[ Name: source ]]
                        return v11;
                    end
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    modalVariant = function(v12) --[[ Line: 63 ]] --[[ Name: modalVariant ]]
                        return v12;
                    end, 
                    source = function(v13) --[[ Line: 66 ]] --[[ Name: source ]]
                        return v13;
                    end
                }
            }
        }
    }, 
    [v5.TCEducationModalSeen] = {
        description = "TC Education modal mounted", 
        lastUpdated = {
            25, 
            6, 
            4
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 79 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.UserSeen;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCEducationModal
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v5.FriendsRenameLearnMoreClicked] = {
        description = "Friends rename info modal learn more text clicked", 
        lastUpdated = {
            25, 
            6, 
            4
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 97 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.FriendsRenameInfoModal, 
                    btn = v6.LearnMore
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v5.TCUpsellGotItClicked] = {
        description = "TC Upsell modal got it button clicked", 
        lastUpdated = {
            25, 
            6, 
            4
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 116 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCUpsellModal, 
                    btn = v6.GotIt
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v5.TCUpsellCloseClicked] = {
        description = "TC Upsell modal close button clicked", 
        lastUpdated = {
            25, 
            6, 
            4
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 135 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCUpsellModal, 
                    btn = v6.Close
                }, 
                dynamicCustomFields = {
                    modalVariant = function(v14) --[[ Line: 143 ]] --[[ Name: modalVariant ]]
                        return v14;
                    end, 
                    source = function(v15) --[[ Line: 146 ]] --[[ Name: source ]]
                        return v15;
                    end
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    modalVariant = function(v16) --[[ Line: 154 ]] --[[ Name: modalVariant ]]
                        return v16;
                    end, 
                    source = function(v17) --[[ Line: 157 ]] --[[ Name: source ]]
                        return v17;
                    end
                }
            }
        }
    }, 
    [v5.TCUpsellRemoveTrustedConnectionClicked] = {
        description = "TC Upsell modal remove trusted connection button clicked", 
        lastUpdated = {
            25, 
            6, 
            4
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 170 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCUpsellModal, 
                    btn = v6.RemoveTrustedConnection
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v5.TCUpsellAcceptTrustedConnectionClicked] = {
        description = "TC Upsell modal accept trusted connection button clicked", 
        lastUpdated = {
            25, 
            9, 
            17
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 189 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCUpsellModal, 
                    btn = v6.AcceptTrustedConnection
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v5.TCUpsellAddTrustedConnectionClicked] = {
        description = "TC Upsell modal add trusted connection button clicked", 
        lastUpdated = {
            25, 
            9, 
            17
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 208 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCUpsellModal, 
                    btn = v6.AddTrustedConnection
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v5.TCEducationGotItClicked] = {
        description = "TC Education modal got it button clicked", 
        lastUpdated = {
            25, 
            6, 
            4
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 227 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCEducationModal, 
                    btn = v6.GotIt
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v5.TCEducationCloseClicked] = {
        description = "TC Education modal close button clicked", 
        lastUpdated = {
            25, 
            6, 
            4
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 246 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCEducationModal, 
                    btn = v6.Close
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v5.TCUpsellCancelClicked] = {
        description = "TC Upsell modal cancel button clicked", 
        lastUpdated = {
            25, 
            9, 
            17
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 265 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCUpsellModal, 
                    btn = v6.Cancel
                }, 
                dynamicCustomFields = {
                    modalVariant = function(v18) --[[ Line: 273 ]] --[[ Name: modalVariant ]]
                        return v18;
                    end, 
                    source = function(v19) --[[ Line: 276 ]] --[[ Name: source ]]
                        return v19;
                    end
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    modalVariant = function(v20) --[[ Line: 284 ]] --[[ Name: modalVariant ]]
                        return v20;
                    end, 
                    source = function(v21) --[[ Line: 287 ]] --[[ Name: source ]]
                        return v21;
                    end
                }
            }
        }
    }, 
    [v5.TCUpsellAddViaLinkClicked] = if l_FFlagTCShareLinkSenderUI_0 then {
        description = "TC Upsell modal 'Add via link' button clicked", 
        lastUpdated = {
            26, 
            1, 
            28
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 301 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCUpsellModal, 
                    btn = v6.AddViaLink
                }, 
                dynamicCustomFields = {
                    modalVariant = function(v22) --[[ Line: 309 ]] --[[ Name: modalVariant ]]
                        return v22;
                    end, 
                    source = function(v23) --[[ Line: 312 ]] --[[ Name: source ]]
                        return v23;
                    end
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    modalVariant = function(v24) --[[ Line: 320 ]] --[[ Name: modalVariant ]]
                        return v24;
                    end, 
                    source = function(v25) --[[ Line: 323 ]] --[[ Name: source ]]
                        return v25;
                    end
                }
            }
        }
    } else nil, 
    [v5.TCEducationManageConnectionsClicked] = {
        description = "TC Education modal manage connections button clicked", 
        lastUpdated = {
            25, 
            6, 
            4
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 337 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCEducationModal, 
                    btn = v6.ManageConnections
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v5.TCStreamNotificationAcceptClicked] = if l_FFlagTCStreamNotifEventReceiver_0 then {
        description = "TC stream notification accept CTA clicked", 
        lastUpdated = {
            26, 
            1, 
            16
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 357 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.StreamNotification, 
                    btn = v6.AcceptTrustedConnection
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    } else nil, 
    [v5.TCToastNotificationAcceptClicked] = if l_FFlagTCNotifFixEventName_0 then {
        description = "TC toast notification accept CTA clicked", 
        lastUpdated = {
            26, 
            1, 
            16
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 378 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.ToastNotification, 
                    btn = v6.AcceptTrustedConnection
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    } else nil
};