local l_script_FirstAncestor_0 = script:FindFirstAncestor("TrustedContacts");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.SocialLuaAnalytics);
local l_SupportedTelemetryBackends_0 = v2.Analytics.Enums.SupportedTelemetryBackends;
local l_EventTypes_0 = v2.Analytics.Enums.EventTypes;
local l_Contexts_0 = v2.Analytics.Enums.Contexts;
local v6 = require(script.Parent.EventNames);
local v7 = require(script.Parent.ButtonNames);
local l_FFlagTCStreamNotifEventReceiver_0 = require(l_Parent_0.SharedFlags).FFlagTCStreamNotifEventReceiver;
local l_FFlagTCNotifFixEventName_0 = require(l_Parent_0.SharedFlags).FFlagTCNotifFixEventName;
local l_FFlagTCShareLinkSenderUI_0 = require(l_Parent_0.SharedFlags).FFlagTCShareLinkSenderUI;
local l_FFlagTCVerifiedParentalControl_0 = require(l_Parent_0.SharedFlags).FFlagTCVerifiedParentalControl;
local v12 = require(l_script_FirstAncestor_0.Flags.FFlagTCLearnMoreLink);
return {
    defaults = {
        throttlingThousandths = game:DefineFastInt("TrustedContactsAnalyticsThrottlingThousandths", 10000), 
        links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/social/trusted_connections.proto"
    }, 
    [v6.FriendsRenameInfoModalSeen] = {
        description = "Friends rename info modal mounted", 
        lastUpdated = {
            25, 
            6, 
            4
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 29 ]] --[[ Name: overrideName ]]
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
    [v6.TCUpsellModalSeen] = {
        description = "TC Upsell modal mounted", 
        lastUpdated = {
            25, 
            6, 
            4
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 47 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.UserSeen;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCUpsellModal
                }, 
                dynamicCustomFields = {
                    modalVariant = function(v13) --[[ Line: 54 ]] --[[ Name: modalVariant ]]
                        return v13;
                    end, 
                    source = function(v14) --[[ Line: 57 ]] --[[ Name: source ]]
                        return v14;
                    end
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    modalVariant = function(v15) --[[ Line: 65 ]] --[[ Name: modalVariant ]]
                        return v15;
                    end, 
                    source = function(v16) --[[ Line: 68 ]] --[[ Name: source ]]
                        return v16;
                    end
                }
            }
        }
    }, 
    [v6.TCEducationModalSeen] = {
        description = "TC Education modal mounted", 
        lastUpdated = {
            25, 
            6, 
            4
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 81 ]] --[[ Name: overrideName ]]
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
    [v6.FriendsRenameLearnMoreClicked] = {
        description = "Friends rename info modal learn more text clicked", 
        lastUpdated = {
            25, 
            6, 
            4
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 99 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.FriendsRenameInfoModal, 
                    btn = v7.LearnMore
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v6.TCUpsellGotItClicked] = {
        description = "TC Upsell modal got it button clicked", 
        lastUpdated = {
            25, 
            6, 
            4
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 118 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCUpsellModal, 
                    btn = v7.GotIt
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v6.TCUpsellCloseClicked] = {
        description = "TC Upsell modal close button clicked", 
        lastUpdated = {
            25, 
            6, 
            4
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 137 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCUpsellModal, 
                    btn = v7.Close
                }, 
                dynamicCustomFields = {
                    modalVariant = function(v17) --[[ Line: 145 ]] --[[ Name: modalVariant ]]
                        return v17;
                    end, 
                    source = function(v18) --[[ Line: 148 ]] --[[ Name: source ]]
                        return v18;
                    end
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    modalVariant = function(v19) --[[ Line: 156 ]] --[[ Name: modalVariant ]]
                        return v19;
                    end, 
                    source = function(v20) --[[ Line: 159 ]] --[[ Name: source ]]
                        return v20;
                    end
                }
            }
        }
    }, 
    [v6.TCUpsellRemoveTrustedConnectionClicked] = {
        description = "TC Upsell modal remove trusted connection button clicked", 
        lastUpdated = {
            25, 
            6, 
            4
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 172 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCUpsellModal, 
                    btn = v7.RemoveTrustedConnection
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v6.TCUpsellAcceptTrustedConnectionClicked] = {
        description = "TC Upsell modal accept trusted connection button clicked", 
        lastUpdated = {
            25, 
            9, 
            17
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 191 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCUpsellModal, 
                    btn = v7.AcceptTrustedConnection
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v6.TCUpsellAddTrustedConnectionClicked] = {
        description = "TC Upsell modal add trusted connection button clicked", 
        lastUpdated = {
            25, 
            9, 
            17
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 210 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCUpsellModal, 
                    btn = v7.AddTrustedConnection
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v6.TCEducationGotItClicked] = {
        description = "TC Education modal got it button clicked", 
        lastUpdated = {
            25, 
            6, 
            4
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 229 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCEducationModal, 
                    btn = v7.GotIt
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v6.TCEducationCloseClicked] = {
        description = "TC Education modal close button clicked", 
        lastUpdated = {
            25, 
            6, 
            4
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 248 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCEducationModal, 
                    btn = v7.Close
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v6.TCUpsellCancelClicked] = {
        description = "TC Upsell modal cancel button clicked", 
        lastUpdated = {
            25, 
            9, 
            17
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 267 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCUpsellModal, 
                    btn = v7.Cancel
                }, 
                dynamicCustomFields = {
                    modalVariant = function(v21) --[[ Line: 275 ]] --[[ Name: modalVariant ]]
                        return v21;
                    end, 
                    source = function(v22) --[[ Line: 278 ]] --[[ Name: source ]]
                        return v22;
                    end
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    modalVariant = function(v23) --[[ Line: 286 ]] --[[ Name: modalVariant ]]
                        return v23;
                    end, 
                    source = function(v24) --[[ Line: 289 ]] --[[ Name: source ]]
                        return v24;
                    end
                }
            }
        }
    }, 
    [v6.TCUpsellAddViaLinkClicked] = if l_FFlagTCShareLinkSenderUI_0 then {
        description = "TC Upsell modal 'Add via link' button clicked", 
        lastUpdated = {
            26, 
            1, 
            28
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 303 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCUpsellModal, 
                    btn = v7.AddViaLink
                }, 
                dynamicCustomFields = {
                    modalVariant = function(v25) --[[ Line: 311 ]] --[[ Name: modalVariant ]]
                        return v25;
                    end, 
                    source = function(v26) --[[ Line: 314 ]] --[[ Name: source ]]
                        return v26;
                    end
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    modalVariant = function(v27) --[[ Line: 322 ]] --[[ Name: modalVariant ]]
                        return v27;
                    end, 
                    source = function(v28) --[[ Line: 325 ]] --[[ Name: source ]]
                        return v28;
                    end
                }
            }
        }
    } else nil, 
    [v6.TrustedFriendsVPCPrologueOpened] = if l_FFlagTCVerifiedParentalControl_0 then {
        description = "Trusted Friends VPC Prologue open button clicked in TC modal", 
        lastUpdated = {
            26, 
            2, 
            26
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 340 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCUpsellModal, 
                    btn = v7.OpenVPCPrologue
                }, 
                dynamicCustomFields = {
                    modalVariant = function(v29) --[[ Line: 348 ]] --[[ Name: modalVariant ]]
                        return v29;
                    end, 
                    source = function(v30) --[[ Line: 351 ]] --[[ Name: source ]]
                        return v30;
                    end
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    modalVariant = function(v31) --[[ Line: 359 ]] --[[ Name: modalVariant ]]
                        return v31;
                    end, 
                    source = function(v32) --[[ Line: 362 ]] --[[ Name: source ]]
                        return v32;
                    end
                }
            }
        }
    } else nil, 
    [v6.TrustedFriendsVPCAskClicked] = if l_FFlagTCVerifiedParentalControl_0 then {
        description = "Trusted Friends VPC Prologue Ask button clicked", 
        lastUpdated = {
            26, 
            2, 
            26
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 377 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TrustedFriendsVPCPrologue, 
                    btn = v7.Ask
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    } else nil, 
    [v6.TrustedFriendsVPCCancelClicked] = if l_FFlagTCVerifiedParentalControl_0 then {
        description = "Trusted Friends VPC Prologue Cancel button clicked", 
        lastUpdated = {
            26, 
            2, 
            26
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 398 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TrustedFriendsVPCPrologue, 
                    btn = v7.Cancel
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    } else nil, 
    [v6.TCEducationManageConnectionsClicked] = {
        description = "TC Education modal manage connections button clicked", 
        lastUpdated = {
            25, 
            6, 
            4
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 418 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCEducationModal, 
                    btn = v7.ManageConnections
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v6.TCStreamNotificationAcceptClicked] = if l_FFlagTCStreamNotifEventReceiver_0 then {
        description = "TC stream notification accept CTA clicked", 
        lastUpdated = {
            26, 
            1, 
            16
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 438 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.StreamNotification, 
                    btn = v7.AcceptTrustedConnection
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    } else nil, 
    [v6.TCToastNotificationAcceptClicked] = if l_FFlagTCNotifFixEventName_0 then {
        description = "TC toast notification accept CTA clicked", 
        lastUpdated = {
            26, 
            1, 
            16
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 459 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.ToastNotification, 
                    btn = v7.AcceptTrustedConnection
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    } else nil, 
    [v6.TCUpsellLearnMoreClicked] = if v12 then {
        description = "Learn more link clicked", 
        lastUpdated = {
            12, 
            3, 
            26
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 480 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.TCUpsellModal, 
                    btn = "LearnMoreLink"
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    } else nil
};