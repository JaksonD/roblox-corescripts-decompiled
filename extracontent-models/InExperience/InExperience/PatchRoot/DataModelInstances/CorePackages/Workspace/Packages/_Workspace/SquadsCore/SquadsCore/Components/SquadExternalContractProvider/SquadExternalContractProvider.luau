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
return function(v17) --[[ Line: 33 ]]
    -- upvalues: v10 (copy), v4 (copy), l_FFlagEnableSquadTopBannerWideMode_0 (copy), v5 (copy), l_useCurrentSquadId_0 (copy), v9 (copy), l_dependencyArray_0 (copy), l_FFlagEnableSquadCoplayAnalytic_0 (copy), l_FFlagEnableSquadRegroupExperimentation_0 (copy), v2 (copy)
    local v18, v19 = v10.useState(v4.None);
    local v22 = if l_FFlagEnableSquadTopBannerWideMode_0 then v17.contract.useSquadTopBannerManager() else v10.useMemo(function() --[[ Line: 38 ]]
        return {
            disableSquadTopBanner = function(_, _) --[[ Line: 40 ]] --[[ Name: disableSquadTopBanner ]]

            end, 
            useSquadTopBannerDisabled = function() --[[ Line: 41 ]] --[[ Name: useSquadTopBannerDisabled ]]
                return false;
            end
        };
    end, {});
    local v23 = v10.useMemo(v5.Analytics, {});
    local v24 = l_useCurrentSquadId_0();
    local v27 = v10.useCallback(function(v25, v26) --[[ Line: 49 ]]
        -- upvalues: v9 (ref), v24 (copy), v17 (copy), v23 (copy)
        v26 = v9.Dictionary.join(v26, {
            squadId = v24, 
            squadLocation = v17.squadLocation
        });
        v23.fireAnalyticsEvent(v25, v26);
    end, l_dependencyArray_0(v24, v17.squadLocation));
    local v32 = {
        closeSquadPrompt = v17.contract.closeSquadPrompt, 
        createFriendConversation = v17.contract.createFriendConversation, 
        createConversation = v17.contract.createConversation, 
        disableSquadTopBanner = v22.disableSquadTopBanner, 
        fetchParentChannelDetails = v17.contract.fetchParentChannelDetails, 
        fireSquadAnalytics = v27, 
        inviteToParentChannel = v17.contract.inviteToParentChannel, 
        navigateIntoSquadLobby = v17.contract.navigateIntoSquadLobby, 
        removeUserFromParentChannel = v17.contract.removeUserFromParentChannel, 
        setSquadPrompt = v17.contract.setSquadPrompt, 
        showSearchOverlay = v17.contract.showSearchOverlay, 
        squadLocation = if l_FFlagEnableSquadCoplayAnalytic_0 then v17.squadLocation else nil, 
        updateSquadViewFlags = v10.useCallback(function(v28, v29) --[[ Line: 72 ]]
            -- upvalues: v19 (copy)
            if v29 then
                v19(function(v30) --[[ Line: 74 ]]
                    -- upvalues: v28 (copy)
                    return (bit32.bor(v30, v28));
                end);
                return;
            else
                v19(function(v31) --[[ Line: 78 ]]
                    -- upvalues: v28 (copy)
                    return (bit32.band(v31, (bit32.bnot(v28))));
                end);
                return;
            end;
        end, {}), 
        useGetConversationFromId = v17.contract.useGetConversationFromId, 
        useIsChatUserMessagesEnabled = v17.contract.useIsChatUserMessagesEnabled, 
        useParentChannelHasGroupUp = v17.contract.useParentChannelHasGroupUp, 
        useParentChannelHasSquadAccess = v17.contract.useParentChannelHasSquadAccess, 
        useParentChannelIsPartyVoiceEligible = v17.contract.useParentChannelIsPartyVoiceEligible, 
        useParentChannelTitleSelector = v17.contract.useParentChannelTitleSelector, 
        useSquadRootView = v17.contract.useSquadRootView, 
        useSquadTopBannerDisabled = v22.useSquadTopBannerDisabled, 
        useIsChatEnabled = v17.contract.useIsChatEnabled, 
        useIsLoadingChatSettings = v17.contract.useIsLoadingChatSettings, 
        useSquadViewFlags = v10.useCallback(function() --[[ Line: 93 ]]
            -- upvalues: v18 (copy)
            return v18;
        end, {
            v18
        }), 
        shouldShowOSAForConversation = v17.contract.shouldShowOSAForConversation, 
        showGroupOSADialog = v17.contract.showGroupOSADialog
    };
    if l_FFlagEnableSquadRegroupExperimentation_0 and v17.contract.createExperienceInvite then
        v32.createExperienceInvite = function(v33, v34) --[[ Line: 101 ]]
            -- upvalues: v17 (copy), v32 (copy)
            return v17.contract.createExperienceInvite(v33, v32, v34);
        end;
    end;
    return v10.createElement(v2.Provider, {
        value = v32
    }, v17.children);
end;