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
local l_FFlagTCVerifiedParentalControl_0 = require(l_Parent_0.SharedFlags).FFlagTCVerifiedParentalControl;
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
                overrideName = function() --[[ Line: 28 ]] --[[ Name: overrideName ]]
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
                overrideName = function() --[[ Line: 46 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.UserSeen;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCUpsellModal
                }, 
                dynamicCustomFields = {
                    modalVariant = function(v11) --[[ Line: 53 ]] --[[ Name: modalVariant ]]
                        return v11;
                    end, 
                    source = function(v12) --[[ Line: 56 ]] --[[ Name: source ]]
                        return v12;
                    end
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    modalVariant = function(v13) --[[ Line: 64 ]] --[[ Name: modalVariant ]]
                        return v13;
                    end, 
                    source = function(v14) --[[ Line: 67 ]] --[[ Name: source ]]
                        return v14;
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
                overrideName = function() --[[ Line: 80 ]] --[[ Name: overrideName ]]
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
                overrideName = function() --[[ Line: 98 ]] --[[ Name: overrideName ]]
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
                overrideName = function() --[[ Line: 117 ]] --[[ Name: overrideName ]]
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
                overrideName = function() --[[ Line: 136 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCUpsellModal, 
                    btn = v6.Close
                }, 
                dynamicCustomFields = {
                    modalVariant = function(v15) --[[ Line: 144 ]] --[[ Name: modalVariant ]]
                        return v15;
                    end, 
                    source = function(v16) --[[ Line: 147 ]] --[[ Name: source ]]
                        return v16;
                    end
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    modalVariant = function(v17) --[[ Line: 155 ]] --[[ Name: modalVariant ]]
                        return v17;
                    end, 
                    source = function(v18) --[[ Line: 158 ]] --[[ Name: source ]]
                        return v18;
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
                overrideName = function() --[[ Line: 171 ]] --[[ Name: overrideName ]]
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
                overrideName = function() --[[ Line: 190 ]] --[[ Name: overrideName ]]
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
                overrideName = function() --[[ Line: 209 ]] --[[ Name: overrideName ]]
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
                overrideName = function() --[[ Line: 228 ]] --[[ Name: overrideName ]]
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
                overrideName = function() --[[ Line: 247 ]] --[[ Name: overrideName ]]
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
                overrideName = function() --[[ Line: 266 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCUpsellModal, 
                    btn = v6.Cancel
                }, 
                dynamicCustomFields = {
                    modalVariant = function(v19) --[[ Line: 274 ]] --[[ Name: modalVariant ]]
                        return v19;
                    end, 
                    source = function(v20) --[[ Line: 277 ]] --[[ Name: source ]]
                        return v20;
                    end
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    modalVariant = function(v21) --[[ Line: 285 ]] --[[ Name: modalVariant ]]
                        return v21;
                    end, 
                    source = function(v22) --[[ Line: 288 ]] --[[ Name: source ]]
                        return v22;
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
                overrideName = function() --[[ Line: 302 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCUpsellModal, 
                    btn = v6.AddViaLink
                }, 
                dynamicCustomFields = {
                    modalVariant = function(v23) --[[ Line: 310 ]] --[[ Name: modalVariant ]]
                        return v23;
                    end, 
                    source = function(v24) --[[ Line: 313 ]] --[[ Name: source ]]
                        return v24;
                    end
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    modalVariant = function(v25) --[[ Line: 321 ]] --[[ Name: modalVariant ]]
                        return v25;
                    end, 
                    source = function(v26) --[[ Line: 324 ]] --[[ Name: source ]]
                        return v26;
                    end
                }
            }
        }
    } else nil, 
    [v5.TrustedFriendsVPCPrologueOpened] = if l_FFlagTCVerifiedParentalControl_0 then {
        description = "Trusted Friends VPC Prologue open button clicked in TC modal", 
        lastUpdated = {
            26, 
            2, 
            26
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 339 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCUpsellModal, 
                    btn = v6.OpenVPCPrologue
                }, 
                dynamicCustomFields = {
                    modalVariant = function(v27) --[[ Line: 347 ]] --[[ Name: modalVariant ]]
                        return v27;
                    end, 
                    source = function(v28) --[[ Line: 350 ]] --[[ Name: source ]]
                        return v28;
                    end
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    modalVariant = function(v29) --[[ Line: 358 ]] --[[ Name: modalVariant ]]
                        return v29;
                    end, 
                    source = function(v30) --[[ Line: 361 ]] --[[ Name: source ]]
                        return v30;
                    end
                }
            }
        }
    } else nil, 
    [v5.TrustedFriendsVPCAskClicked] = if l_FFlagTCVerifiedParentalControl_0 then {
        description = "Trusted Friends VPC Prologue Ask button clicked", 
        lastUpdated = {
            26, 
            2, 
            26
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 376 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TrustedFriendsVPCPrologue, 
                    btn = v6.Ask
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    } else nil, 
    [v5.TrustedFriendsVPCCancelClicked] = if l_FFlagTCVerifiedParentalControl_0 then {
        description = "Trusted Friends VPC Prologue Cancel button clicked", 
        lastUpdated = {
            26, 
            2, 
            26
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 397 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TrustedFriendsVPCPrologue, 
                    btn = v6.Cancel
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
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
                overrideName = function() --[[ Line: 417 ]] --[[ Name: overrideName ]]
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
                overrideName = function() --[[ Line: 437 ]] --[[ Name: overrideName ]]
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
                overrideName = function() --[[ Line: 458 ]] --[[ Name: overrideName ]]
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