local l_script_FirstAncestor_0 = script:FindFirstAncestor("AddFriends");
local v1 = require(script.Parent.EventNames);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_SupportedTelemetryBackends_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends;
return {
    defaults = {
        throttlingThousandths = game:DefineFastInt("AddFriendsPageAnalyticsThrottlingThousandths", 1000), 
        links = ""
    }, 
    [v1.AddFriendsPageLoadingTime] = {
        description = "Add friends page requests and recommendation promise loading time", 
        lastUpdated = {
            24, 
            6, 
            7
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    status = function(v4) --[[ Line: 20 ]] --[[ Name: status ]]
                        return v4;
                    end
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryStat, 
                dynamicCustomFields = {
                    status = function(v5) --[[ Line: 28 ]] --[[ Name: status ]]
                        return v5;
                    end
                }
            }
        }
    }, 
    [v1.PlayerTileClick] = {
        description = "Add friends page clicks on user tiles", 
        lastUpdated = {
            24, 
            11, 
            13
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    namespace = function(v6) --[[ Line: 42 ]] --[[ Name: namespace ]]
                        return v6;
                    end, 
                    entityType = function(v7) --[[ Line: 45 ]] --[[ Name: entityType ]]
                        return v7;
                    end
                }
            }
        }
    }, 
    [v1.RequestFriendshipBtnClick] = {
        description = "Add friends page clicks on Request Friendship button on user tile", 
        lastUpdated = {
            24, 
            11, 
            13
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    namespace = function(v8) --[[ Line: 59 ]] --[[ Name: namespace ]]
                        return v8;
                    end, 
                    entityType = function(v9) --[[ Line: 62 ]] --[[ Name: entityType ]]
                        return v9;
                    end
                }
            }
        }
    }, 
    [v1.AcceptFriendshipBtnClick] = {
        description = "Add friends page clicks on Accept Friendship button on user tile", 
        lastUpdated = {
            24, 
            11, 
            13
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    namespace = function(v10) --[[ Line: 76 ]] --[[ Name: namespace ]]
                        return v10;
                    end, 
                    entityType = function(v11) --[[ Line: 79 ]] --[[ Name: entityType ]]
                        return v11;
                    end
                }
            }
        }
    }, 
    [v1.DeclineFriendshipBtnClick] = {
        description = "Add friends page clicks on Decline Friendship button on user tile", 
        lastUpdated = {
            24, 
            11, 
            13
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    namespace = function(v12) --[[ Line: 93 ]] --[[ Name: namespace ]]
                        return v12;
                    end, 
                    entityType = function(v13) --[[ Line: 96 ]] --[[ Name: entityType ]]
                        return v13;
                    end
                }
            }
        }
    }, 
    [v1.UserSearchClick] = {
        description = "Add friends page clicks on user search input", 
        lastUpdated = {
            24, 
            11, 
            13
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v1.CIBtnClick] = {
        description = "Add friends page clicks on contact importer banner", 
        lastUpdated = {
            24, 
            11, 
            13
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v1.QRCodeBtnClick] = {
        description = "Add friends page clicks on QRcode banner", 
        lastUpdated = {
            24, 
            11, 
            13
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v1.CIBtnImpression] = {
        description = "Add friends page impressions for contact importer banner", 
        lastUpdated = {
            24, 
            11, 
            13
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v1.QRCodeBtnImpression] = {
        description = "Add friends page impressions for QRcode banner", 
        lastUpdated = {
            24, 
            11, 
            13
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v1.ShowMoreBtnClick] = {
        description = "Add friends page clicks on Show More button", 
        lastUpdated = {
            24, 
            11, 
            13
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v1.IgnoreAllBtnClick] = {
        description = "Add friends page clicks on Ignore All button", 
        lastUpdated = {
            24, 
            11, 
            13
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v1.FriendingOSAEducationSubtitleImpression] = {
        description = "Friending OSA Education subtitle impression", 
        lastUpdated = {
            25, 
            6, 
            11
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v1.TrustedContactsEducationalBannerClick] = {
        description = "Trusted Contacts Educational Banner Click", 
        lastUpdated = {
            25, 
            6, 
            11
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v1.TrustedContactsEducationalBannerClose] = {
        description = "Trusted Contacts Educational Banner Close", 
        lastUpdated = {
            25, 
            6, 
            11
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v1.TrustedContactsEducationalBannerImpression] = {
        description = "Trusted Contacts Educational Banner Impression", 
        lastUpdated = {
            25, 
            6, 
            11
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }
};