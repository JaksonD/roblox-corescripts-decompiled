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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function() --[[ Line: 70 ]]
    -- upvalues: v4 (copy), v21 (copy), v23 (copy), l_useLocalUserId_0 (copy), l_useDispatch_0 (copy), l_FFlagProfilePlatformTrustedConnectionsMVP_0 (copy), v3 (copy), v20 (copy), v19 (copy), v9 (copy), v24 (copy), l_LoadingStages_0 (copy), v47 (copy), v32 (copy), v31 (copy), v41 (copy), v2 (copy), v25 (copy), v26 (copy), v27 (copy), v11 (copy), v6 (copy), v28 (copy), v30 (copy), l_FFlagPPVBackgroundPrefetchAvatar_0 (copy), l_useEffectOnMount_0 (copy), v45 (copy), v39 (copy), l_useSignalState_0 (copy), l_ProfileRefreshSignal_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v38 (copy), l_IXPService_0 (copy), v34 (copy), v35 (copy), v36 (copy), v40 (copy), v42 (copy), v43 (copy), v10 (copy), v18 (copy), v22 (copy), v46 (copy)
    local v49, v50 = v4.useState(true);
    local v51 = v21();
    local v52 = v23();
    local l_profileId_0 = v51.profileId;
    local l_profileType_0 = v51.profileType;
    local v55 = l_useLocalUserId_0();
    local v56 = tostring(l_profileId_0) == tostring(v55);
    local v57 = l_useDispatch_0();
    local v58 = if l_FFlagProfilePlatformTrustedConnectionsMVP_0 then v3.useNavigation() else nil;
    local v59 = v20();
    local v60 = v19();
    local v61 = v4.useRef(0);
    local function v71(v62) --[[ Line: 91 ]]
        -- upvalues: v9 (ref), v52 (copy), v24 (ref), l_LoadingStages_0 (ref), v57 (copy), v47 (ref), l_profileId_0 (copy), l_profileType_0 (copy), v60 (copy), v32 (ref), v50 (copy), v31 (ref), v41 (ref), v2 (ref), v25 (ref), l_FFlagProfilePlatformTrustedConnectionsMVP_0 (ref), v26 (ref), v27 (ref), v51 (copy), v11 (ref), v58 (copy), v6 (ref), v28 (ref), v30 (ref)
        local v63 = v9.Stopwatch.get(v9.Events.ProfileOpened);
        v52.fireAnalyticsEvent(v24.ProfileLoadingStage, {
            statValue = if v63 then v63.timeElapsed else nil, 
            status = l_LoadingStages_0.Fetching, 
            isProfilePlatform = true
        });
        v57(v47.API({
            profileId = l_profileId_0, 
            profileType = l_profileType_0, 
            components = v60, 
            includeComponentOrdering = true, 
            onlyEssentialComponents = v32 and true or nil
        })):andThen(function(v64) --[[ Line: 107 ]]
            -- upvalues: v32 (ref), v50 (ref), v31 (ref), v62 (copy), v52 (ref), v24 (ref), v41 (ref), v2 (ref), v25 (ref), l_FFlagProfilePlatformTrustedConnectionsMVP_0 (ref), v26 (ref), v27 (ref), v51 (ref), v57 (ref), v11 (ref), l_profileId_0 (ref), v58 (ref), v6 (ref), v28 (ref)
            if v32 then
                v50(false);
            end;
            if v31 and v62 > 1 then
                v52.fireAnalyticsEvent(v24.ProfilePlatformPageReloaded, {
                    reloadCount = v62
                });
                return;
            else
                local v65 = nil;
                if v41 then
                    local v66 = v2(v64, (("responseBody.components.%*.buttons"):format(v25.Components.Actions)));
                    v65 = if v66 and v66[1] then v66[1].type else nil;
                else
                    v65 = v2(v64, (("responseBody.components.%*.primary"):format(v25.Components.Actions)));
                end;
                if l_FFlagProfilePlatformTrustedConnectionsMVP_0 and v26(v64) == v25.FriendStatus.Friends and not v27(v64) and v51.sourceInfo.source == v25.Sources.QrCode then
                    v57(v11.API(l_profileId_0)):andThen(function(v67) --[[ Line: 134 ]]
                        -- upvalues: v58 (ref), v6 (ref), l_profileId_0 (ref), v57 (ref), v28 (ref)
                        if v67.responseBody == true then
                            v58.push(v6.AppPage.TrustedContactsModal, {
                                userId = l_profileId_0, 
                                sentFromQrCode = true, 
                                onRequestSent = function() --[[ Line: 139 ]] --[[ Name: onRequestSent ]]
                                    -- upvalues: v57 (ref), v28 (ref), l_profileId_0 (ref)
                                    return v57(v28(l_profileId_0));
                                end
                            });
                        end;
                    end);
                end;
                v52.fireAnalyticsEvent(v24.ProfilePageLoadedWithData, {
                    friendStatus = v26(v64), 
                    absolutePosition = v51.sourceInfo.homepageCarouselAbsolutePosition, 
                    isHomePageCarousel = v51.sourceInfo.source == v25.Sources.HomepageFriendsCarousel, 
                    source = v51.sourceInfo.source, 
                    isRecommendation = v51.sourceInfo.isRecommendation, 
                    v51.sourceInfo.recommendationContextType, 
                    recommendationRank = v51.sourceInfo.recommendationRank, 
                    recommendationSessionId = v51.sourceInfo.recommendationSessionId, 
                    shareLinkId = v51.sourceInfo.shareLinkId, 
                    primaryAction = v65
                });
                return;
            end;
        end):catch(function(_) --[[ Line: 162 ]]
            -- upvalues: v52 (ref), v24 (ref), v63 (copy), l_LoadingStages_0 (ref)
            v52.fireAnalyticsEvent(v24.ProfileLoadingStage, {
                statValue = if v63 then v63.timeElapsed else nil, 
                status = l_LoadingStages_0.Failed, 
                isProfilePlatform = true
            });
        end);
        if v32 then
            v57(v47.API({
                profileId = l_profileId_0, 
                profileType = l_profileType_0, 
                components = v60, 
                includeComponentOrdering = true, 
                onlyEssentialComponents = false
            })):andThen(function(_) --[[ Line: 178 ]]
                -- upvalues: v52 (ref), v24 (ref), v63 (copy), v30 (ref)
                v52.fireAnalyticsEvent(v24.ProfileLoadingStage, {
                    statValue = if v63 then v63.timeElapsed else nil, 
                    status = v30.LazyLoaded, 
                    isProfilePlatform = true
                });
            end):catch(function(_) --[[ Line: 185 ]]
                -- upvalues: v52 (ref), v24 (ref), v63 (copy), l_LoadingStages_0 (ref)
                v52.fireAnalyticsEvent(v24.ProfileLoadingStage, {
                    statValue = if v63 then v63.timeElapsed else nil, 
                    status = l_LoadingStages_0.Failed, 
                    isProfilePlatform = true
                });
            end);
        end;
    end;
    if l_FFlagPPVBackgroundPrefetchAvatar_0 then
        l_useEffectOnMount_0(function() --[[ Line: 196 ]]
            -- upvalues: l_profileType_0 (copy), v25 (ref), l_profileId_0 (copy), v45 (ref)
            if l_profileType_0 ~= v25.ProfileTypes.User then
                return;
            else
                local v72 = tonumber(l_profileId_0);
                if v72 then
                    v45.prefetch(v72);
                end;
                return;
            end;
        end);
    end;
    if v39 then
        local v73 = l_useSignalState_0(l_ProfileRefreshSignal_0.getProfileRefreshSignal);
        local v74 = v4.useRef(0);
        local l_v73_0 = v73 --[[ copy: 14 -> 16 ]];
        v4.useEffect(function() --[[ Line: 212 ]]
            -- upvalues: v56 (copy), l_v73_0 (copy), v74 (copy), v71 (copy)
            if v56 and l_v73_0 > v74.current then
                v74.current = l_v73_0;
                v71();
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v73, 
            v56, 
            l_profileId_0, 
            v71
        } else l_dependencyArray_0(v73, v56, l_profileId_0, v71));
    end;
    if v31 then
        v4.useEffect(function() --[[ Line: 225 ]]
            -- upvalues: v61 (copy), v71 (copy)
            local v76 = v61.current + 1;
            v61.current = v76;
            v71(v76);
        end, {
            v60
        });
    else
        l_useEffectOnMount_0(function() --[[ Line: 231 ]]
            -- upvalues: v71 (copy)
            v71();
        end);
    end;
    v4.useEffect(function() --[[ Line: 236 ]]
        -- upvalues: v9 (ref), v52 (copy), v24 (ref)
        return function() --[[ Line: 237 ]]
            -- upvalues: v9 (ref), v52 (ref), v24 (ref)
            v9.Stopwatch.stop(v9.Events.ProfileOpened);
            v52.fireAnalyticsEvent(v24.ProfileClosed);
        end;
    end, {});
    if v38 then
        l_useEffectOnMount_0(function() --[[ Line: 245 ]]
            -- upvalues: l_IXPService_0 (ref), v34 (ref), v35 (ref), v56 (copy), v36 (ref)
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v34);
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v35);
            if v56 then
                l_IXPService_0:LogFlagLinkedUserLayerExposure(v36);
            end;
        end);
    end;
    if v40 then
        v4.useEffect(function() --[[ Line: 255 ]]
            -- upvalues: v42 (ref), v43 (ref), v51 (copy)
            local v77 = nil;
            if v42:SessionExists(v43.StructuralIdentifier.ProfilePlatformPage) then
                v77 = v42:GetMetadata(v43.StructuralIdentifier.ProfilePlatformPage, v43.Metadata.ProfilePlatformPage.ProfileSessionId);
            else
                v42:SetSession(v43.StructuralIdentifier.Level2a, v43.StructuralIdentifier.ProfilePlatformPage, v43.StructuralIdentifier.ProfilePlatformPage);
            end;
            v42:SetMetadata(v43.StructuralIdentifier.ProfilePlatformPage, v43.Metadata.ProfilePlatformPage.ProfileSessionId, v51.profileSessionId);
            return function() --[[ Line: 275 ]]
                -- upvalues: v77 (ref), v42 (ref), v43 (ref)
                if v77 ~= nil then
                    v42:SetMetadata(v43.StructuralIdentifier.ProfilePlatformPage, v43.Metadata.ProfilePlatformPage.ProfileSessionId, v77);
                    return;
                else
                    v42:RemoveSession(v43.StructuralIdentifier.ProfilePlatformPage);
                    return;
                end;
            end;
        end, {});
    end;
    local v78 = v4.useMemo(function() --[[ Line: 291 ]]
        -- upvalues: v10 (ref), v18 (ref), v59 (copy), l_profileType_0 (copy), v4 (ref), v22 (ref)
        return v10.Dictionary.union(v18(v59.components, v59.componentOrdering, l_profileType_0), {
            ProfilePlatformEventReceiver = v4.createElement(v22)
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v59.components, 
        v59.componentOrdering
    } else l_dependencyArray_0(v59.components, v59.componentOrdering));
    return v4.createElement(v46, {
        children = if v32 and v49 then {} else v78
    });
end;