local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local _ = require(l_script_FirstAncestor_0.Enums.SquadExperienceInviteSource);
local v4 = require(l_script_FirstAncestor_0.Enums.SquadRootViewType);
local _ = require(script.Parent.SquadContractType);
local l_FFlagEnableSquadRegroupExperimentation_0 = require(l_Parent_0.SharedFlags).FFlagEnableSquadRegroupExperimentation;
return {
    closeSquadPrompt = function() --[[ Line: 16 ]] --[[ Name: closeSquadPrompt ]]

    end, 
    createConversation = function(_, _, _, _) --[[ Line: 19 ]] --[[ Name: createConversation ]]
        -- upvalues: v2 (copy)
        return function(_) --[[ Line: 25 ]]
            -- upvalues: v2 (ref)
            return v2.reject("No createConversation function supplied.");
        end;
    end, 
    createFriendConversation = function(_, _) --[[ Line: 29 ]] --[[ Name: createFriendConversation ]]

    end, 
    createExperienceInvite = l_FFlagEnableSquadRegroupExperimentation_0 and function(_, _, _) --[[ Line: 33 ]]
        -- upvalues: v2 (copy)
        return function(_) --[[ Line: 34 ]]
            -- upvalues: v2 (ref)
            return v2.reject("No createExperienceInvite function supplied.");
        end;
    end or nil, 
    fetchParentChannelDetails = function(_, _) --[[ Line: 39 ]] --[[ Name: fetchParentChannelDetails ]]
        return nil;
    end, 
    inviteToParentChannel = function(_, _, _) --[[ Line: 42 ]] --[[ Name: inviteToParentChannel ]]
        return function(_) --[[ Line: 43 ]]
            return nil;
        end;
    end, 
    navigateIntoSquadLobby = function(_, _) --[[ Line: 47 ]] --[[ Name: navigateIntoSquadLobby ]]

    end, 
    removeUserFromParentChannel = function(_, _, _) --[[ Line: 50 ]] --[[ Name: removeUserFromParentChannel ]]
        return function(_) --[[ Line: 51 ]]
            return nil;
        end;
    end, 
    setSquadPrompt = function(_, _) --[[ Line: 55 ]] --[[ Name: setSquadPrompt ]]

    end, 
    showSearchOverlay = function(_, _) --[[ Line: 58 ]] --[[ Name: showSearchOverlay ]]

    end, 
    useIsChatEnabled = function() --[[ Line: 61 ]] --[[ Name: useIsChatEnabled ]]
        return false;
    end, 
    useGetConversationFromId = function(_) --[[ Line: 64 ]] --[[ Name: useGetConversationFromId ]]
        return nil;
    end, 
    useParentChannelHasGroupUp = function(_) --[[ Line: 67 ]] --[[ Name: useParentChannelHasGroupUp ]]
        return false;
    end, 
    useParentChannelHasSquadAccess = function(_) --[[ Line: 70 ]] --[[ Name: useParentChannelHasSquadAccess ]]
        return false;
    end, 
    useParentChannelTitleSelector = function(_) --[[ Line: 73 ]] --[[ Name: useParentChannelTitleSelector ]]
        return "";
    end, 
    useParentChannelIsPartyVoiceEligible = function(_) --[[ Line: 76 ]] --[[ Name: useParentChannelIsPartyVoiceEligible ]]
        return nil;
    end, 
    useSquadRootView = function() --[[ Line: 79 ]] --[[ Name: useSquadRootView ]]
        -- upvalues: v4 (copy)
        return v4.None;
    end, 
    useSquadTopBannerManager = function() --[[ Line: 82 ]] --[[ Name: useSquadTopBannerManager ]]
        return {
            disableSquadTopBanner = function(_, _) --[[ Line: 84 ]] --[[ Name: disableSquadTopBanner ]]

            end, 
            useSquadTopBannerDisabled = function() --[[ Line: 85 ]] --[[ Name: useSquadTopBannerDisabled ]]
                return false;
            end
        };
    end, 
    useIsChatUserMessagesEnabled = function() --[[ Line: 90 ]] --[[ Name: useIsChatUserMessagesEnabled ]]
        return false;
    end
};