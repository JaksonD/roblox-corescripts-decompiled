local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_useEffectOnMount_0 = v3.Hooks.useEffectOnMount;
local l_getDeepValue_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
local v8 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local v9 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v10 = require(l_script_FirstAncestor_0.Common.Enums);
local l_HorizontalPageMargin_0 = require(l_Parent_0.UIBlox).App.Container.HorizontalPageMargin;
local v12 = require(l_script_FirstAncestor_0.Networking.NetworkingGames);
local v13 = require(script.Parent.ContextualGeneric);
local v14 = require(script.Parent.ContextualPresence);
local v15 = require(script.Parent.ContextualMutualFriends);
local v16 = require(script.Parent.ContextualPlayedTogether);
local v17 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnablePlayedTogetherContextFrequentExperienceName);
return function(v18) --[[ Line: 40 ]] --[[ Name: ContextualInformationContainer ]]
    -- upvalues: v9 (copy), v8 (copy), v10 (copy), v17 (copy), l_useDispatch_0 (copy), l_useEffectOnMount_0 (copy), v12 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), v2 (copy), v14 (copy), v15 (copy), v16 (copy), v13 (copy), l_HorizontalPageMargin_0 (copy)
    local l_sourceInfo_0 = v9().sourceInfo;
    local l_contextualInformation_0 = (v8(v10.Components.UserProfileHeader) or {}).contextualInformation;
    local l_context_0 = l_contextualInformation_0.context;
    local l_contextDetails_0 = l_contextualInformation_0.contextDetails;
    local v23 = if l_context_0 == v10.ContextualTypes.SentFromExperience then l_contextDetails_0[l_context_0].sourceUniverseId else if v17 and l_context_0 == v10.ContextualTypes.PlayedTogether then l_contextDetails_0[l_context_0].mostFrequentUniverseId else nil;
    local v24 = l_useDispatch_0();
    l_useEffectOnMount_0(function() --[[ Line: 59 ]]
        -- upvalues: l_context_0 (copy), v10 (ref), v17 (ref), v24 (copy), v12 (ref), v23 (copy)
        if l_context_0 == v10.ContextualTypes.SentFromExperience or v17 and l_context_0 == v10.ContextualTypes.PlayedTogether then
            v24(v12.GetExperiencesDetails.API({
                v23
            })):catch(function(_) --[[ Line: 67 ]]

            end);
        end;
    end);
    local v27 = l_useSelector_0(function(v26) --[[ Line: 71 ]]
        -- upvalues: l_getDeepValue_0 (ref), v23 (copy)
        return l_getDeepValue_0(v26, (("ProfilePlatform.Games.byGameId.%*.name"):format((tostring(v23))))) or "";
    end);
    local v28 = l_getDeepValue_0(l_sourceInfo_0, "contextualOverride.icon");
    local v29 = l_getDeepValue_0(l_sourceInfo_0, "contextualOverride.text");
    local v30 = nil;
    if l_context_0 == v10.ContextualTypes.Presence then
        v30 = v2.createElement(v14);
    elseif l_context_0 == v10.ContextualTypes.MutualFriends then
        local v31 = l_contextDetails_0[l_context_0];
        v30 = v2.createElement(v15, {
            mutualFriends = v31.mutualFriends, 
            mutualFriendsCount = v31.mutualFriendsCount
        });
    else
        v30 = if v17 and l_context_0 == v10.ContextualTypes.PlayedTogether then v2.createElement(v16, {
            experienceName = v27
        }) else v2.createElement(v13, {
            contextualType = l_context_0, 
            experienceName = v27, 
            iconOverride = v28, 
            textOverride = v29
        });
    end;
    return v2.createElement(l_HorizontalPageMargin_0, {
        size = v18.size, 
        layoutOrder = v18.layoutOrder, 
        useAutomaticSizing = true, 
        backgroundTransparency = 1
    }, {
        contextualInformation = v30
    });
end;