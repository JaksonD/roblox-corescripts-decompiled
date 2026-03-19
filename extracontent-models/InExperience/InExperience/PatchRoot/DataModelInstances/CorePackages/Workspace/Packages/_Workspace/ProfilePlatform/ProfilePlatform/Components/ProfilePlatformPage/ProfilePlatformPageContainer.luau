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
local l_isPresenceInGame_0 = require(l_Parent_0.SocialCommon).Utils.isPresenceInGame;
local l_LoadingStages_0 = v8.Analytics.Enums.LoadingStages;
local v31 = require(l_script_FirstAncestor_0.Analytics.LoadingStagesExtension);
local v32 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableVR);
local v33 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformImproveLoadingPage);
local v34 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableLazyLoadingComponents);
local l_FFlagProfilePlatformTrustedConnectionsMVP_0 = v7.FFlagProfilePlatformTrustedConnectionsMVP;
local l_FFlagSocialCarouselRemoveJoinGameCard_0 = v7.FFlagSocialCarouselRemoveJoinGameCard;
local v37 = game:DefineFastString("SocialProfilePeekViewLayer", "Social.ProfilePeekView");
local v38 = game:DefineFastString("SocialProfilePeekViewSecondaryLayer", "Social.ProfilePeekView.Secondary");
local v39 = game:DefineFastString("SocialSelfProfileViewLayer", "Social.SelfProfileView");
local l_IXPService_0 = game:GetService("IXPService");
local v41 = game:DefineFastFlag("EnableSocialProfilePeekViewExposureEvents", false);
local v42 = game:DefineFastFlag("ProfilePlatformEnableRefreshSignal", false);
local v43 = game:DefineFastFlag("ProfilePlatformEnableSessionization", false);
local v44 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformFixAnalyticsPrimaryAction);
local v45 = if v43 then game:GetService("SessionService") else nil;
local v46 = if v43 then require(l_Parent_0.RobloxAppSessionization).SessionType else nil;
local v47 = require(script.Parent.ProfilePlatformPage);
local v48 = require(script.Parent.ProfilePlatformLoadingPage);
local v49 = require(l_script_FirstAncestor_0.Networking.getProfilePlatform);
return function() --[[ Line: 68 ]]
    -- upvalues: v4 (copy), v21 (copy), v23 (copy), l_useLocalUserId_0 (copy), l_useDispatch_0 (copy), l_FFlagProfilePlatformTrustedConnectionsMVP_0 (copy), v3 (copy), v20 (copy), v33 (copy), v19 (copy), v9 (copy), v24 (copy), l_LoadingStages_0 (copy), v49 (copy), v34 (copy), l_FFlagSocialCarouselRemoveJoinGameCard_0 (copy), v32 (copy), v44 (copy), v2 (copy), v25 (copy), v26 (copy), v27 (copy), v11 (copy), v6 (copy), v28 (copy), v31 (copy), v42 (copy), l_useSignalState_0 (copy), l_ProfileRefreshSignal_0 (copy), l_dependencyArray_0 (copy), l_useEffectOnMount_0 (copy), v41 (copy), l_IXPService_0 (copy), v37 (copy), v38 (copy), v39 (copy), v43 (copy), v45 (copy), v46 (copy), v10 (copy), v18 (copy), v22 (copy), l_isPresenceInGame_0 (copy), v48 (copy), v47 (copy)
    local v50, v51 = v4.useState(true);
    local v52 = v21();
    local v53 = v23();
    local l_profileId_0 = v52.profileId;
    local l_profileType_0 = v52.profileType;
    local v56 = l_useLocalUserId_0();
    local v57 = tostring(l_profileId_0) == tostring(v56);
    local v58 = l_useDispatch_0();
    local v59 = if l_FFlagProfilePlatformTrustedConnectionsMVP_0 then v3.useNavigation() else nil;
    local v60 = v20();
    local v61 = if v33 then next(v60) == nil else nil;
    local v62 = v19();
    local v63 = v4.useRef(0);
    local function v73(v64) --[[ Line: 92 ]]
        -- upvalues: v9 (ref), v53 (copy), v24 (ref), l_LoadingStages_0 (ref), v58 (copy), v49 (ref), l_profileId_0 (copy), l_profileType_0 (copy), v62 (copy), v34 (ref), l_FFlagSocialCarouselRemoveJoinGameCard_0 (ref), v51 (copy), v32 (ref), v44 (ref), v2 (ref), v25 (ref), l_FFlagProfilePlatformTrustedConnectionsMVP_0 (ref), v26 (ref), v27 (ref), v52 (copy), v11 (ref), v59 (copy), v6 (ref), v28 (ref), v31 (ref)
        local v65 = v9.Stopwatch.get(v9.Events.ProfileOpened);
        v53.fireAnalyticsEvent(v24.ProfileLoadingStage, {
            statValue = if v65 then v65.timeElapsed else nil, 
            status = l_LoadingStages_0.Fetching, 
            isProfilePlatform = true
        });
        v58(v49.API({
            profileId = l_profileId_0, 
            profileType = l_profileType_0, 
            components = v62, 
            includeComponentOrdering = true, 
            onlyEssentialComponents = v34 and true or nil
        })):andThen(function(v66) --[[ Line: 108 ]]
            -- upvalues: l_FFlagSocialCarouselRemoveJoinGameCard_0 (ref), v34 (ref), v51 (ref), v32 (ref), v64 (copy), v53 (ref), v24 (ref), v44 (ref), v2 (ref), v25 (ref), l_FFlagProfilePlatformTrustedConnectionsMVP_0 (ref), v26 (ref), v27 (ref), v52 (ref), v58 (ref), v11 (ref), l_profileId_0 (ref), v59 (ref), v6 (ref), v28 (ref)
            if l_FFlagSocialCarouselRemoveJoinGameCard_0 or v34 then
                v51(false);
            end;
            if v32 and v64 > 1 then
                v53.fireAnalyticsEvent(v24.ProfilePlatformPageReloaded, {
                    reloadCount = v64
                });
                return;
            else
                local v67 = nil;
                if v44 then
                    local v68 = v2(v66, (("responseBody.components.%*.buttons"):format(v25.Components.Actions)));
                    v67 = if v68 and v68[1] then v68[1].type else nil;
                else
                    v67 = v2(v66, (("responseBody.components.%*.primary"):format(v25.Components.Actions)));
                end;
                if l_FFlagProfilePlatformTrustedConnectionsMVP_0 and v26(v66) == v25.FriendStatus.Friends and not v27(v66) and v52.sourceInfo.source == v25.Sources.QrCode then
                    v58(v11.API(l_profileId_0)):andThen(function(v69) --[[ Line: 135 ]]
                        -- upvalues: v59 (ref), v6 (ref), l_profileId_0 (ref), v58 (ref), v28 (ref)
                        if v69.responseBody == true then
                            v59.push(v6.AppPage.TrustedContactsModal, {
                                userId = l_profileId_0, 
                                sentFromQrCode = true, 
                                onRequestSent = function() --[[ Line: 140 ]] --[[ Name: onRequestSent ]]
                                    -- upvalues: v58 (ref), v28 (ref), l_profileId_0 (ref)
                                    return v58(v28(l_profileId_0));
                                end
                            });
                        end;
                    end);
                end;
                v53.fireAnalyticsEvent(v24.ProfilePageLoadedWithData, {
                    friendStatus = v26(v66), 
                    absolutePosition = v52.sourceInfo.homepageCarouselAbsolutePosition, 
                    isHomePageCarousel = v52.sourceInfo.source == v25.Sources.HomepageFriendsCarousel, 
                    source = v52.sourceInfo.source, 
                    isRecommendation = v52.sourceInfo.isRecommendation, 
                    v52.sourceInfo.recommendationContextType, 
                    recommendationRank = v52.sourceInfo.recommendationRank, 
                    recommendationSessionId = v52.sourceInfo.recommendationSessionId, 
                    shareLinkId = v52.sourceInfo.shareLinkId, 
                    primaryAction = v67
                });
                return;
            end;
        end):catch(function(_) --[[ Line: 163 ]]
            -- upvalues: v53 (ref), v24 (ref), v65 (copy), l_LoadingStages_0 (ref)
            v53.fireAnalyticsEvent(v24.ProfileLoadingStage, {
                statValue = if v65 then v65.timeElapsed else nil, 
                status = l_LoadingStages_0.Failed, 
                isProfilePlatform = true
            });
        end);
        if v34 then
            v58(v49.API({
                profileId = l_profileId_0, 
                profileType = l_profileType_0, 
                components = v62, 
                includeComponentOrdering = true, 
                onlyEssentialComponents = false
            })):andThen(function(_) --[[ Line: 179 ]]
                -- upvalues: v53 (ref), v24 (ref), v65 (copy), v31 (ref)
                v53.fireAnalyticsEvent(v24.ProfileLoadingStage, {
                    statValue = if v65 then v65.timeElapsed else nil, 
                    status = v31.LazyLoaded, 
                    isProfilePlatform = true
                });
            end):catch(function(_) --[[ Line: 186 ]]
                -- upvalues: v53 (ref), v24 (ref), v65 (copy), l_LoadingStages_0 (ref)
                v53.fireAnalyticsEvent(v24.ProfileLoadingStage, {
                    statValue = if v65 then v65.timeElapsed else nil, 
                    status = l_LoadingStages_0.Failed, 
                    isProfilePlatform = true
                });
            end);
        end;
    end;
    if v42 then
        local v74 = l_useSignalState_0(l_ProfileRefreshSignal_0.getProfileRefreshSignal);
        local v75 = v4.useRef(0);
        local l_v74_0 = v74 --[[ copy: 15 -> 17 ]];
        v4.useEffect(function() --[[ Line: 200 ]]
            -- upvalues: v57 (copy), l_v74_0 (copy), v75 (copy), v73 (copy)
            if v57 and l_v74_0 > v75.current then
                v75.current = l_v74_0;
                v73();
            end;
        end, l_dependencyArray_0(v74, v57, l_profileId_0, v73));
    end;
    if v32 then
        v4.useEffect(function() --[[ Line: 209 ]]
            -- upvalues: v63 (copy), v73 (copy)
            local v77 = v63.current + 1;
            v63.current = v77;
            v73(v77);
        end, {
            v62
        });
    else
        l_useEffectOnMount_0(function() --[[ Line: 215 ]]
            -- upvalues: v73 (copy)
            v73();
        end);
    end;
    v4.useEffect(function() --[[ Line: 220 ]]
        -- upvalues: v9 (ref), v53 (copy), v24 (ref)
        return function() --[[ Line: 221 ]]
            -- upvalues: v9 (ref), v53 (ref), v24 (ref)
            v9.Stopwatch.stop(v9.Events.ProfileOpened);
            v53.fireAnalyticsEvent(v24.ProfileClosed);
        end;
    end, {});
    if v41 then
        l_useEffectOnMount_0(function() --[[ Line: 229 ]]
            -- upvalues: l_IXPService_0 (ref), v37 (ref), v38 (ref), v57 (copy), v39 (ref)
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v37);
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v38);
            if v57 then
                l_IXPService_0:LogFlagLinkedUserLayerExposure(v39);
            end;
        end);
    end;
    if v43 then
        v4.useEffect(function() --[[ Line: 239 ]]
            -- upvalues: v45 (ref), v46 (ref), v52 (copy)
            local v78 = nil;
            if v45:SessionExists(v46.StructuralIdentifier.ProfilePlatformPage) then
                v78 = v45:GetMetadata(v46.StructuralIdentifier.ProfilePlatformPage, v46.Metadata.ProfilePlatformPage.ProfileSessionId);
            else
                v45:SetSession(v46.StructuralIdentifier.Level2a, v46.StructuralIdentifier.ProfilePlatformPage, v46.StructuralIdentifier.ProfilePlatformPage);
            end;
            v45:SetMetadata(v46.StructuralIdentifier.ProfilePlatformPage, v46.Metadata.ProfilePlatformPage.ProfileSessionId, v52.profileSessionId);
            return function() --[[ Line: 259 ]]
                -- upvalues: v78 (ref), v45 (ref), v46 (ref)
                if v78 ~= nil then
                    v45:SetMetadata(v46.StructuralIdentifier.ProfilePlatformPage, v46.Metadata.ProfilePlatformPage.ProfileSessionId, v78);
                    return;
                else
                    v45:RemoveSession(v46.StructuralIdentifier.ProfilePlatformPage);
                    return;
                end;
            end;
        end, {});
    end;
    local v79 = v4.useMemo(function() --[[ Line: 274 ]]
        -- upvalues: v10 (ref), v18 (ref), v60 (copy), l_profileType_0 (copy), v4 (ref), v22 (ref)
        return v10.Dictionary.union(v18(v60.components, v60.componentOrdering, l_profileType_0), {
            ProfilePlatformEventReceiver = v4.createElement(v22)
        });
    end, l_dependencyArray_0(v60.components, v60.componentOrdering));
    if l_FFlagSocialCarouselRemoveJoinGameCard_0 and l_profileType_0 == v25.ProfileTypes.User and v50 and l_isPresenceInGame_0(v52.initialPresence) and (not v33 or v61) then
        return v4.createElement(v48);
    else
        return v4.createElement(v47, {
            children = if v34 and v50 then {} else v79
        });
    end;
end;