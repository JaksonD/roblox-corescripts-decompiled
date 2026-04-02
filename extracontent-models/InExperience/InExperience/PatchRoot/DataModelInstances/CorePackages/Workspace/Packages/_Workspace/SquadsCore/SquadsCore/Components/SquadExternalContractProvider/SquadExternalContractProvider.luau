local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(script.Parent.SquadExternalContractContext);
local _ = require(script.Parent.SquadContractType);
local v4 = require(script.Parent.SquadViewFlags);
local v5 = require(l_script_FirstAncestor_0.Analytics);
local _ = require(l_script_FirstAncestor_0.Enums.SquadLocationEnum);
local _ = require(l_script_FirstAncestor_0.Enums.SquadExperienceInviteSource);
local l_useCurrentSquadId_0 = require(l_script_FirstAncestor_0.Hooks).useCurrentSquadId;
local v9 = require(l_Parent_0.Cryo);
local v10 = require(l_Parent_0.React);
local v11 = require(l_Parent_0.RoactUtils);
local v12 = require(l_Parent_0.SharedFlags);
local l_dependencyArray_0 = v11.Hooks.dependencyArray;
local l_FFlagEnableSquadTopBannerWideMode_0 = v12.FFlagEnableSquadTopBannerWideMode;
local l_FFlagEnableSquadCoplayAnalytic_0 = v12.FFlagEnableSquadCoplayAnalytic;
local l_FFlagEnableSquadRegroupExperimentation_0 = v12.FFlagEnableSquadRegroupExperimentation;
local l_FFlagRemoveDependencyArrayAntipattern_0 = v12.FFlagRemoveDependencyArrayAntipattern;
return function(v18) --[[ Line: 35 ]]
    -- upvalues: v10 (copy), v4 (copy), l_FFlagEnableSquadTopBannerWideMode_0 (copy), v5 (copy), l_useCurrentSquadId_0 (copy), v9 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_FFlagEnableSquadCoplayAnalytic_0 (copy), l_FFlagEnableSquadRegroupExperimentation_0 (copy), v2 (copy)
    local v19, v20 = v10.useState(v4.None);
    local v23 = if l_FFlagEnableSquadTopBannerWideMode_0 then v18.contract.useSquadTopBannerManager() else v10.useMemo(function() --[[ Line: 40 ]]
        return {
            disableSquadTopBanner = function(_, _) --[[ Line: 42 ]] --[[ Name: disableSquadTopBanner ]]

            end, 
            useSquadTopBannerDisabled = function() --[[ Line: 43 ]] --[[ Name: useSquadTopBannerDisabled ]]
                return false;
            end
        };
    end, {});
    local v24 = v10.useMemo(v5.Analytics, {});
    local v25 = l_useCurrentSquadId_0();
    local v28 = v10.useCallback(function(v26, v27) --[[ Line: 52 ]]
        -- upvalues: v9 (ref), v25 (copy), v18 (copy), v24 (copy)
        v27 = v9.Dictionary.join(v27, {
            squadId = v25, 
            squadLocation = v18.squadLocation
        });
        v24.fireAnalyticsEvent(v26, v27);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v25, 
        v18.squadLocation
    } else l_dependencyArray_0(v25, v18.squadLocation));
    local v33 = {
        closeSquadPrompt = v18.contract.closeSquadPrompt, 
        createFriendConversation = v18.contract.createFriendConversation, 
        createConversation = v18.contract.createConversation, 
        disableSquadTopBanner = v23.disableSquadTopBanner, 
        fetchParentChannelDetails = v18.contract.fetchParentChannelDetails, 
        fireSquadAnalytics = v28, 
        inviteToParentChannel = v18.contract.inviteToParentChannel, 
        navigateIntoSquadLobby = v18.contract.navigateIntoSquadLobby, 
        removeUserFromParentChannel = v18.contract.removeUserFromParentChannel, 
        setSquadPrompt = v18.contract.setSquadPrompt, 
        showSearchOverlay = v18.contract.showSearchOverlay, 
        squadLocation = if l_FFlagEnableSquadCoplayAnalytic_0 then v18.squadLocation else nil, 
        updateSquadViewFlags = v10.useCallback(function(v29, v30) --[[ Line: 79 ]]
            -- upvalues: v20 (copy)
            if v30 then
                v20(function(v31) --[[ Line: 81 ]]
                    -- upvalues: v29 (copy)
                    return (bit32.bor(v31, v29));
                end);
                return;
            else
                v20(function(v32) --[[ Line: 85 ]]
                    -- upvalues: v29 (copy)
                    return (bit32.band(v32, (bit32.bnot(v29))));
                end);
                return;
            end;
        end, {}), 
        useGetConversationFromId = v18.contract.useGetConversationFromId, 
        useIsChatUserMessagesEnabled = v18.contract.useIsChatUserMessagesEnabled, 
        useParentChannelHasGroupUp = v18.contract.useParentChannelHasGroupUp, 
        useParentChannelHasSquadAccess = v18.contract.useParentChannelHasSquadAccess, 
        useParentChannelIsPartyVoiceEligible = v18.contract.useParentChannelIsPartyVoiceEligible, 
        useParentChannelTitleSelector = v18.contract.useParentChannelTitleSelector, 
        useSquadRootView = v18.contract.useSquadRootView, 
        useSquadTopBannerDisabled = v23.useSquadTopBannerDisabled, 
        useIsChatEnabled = v18.contract.useIsChatEnabled, 
        useIsLoadingChatSettings = v18.contract.useIsLoadingChatSettings, 
        useSquadViewFlags = v10.useCallback(function() --[[ Line: 100 ]]
            -- upvalues: v19 (copy)
            return v19;
        end, {
            v19
        }), 
        shouldShowOSAForConversation = v18.contract.shouldShowOSAForConversation, 
        showGroupOSADialog = v18.contract.showGroupOSADialog
    };
    if l_FFlagEnableSquadRegroupExperimentation_0 and v18.contract.createExperienceInvite then
        v33.createExperienceInvite = function(v34, v35) --[[ Line: 108 ]]
            -- upvalues: v18 (copy), v33 (copy)
            return v18.contract.createExperienceInvite(v34, v33, v35);
        end;
    end;
    return v10.createElement(v2.Provider, {
        value = v33
    }, v18.children);
end;