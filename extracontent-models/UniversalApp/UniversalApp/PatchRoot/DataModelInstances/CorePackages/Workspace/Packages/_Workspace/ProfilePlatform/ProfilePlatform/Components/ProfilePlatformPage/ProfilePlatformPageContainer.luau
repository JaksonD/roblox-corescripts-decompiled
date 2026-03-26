local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v3 = require(l_Parent_0.Navigation);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.RoactUtils);
local v6 = require(l_Parent_0.RobloxAppEnums);
local v7 = require(l_Parent_0.SharedFlags);
local v8 = require(l_Parent_0.SocialLuaAnalytics);
local v9 = require(l_Parent_0.SocialStopwatch);
local v10 = require(l_Parent_0.Cryo);
local v11 = require(l_script_FirstAncestor_0.Networking.checkQrSession);
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useEffectOnMount_0 = v5.Hooks.useEffectOnMount;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_dependencyArray_0 = v5.Hooks.dependencyArray;
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local l_ProfileRefreshSignal_0 = require(l_Parent_0.ProfilePlatformCommon).Signals.ProfileRefreshSignal;
local v18 = require(l_script_FirstAncestor_0.Components.ProfilePlatformPage.parseComponentsFromJson);
local v19 = require(l_script_FirstAncestor_0.Hooks.useAvailableComponents);
local v20 = require(l_script_FirstAncestor_0.Hooks.useProfileJson);
local v21 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v22 = require(script.Parent.ProfilePlatformEventReceiver);
local v23 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local v24 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v25 = require(l_script_FirstAncestor_0.Common.Enums);
local v26 = require(script.Parent.getFriendStatusFromProfileResponse);
local v27 = require(script.Parent.getIsTrustedConnectionsStatusFromProfileResponse);
local v28 = require(l_script_FirstAncestor_0.Networking.refreshProfilePlatformActionInfo);
local l_LoadingStages_0 = v8.Analytics.Enums.LoadingStages;
local v30 = require(l_script_FirstAncestor_0.Analytics.LoadingStagesExtension);
local v31 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableVR);
local v32 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableLazyLoadingComponents);
local l_FFlagProfilePlatformTrustedConnectionsMVP_0 = v7.FFlagProfilePlatformTrustedConnectionsMVP;
local v34 = game:DefineFastString("SocialProfilePeekViewLayer", "Social.ProfilePeekView");
local v35 = game:DefineFastString("SocialProfilePeekViewSecondaryLayer", "Social.ProfilePeekView.Secondary");
local v36 = game:DefineFastString("SocialSelfProfileViewLayer", "Social.SelfProfileView");
local l_IXPService_0 = game:GetService("IXPService");
local v38 = game:DefineFastFlag("EnableSocialProfilePeekViewExposureEvents", false);
local v39 = game:DefineFastFlag("ProfilePlatformEnableRefreshSignal", false);
local v40 = game:DefineFastFlag("ProfilePlatformEnableSessionization", false);
local v41 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformFixAnalyticsPrimaryAction);
local v42 = if v40 then game:GetService("SessionService") else nil;
local v43 = if v40 then require(l_Parent_0.RobloxAppSessionization).SessionType else nil;
local l_FFlagPPVBackgroundPrefetchAvatar_0 = v7.FFlagPPVBackgroundPrefetchAvatar;
local v45 = if l_FFlagPPVBackgroundPrefetchAvatar_0 then require(l_Parent_0.EditProfileBackground).AvatarModelPrefetch else nil;
local v46 = require(script.Parent.ProfilePlatformPage);
local v47 = require(l_script_FirstAncestor_0.Networking.getProfilePlatform);
return function() --[[ Line: 68 ]]
    -- upvalues: v4 (copy), v21 (copy), v23 (copy), l_useLocalUserId_0 (copy), l_useDispatch_0 (copy), l_FFlagProfilePlatformTrustedConnectionsMVP_0 (copy), v3 (copy), v20 (copy), v19 (copy), v9 (copy), v24 (copy), l_LoadingStages_0 (copy), v47 (copy), v32 (copy), v31 (copy), v41 (copy), v2 (copy), v25 (copy), v26 (copy), v27 (copy), v11 (copy), v6 (copy), v28 (copy), v30 (copy), l_FFlagPPVBackgroundPrefetchAvatar_0 (copy), l_useEffectOnMount_0 (copy), v45 (copy), v39 (copy), l_useSignalState_0 (copy), l_ProfileRefreshSignal_0 (copy), l_dependencyArray_0 (copy), v38 (copy), l_IXPService_0 (copy), v34 (copy), v35 (copy), v36 (copy), v40 (copy), v42 (copy), v43 (copy), v10 (copy), v18 (copy), v22 (copy), v46 (copy)
    local v48, v49 = v4.useState(true);
    local v50 = v21();
    local v51 = v23();
    local l_profileId_0 = v50.profileId;
    local l_profileType_0 = v50.profileType;
    local v54 = l_useLocalUserId_0();
    local v55 = tostring(l_profileId_0) == tostring(v54);
    local v56 = l_useDispatch_0();
    local v57 = if l_FFlagProfilePlatformTrustedConnectionsMVP_0 then v3.useNavigation() else nil;
    local v58 = v20();
    local v59 = v19();
    local v60 = v4.useRef(0);
    local function v70(v61) --[[ Line: 89 ]]
        -- upvalues: v9 (ref), v51 (copy), v24 (ref), l_LoadingStages_0 (ref), v56 (copy), v47 (ref), l_profileId_0 (copy), l_profileType_0 (copy), v59 (copy), v32 (ref), v49 (copy), v31 (ref), v41 (ref), v2 (ref), v25 (ref), l_FFlagProfilePlatformTrustedConnectionsMVP_0 (ref), v26 (ref), v27 (ref), v50 (copy), v11 (ref), v57 (copy), v6 (ref), v28 (ref), v30 (ref)
        local v62 = v9.Stopwatch.get(v9.Events.ProfileOpened);
        v51.fireAnalyticsEvent(v24.ProfileLoadingStage, {
            statValue = if v62 then v62.timeElapsed else nil, 
            status = l_LoadingStages_0.Fetching, 
            isProfilePlatform = true
        });
        v56(v47.API({
            profileId = l_profileId_0, 
            profileType = l_profileType_0, 
            components = v59, 
            includeComponentOrdering = true, 
            onlyEssentialComponents = v32 and true or nil
        })):andThen(function(v63) --[[ Line: 105 ]]
            -- upvalues: v32 (ref), v49 (ref), v31 (ref), v61 (copy), v51 (ref), v24 (ref), v41 (ref), v2 (ref), v25 (ref), l_FFlagProfilePlatformTrustedConnectionsMVP_0 (ref), v26 (ref), v27 (ref), v50 (ref), v56 (ref), v11 (ref), l_profileId_0 (ref), v57 (ref), v6 (ref), v28 (ref)
            if v32 then
                v49(false);
            end;
            if v31 and v61 > 1 then
                v51.fireAnalyticsEvent(v24.ProfilePlatformPageReloaded, {
                    reloadCount = v61
                });
                return;
            else
                local v64 = nil;
                if v41 then
                    local v65 = v2(v63, (("responseBody.components.%*.buttons"):format(v25.Components.Actions)));
                    v64 = if v65 and v65[1] then v65[1].type else nil;
                else
                    v64 = v2(v63, (("responseBody.components.%*.primary"):format(v25.Components.Actions)));
                end;
                if l_FFlagProfilePlatformTrustedConnectionsMVP_0 and v26(v63) == v25.FriendStatus.Friends and not v27(v63) and v50.sourceInfo.source == v25.Sources.QrCode then
                    v56(v11.API(l_profileId_0)):andThen(function(v66) --[[ Line: 132 ]]
                        -- upvalues: v57 (ref), v6 (ref), l_profileId_0 (ref), v56 (ref), v28 (ref)
                        if v66.responseBody == true then
                            v57.push(v6.AppPage.TrustedContactsModal, {
                                userId = l_profileId_0, 
                                sentFromQrCode = true, 
                                onRequestSent = function() --[[ Line: 137 ]] --[[ Name: onRequestSent ]]
                                    -- upvalues: v56 (ref), v28 (ref), l_profileId_0 (ref)
                                    return v56(v28(l_profileId_0));
                                end
                            });
                        end;
                    end);
                end;
                v51.fireAnalyticsEvent(v24.ProfilePageLoadedWithData, {
                    friendStatus = v26(v63), 
                    absolutePosition = v50.sourceInfo.homepageCarouselAbsolutePosition, 
                    isHomePageCarousel = v50.sourceInfo.source == v25.Sources.HomepageFriendsCarousel, 
                    source = v50.sourceInfo.source, 
                    isRecommendation = v50.sourceInfo.isRecommendation, 
                    v50.sourceInfo.recommendationContextType, 
                    recommendationRank = v50.sourceInfo.recommendationRank, 
                    recommendationSessionId = v50.sourceInfo.recommendationSessionId, 
                    shareLinkId = v50.sourceInfo.shareLinkId, 
                    primaryAction = v64
                });
                return;
            end;
        end):catch(function(_) --[[ Line: 160 ]]
            -- upvalues: v51 (ref), v24 (ref), v62 (copy), l_LoadingStages_0 (ref)
            v51.fireAnalyticsEvent(v24.ProfileLoadingStage, {
                statValue = if v62 then v62.timeElapsed else nil, 
                status = l_LoadingStages_0.Failed, 
                isProfilePlatform = true
            });
        end);
        if v32 then
            v56(v47.API({
                profileId = l_profileId_0, 
                profileType = l_profileType_0, 
                components = v59, 
                includeComponentOrdering = true, 
                onlyEssentialComponents = false
            })):andThen(function(_) --[[ Line: 176 ]]
                -- upvalues: v51 (ref), v24 (ref), v62 (copy), v30 (ref)
                v51.fireAnalyticsEvent(v24.ProfileLoadingStage, {
                    statValue = if v62 then v62.timeElapsed else nil, 
                    status = v30.LazyLoaded, 
                    isProfilePlatform = true
                });
            end):catch(function(_) --[[ Line: 183 ]]
                -- upvalues: v51 (ref), v24 (ref), v62 (copy), l_LoadingStages_0 (ref)
                v51.fireAnalyticsEvent(v24.ProfileLoadingStage, {
                    statValue = if v62 then v62.timeElapsed else nil, 
                    status = l_LoadingStages_0.Failed, 
                    isProfilePlatform = true
                });
            end);
        end;
    end;
    if l_FFlagPPVBackgroundPrefetchAvatar_0 then
        l_useEffectOnMount_0(function() --[[ Line: 194 ]]
            -- upvalues: l_profileType_0 (copy), v25 (ref), l_profileId_0 (copy), v45 (ref)
            if l_profileType_0 ~= v25.ProfileTypes.User then
                return;
            else
                local v71 = tonumber(l_profileId_0);
                if v71 then
                    v45.prefetch(v71);
                end;
                return;
            end;
        end);
    end;
    if v39 then
        local v72 = l_useSignalState_0(l_ProfileRefreshSignal_0.getProfileRefreshSignal);
        local v73 = v4.useRef(0);
        local l_v72_0 = v72 --[[ copy: 14 -> 16 ]];
        v4.useEffect(function() --[[ Line: 209 ]]
            -- upvalues: v55 (copy), l_v72_0 (copy), v73 (copy), v70 (copy)
            if v55 and l_v72_0 > v73.current then
                v73.current = l_v72_0;
                v70();
            end;
        end, l_dependencyArray_0(v72, v55, l_profileId_0, v70));
    end;
    if v31 then
        v4.useEffect(function() --[[ Line: 218 ]]
            -- upvalues: v60 (copy), v70 (copy)
            local v75 = v60.current + 1;
            v60.current = v75;
            v70(v75);
        end, {
            v59
        });
    else
        l_useEffectOnMount_0(function() --[[ Line: 224 ]]
            -- upvalues: v70 (copy)
            v70();
        end);
    end;
    v4.useEffect(function() --[[ Line: 229 ]]
        -- upvalues: v9 (ref), v51 (copy), v24 (ref)
        return function() --[[ Line: 230 ]]
            -- upvalues: v9 (ref), v51 (ref), v24 (ref)
            v9.Stopwatch.stop(v9.Events.ProfileOpened);
            v51.fireAnalyticsEvent(v24.ProfileClosed);
        end;
    end, {});
    if v38 then
        l_useEffectOnMount_0(function() --[[ Line: 238 ]]
            -- upvalues: l_IXPService_0 (ref), v34 (ref), v35 (ref), v55 (copy), v36 (ref)
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v34);
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v35);
            if v55 then
                l_IXPService_0:LogFlagLinkedUserLayerExposure(v36);
            end;
        end);
    end;
    if v40 then
        v4.useEffect(function() --[[ Line: 248 ]]
            -- upvalues: v42 (ref), v43 (ref), v50 (copy)
            local v76 = nil;
            if v42:SessionExists(v43.StructuralIdentifier.ProfilePlatformPage) then
                v76 = v42:GetMetadata(v43.StructuralIdentifier.ProfilePlatformPage, v43.Metadata.ProfilePlatformPage.ProfileSessionId);
            else
                v42:SetSession(v43.StructuralIdentifier.Level2a, v43.StructuralIdentifier.ProfilePlatformPage, v43.StructuralIdentifier.ProfilePlatformPage);
            end;
            v42:SetMetadata(v43.StructuralIdentifier.ProfilePlatformPage, v43.Metadata.ProfilePlatformPage.ProfileSessionId, v50.profileSessionId);
            return function() --[[ Line: 268 ]]
                -- upvalues: v76 (ref), v42 (ref), v43 (ref)
                if v76 ~= nil then
                    v42:SetMetadata(v43.StructuralIdentifier.ProfilePlatformPage, v43.Metadata.ProfilePlatformPage.ProfileSessionId, v76);
                    return;
                else
                    v42:RemoveSession(v43.StructuralIdentifier.ProfilePlatformPage);
                    return;
                end;
            end;
        end, {});
    end;
    local v77 = v4.useMemo(function() --[[ Line: 283 ]]
        -- upvalues: v10 (ref), v18 (ref), v58 (copy), l_profileType_0 (copy), v4 (ref), v22 (ref)
        return v10.Dictionary.union(v18(v58.components, v58.componentOrdering, l_profileType_0), {
            ProfilePlatformEventReceiver = v4.createElement(v22)
        });
    end, l_dependencyArray_0(v58.components, v58.componentOrdering));
    return v4.createElement(v46, {
        children = if v32 and v48 then {} else v77
    });
end;