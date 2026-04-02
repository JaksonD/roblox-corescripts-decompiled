local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.InputUi);
local v4 = require(l_Parent_0.RoactUtils);
local v5 = require(l_Parent_0.RobloxAppHooks);
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local l_useScreenSize_0 = v5.useScreenSize;
local l_useTopBarHeight_0 = v5.useTopBarHeight;
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local v10 = require(l_script_FirstAncestor_0.Components.ProfileTopBar);
local v11 = require(l_script_FirstAncestor_0.Hooks.useProfileFormFactor);
local v12 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v13 = require(l_script_FirstAncestor_0.Contexts.ProfileScrollContext.useProfileScrollContext);
local v14 = require(l_script_FirstAncestor_0.Hooks.useProfileCardWidth);
local l_useProfileCardWidth_0 = require(l_Parent_0.ProfilePlatformCommon).Hooks.useProfileCardWidth;
local v16 = require(l_script_FirstAncestor_0.Utils.getPeekViewOpenHeightByProfileType);
local l_getSafeAreaSize_0 = v3.getSafeAreaSize;
local v18 = require(l_script_FirstAncestor_0.Hooks.useProfilePeekViewHeight);
local v19 = require(l_script_FirstAncestor_0.Hooks.useShouldShowContextualInformation);
local v20 = require(l_script_FirstAncestor_0.Common.Constants);
local v21 = require(l_script_FirstAncestor_0.Rodux.Presence);
local v22 = require(l_script_FirstAncestor_0.Networking.NetworkingPresence);
local v23 = require(l_script_FirstAncestor_0.Utils.convertPresenceEnum);
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useEffectOnMount_0 = v4.Hooks.useEffectOnMount;
local v26 = require(l_script_FirstAncestor_0.Common.Enums);
local v27 = require(script.Parent.ProfileModalView);
local v28 = require(script.Parent.ProfileFullView);
local v29 = require(l_script_FirstAncestor_0.Components.ProfilePlatformPage);
local v30 = require(script.Parent.ProfilePeekView);
local v31 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableCommunityProfilePage);
local v32 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformFixModalDimensions);
local v33 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableCoverPhoto);
local v34 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableCoverPhotoPeekViewFix);
local l_FFlagEnableWideModeForCommunityProfilePage_0 = require(l_Parent_0.SharedFlags).FFlagEnableWideModeForCommunityProfilePage;
local l_FFlagProfilePlatformNewProfileHeader_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformNewProfileHeader;
local l_FFlagSwitchProfileWidthHookToSocialCommon_0 = require(l_Parent_0.SharedFlags).FFlagSwitchProfileWidthHookToSocialCommon;
local l_FFlagEnableMobileGameJoinCard_0 = require(l_Parent_0.SharedFlags).FFlagEnableMobileGameJoinCard;
return function(_) --[[ Line: 54 ]]
    -- upvalues: v12 (copy), v34 (copy), v13 (copy), l_useScreenSize_0 (copy), l_useTopBarHeight_0 (copy), l_FFlagEnableMobileGameJoinCard_0 (copy), v2 (copy), l_useSelector_0 (copy), v33 (copy), v11 (copy), v26 (copy), l_FormFactor_0 (copy), v29 (copy), v10 (copy), l_getSafeAreaSize_0 (copy), l_FFlagProfilePlatformNewProfileHeader_0 (copy), l_FFlagSwitchProfileWidthHookToSocialCommon_0 (copy), l_useProfileCardWidth_0 (copy), v14 (copy), v20 (copy), l_useDispatch_0 (copy), l_useEffectOnMount_0 (copy), v22 (copy), v21 (copy), v23 (copy), v19 (copy), v18 (copy), v31 (copy), v16 (copy), l_FFlagEnableWideModeForCommunityProfilePage_0 (copy), v28 (copy), v27 (copy), v30 (copy), v32 (copy)
    local v40 = v12();
    local v41 = if v34 then v13() else nil;
    local l_profileType_0 = v40.profileType;
    local l_previousView_0 = v40.navigateTo.previousView;
    local v44 = l_useScreenSize_0();
    local v45 = l_useTopBarHeight_0();
    local v46 = if l_FFlagEnableMobileGameJoinCard_0 then v40.mountAsFullView or false else false;
    local v47 = v2.useCallback(function() --[[ Line: 67 ]]
        -- upvalues: l_previousView_0 (copy)
        l_previousView_0(false);
    end, {
        l_previousView_0
    });
    local v48 = v2.useCallback(function() --[[ Line: 72 ]]
        -- upvalues: l_previousView_0 (copy)
        l_previousView_0(true);
    end, {
        l_previousView_0
    });
    local v50 = l_useSelector_0(function(v49) --[[ Line: 77 ]]
        return v49.GlobalGuiInset;
    end);
    local v51 = nil;
    v51 = if v33 then v11().formFactor == v26.ProfileFormFactor.Wide else l_useSelector_0(function(v52) --[[ Line: 86 ]]
        return v52.FormFactor;
    end) == l_FormFactor_0.WIDE;
    local v53 = v2.useCallback(function() --[[ Line: 93 ]]
        -- upvalues: v2 (ref), v29 (ref)
        return v2.createElement(v29, {});
    end, {});
    local v54 = v2.useCallback(function() --[[ Line: 97 ]]
        -- upvalues: v2 (ref), v10 (ref), v47 (copy)
        return v2.createElement(v10, {
            navigateBack = v47, 
            transparentBackground = true, 
            backgroundTransparency = nil
        });
    end, {});
    local v55 = l_getSafeAreaSize_0(v44, v50);
    local v56 = if l_FFlagProfilePlatformNewProfileHeader_0 then if l_FFlagSwitchProfileWidthHookToSocialCommon_0 then l_useProfileCardWidth_0() else v14(v51) else math.min(v55.X.Offset, v20.MAXIMUM_CONTAINER_WIDTH);
    local v57 = nil;
    if l_FFlagProfilePlatformNewProfileHeader_0 then
        local l_profileId_0 = v40.profileId;
        local v59 = l_useDispatch_0();
        local l_v59_0 = v59 --[[ copy: 18 -> 22 ]];
        local l_l_profileId_0_0 = l_profileId_0 --[[ copy: 17 -> 23 ]];
        l_useEffectOnMount_0(function() --[[ Line: 117 ]]
            -- upvalues: l_v59_0 (copy), v22 (ref), l_l_profileId_0_0 (copy)
            l_v59_0(v22.GetPresencesFromUserIds.API({
                l_l_profileId_0_0
            })):catch(function(_) --[[ Line: 118 ]]

            end);
        end);
        local v64 = l_useSelector_0(function(v63) --[[ Line: 121 ]]
            -- upvalues: v21 (ref), l_l_profileId_0_0 (copy)
            return v21.Selectors.getUserPresenceByUserId(v63, l_l_profileId_0_0) or {
                userPresenceType = v21.Enums.PresenceType.Offline, 
                lastLocation = ""
            };
        end);
        local v65 = v23(v64.userPresenceType, v64.universeId);
        local v66 = v19(v65);
        v57 = v18(v56, v66);
    end;
    local v67 = nil;
    local v68 = nil;
    v68 = if l_FFlagProfilePlatformNewProfileHeader_0 and l_profileType_0 == v26.ProfileTypes.User then v57 else if v31 then v16(l_profileType_0) else v20.USER_PEEK_VIEW_OPEN_HEIGHT;
    v67 = if v55.Y.Offset - v45 < v68 then UDim.new(1, 0) else UDim.new(0, v68);
    if l_FFlagEnableWideModeForCommunityProfilePage_0 and v11().isFullView then
        return v2.createElement(v28, {
            renderContent = v53, 
            navigateBack = v47
        });
    elseif v51 then
        return v2.createElement(v27, {
            renderContent = v53, 
            renderTopBar = v54, 
            topBarHeight = v45, 
            viewWidth = v56, 
            navigateBack = v47
        });
    else
        return v2.createElement(v30, {
            bottomDockedContainerHeight = 0, 
            briefViewContentHeight = v67, 
            contentSlot = v53(), 
            fullViewContentHeight = UDim.new(1, 0), 
            mountAsFullView = v46, 
            onClosed = v48, 
            onViewStateChanged = nil, 
            topBarHeight = v45, 
            topBarSlot = v54(), 
            viewWidth = if v32 then UDim.new(0, v55.X.Offset) else UDim.new(0, v56), 
            transitionPercentCallback = v34 and function(v69) --[[ Line: 185 ]]
                -- upvalues: v41 (copy)
                v41.setPeekViewOpenPercent(v69);
            end or nil, 
            profileType = if l_FFlagProfilePlatformNewProfileHeader_0 then l_profileType_0 else nil
        });
    end;
end;