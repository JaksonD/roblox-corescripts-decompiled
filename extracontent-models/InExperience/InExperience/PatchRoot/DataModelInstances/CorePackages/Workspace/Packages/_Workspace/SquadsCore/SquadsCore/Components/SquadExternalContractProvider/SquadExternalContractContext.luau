local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Enums.SquadLocationEnum);
local v3 = require(l_script_FirstAncestor_0.Enums.SquadRootViewType);
local _ = require(l_Parent_0.LuauPolyfill);
local v5 = require(l_Parent_0.Promise);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.SharedFlags);
local _ = require(l_script_FirstAncestor_0.Enums.SquadExperienceInviteSource);
local l_FFlagEnableSquadCoplayAnalytic_0 = v7.FFlagEnableSquadCoplayAnalytic;
local l_FFlagEnableSquadRegroupExperimentation_0 = v7.FFlagEnableSquadRegroupExperimentation;
return (v6.createContext({
    closeSquadPrompt = function() --[[ Line: 57 ]] --[[ Name: closeSquadPrompt ]]

    end, 
    createConversation = function(_, _, _, _) --[[ Line: 58 ]] --[[ Name: createConversation ]]
        -- upvalues: v5 (copy)
        return function(_) --[[ Line: 64 ]]
            -- upvalues: v5 (ref)
            return v5.reject("No createConversation function supplied.");
        end;
    end, 
    createFriendConversation = function(_, _) --[[ Line: 68 ]] --[[ Name: createFriendConversation ]]

    end, 
    createExperienceInvite = l_FFlagEnableSquadRegroupExperimentation_0 and function(_, _) --[[ Line: 70 ]]
        -- upvalues: v5 (copy)
        return function(_) --[[ Line: 71 ]]
            -- upvalues: v5 (ref)
            return v5.reject("No createExperienceInvite function supplied.");
        end;
    end or nil, 
    disableSquadTopBanner = function(_, _) --[[ Line: 76 ]] --[[ Name: disableSquadTopBanner ]]

    end, 
    fetchParentChannelDetails = function(_, _) --[[ Line: 77 ]] --[[ Name: fetchParentChannelDetails ]]
        return nil;
    end, 
    fireSquadAnalytics = function(v25, v26) --[[ Line: 80 ]] --[[ Name: fireSquadAnalytics ]]
        return v25, v26;
    end, 
    inviteToParentChannel = function(_, _, _) --[[ Line: 83 ]] --[[ Name: inviteToParentChannel ]]
        return nil;
    end, 
    navigateIntoSquadLobby = function(_, _) --[[ Line: 86 ]] --[[ Name: navigateIntoSquadLobby ]]

    end, 
    removeUserFromParentChannel = function(_, _, _) --[[ Line: 87 ]] --[[ Name: removeUserFromParentChannel ]]
        return nil;
    end, 
    setSquadPrompt = function(_, _) --[[ Line: 90 ]] --[[ Name: setSquadPrompt ]]

    end, 
    showSearchOverlay = function(_, _) --[[ Line: 91 ]] --[[ Name: showSearchOverlay ]]

    end, 
    squadLocation = if l_FFlagEnableSquadCoplayAnalytic_0 then v2.Unknown else nil, 
    updateSquadViewFlags = function(_, _) --[[ Line: 93 ]] --[[ Name: updateSquadViewFlags ]]

    end, 
    useGetConversationFromId = function(_) --[[ Line: 94 ]] --[[ Name: useGetConversationFromId ]]
        return nil;
    end, 
    useIsChatEnabled = function() --[[ Line: 97 ]] --[[ Name: useIsChatEnabled ]]
        return false;
    end, 
    useIsLoadingChatSettings = function() --[[ Line: 100 ]] --[[ Name: useIsLoadingChatSettings ]]
        return false;
    end, 
    useParentChannelHasGroupUp = function(_) --[[ Line: 103 ]] --[[ Name: useParentChannelHasGroupUp ]]
        return false;
    end, 
    useParentChannelHasSquadAccess = function(_) --[[ Line: 106 ]] --[[ Name: useParentChannelHasSquadAccess ]]
        return false;
    end, 
    useParentChannelIsPartyVoiceEligible = function(_) --[[ Line: 109 ]] --[[ Name: useParentChannelIsPartyVoiceEligible ]]
        return nil;
    end, 
    useParentChannelTitleSelector = function(_) --[[ Line: 112 ]] --[[ Name: useParentChannelTitleSelector ]]
        return "";
    end, 
    useSquadRootView = function() --[[ Line: 115 ]] --[[ Name: useSquadRootView ]]
        -- upvalues: v3 (copy)
        return v3.None;
    end, 
    useSquadTopBannerDisabled = function() --[[ Line: 118 ]] --[[ Name: useSquadTopBannerDisabled ]]
        return false;
    end, 
    useSquadViewFlags = function() --[[ Line: 121 ]] --[[ Name: useSquadViewFlags ]]
        return 0;
    end, 
    shouldShowOSAForConversation = function() --[[ Line: 124 ]] --[[ Name: shouldShowOSAForConversation ]]
        return false;
    end
}));