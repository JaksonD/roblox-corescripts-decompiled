local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.InputUi);
local v4 = require(l_Parent_0.PeekView);
local v5 = require(l_Parent_0.RoactUtils);
local l_PeekViewWithTopBar_0 = v4.PeekViewWithTopBar;
local v7 = require(l_Parent_0.RobloxAppHooks);
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local l_useScreenSize_0 = v7.useScreenSize;
local l_useTopBarHeight_0 = v7.useTopBarHeight;
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local v12 = require(l_script_FirstAncestor_0.Components.ProfileTopBar);
local v13 = require(l_script_FirstAncestor_0.Hooks.useProfileFormFactor);
local v14 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v15 = require(l_script_FirstAncestor_0.Contexts.ProfileScrollContext.useProfileScrollContext);
local v16 = require(l_script_FirstAncestor_0.Hooks.useProfileCardWidth);
local l_useProfileCardWidth_0 = require(l_Parent_0.ProfilePlatformCommon).Hooks.useProfileCardWidth;
local v18 = require(l_script_FirstAncestor_0.Utils.getPeekViewOpenHeightByProfileType);
local l_getSafeAreaSize_0 = v3.getSafeAreaSize;
local v20 = require(l_script_FirstAncestor_0.Hooks.useProfilePeekViewHeight);
local v21 = require(l_script_FirstAncestor_0.Hooks.useShouldShowContextualInformation);
local v22 = require(l_script_FirstAncestor_0.Common.Constants);
local v23 = require(l_script_FirstAncestor_0.Rodux.Presence);
local v24 = require(l_script_FirstAncestor_0.Networking.NetworkingPresence);
local v25 = require(l_script_FirstAncestor_0.Utils.convertPresenceEnum);
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useEffectOnMount_0 = v5.Hooks.useEffectOnMount;
local v28 = require(l_script_FirstAncestor_0.Common.Enums);
local v29 = require(l_script_FirstAncestor_0.Flags.FFlagPPVBackgroundEnabled);
local v30 = require(script.Parent.ProfileModalView);
local v31 = require(script.Parent.ProfileFullView);
local v32 = require(l_script_FirstAncestor_0.Components.ProfilePlatformPage);
local v33 = require(script.Parent.ProfilePeekView);
local v34 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableCommunityProfilePage);
local v35 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformFixModalDimensions);
local v36 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableCoverPhoto);
local v37 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableCoverPhotoPeekViewFix);
local l_FFlagEnableWideModeForCommunityProfilePage_0 = require(l_Parent_0.SharedFlags).FFlagEnableWideModeForCommunityProfilePage;
local l_FFlagProfilePlatformNewProfileHeader_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformNewProfileHeader;
local l_FFlagSwitchProfileWidthHookToSocialCommon_0 = require(l_Parent_0.SharedFlags).FFlagSwitchProfileWidthHookToSocialCommon;
return function(_) --[[ Line: 56 ]]
    -- upvalues: v14 (copy), v37 (copy), v15 (copy), l_useScreenSize_0 (copy), l_useTopBarHeight_0 (copy), v2 (copy), l_useSelector_0 (copy), v36 (copy), v13 (copy), v28 (copy), l_FormFactor_0 (copy), v32 (copy), v12 (copy), v29 (copy), l_getSafeAreaSize_0 (copy), l_FFlagProfilePlatformNewProfileHeader_0 (copy), l_FFlagSwitchProfileWidthHookToSocialCommon_0 (copy), l_useProfileCardWidth_0 (copy), v16 (copy), v22 (copy), l_useDispatch_0 (copy), l_useEffectOnMount_0 (copy), v24 (copy), v23 (copy), v25 (copy), v21 (copy), v20 (copy), v34 (copy), v18 (copy), l_FFlagEnableWideModeForCommunityProfilePage_0 (copy), v31 (copy), v30 (copy), v33 (copy), v35 (copy), l_PeekViewWithTopBar_0 (copy)
    local v42 = v14();
    local v43 = if v37 then v15() else nil;
    local l_profileType_0 = v42.profileType;
    local l_previousView_0 = v42.navigateTo.previousView;
    local v46 = l_useScreenSize_0();
    local v47 = l_useTopBarHeight_0();
    local v48 = v2.useCallback(function() --[[ Line: 67 ]]
        -- upvalues: l_previousView_0 (copy)
        l_previousView_0(false);
    end, {
        l_previousView_0
    });
    local v49 = v2.useCallback(function() --[[ Line: 72 ]]
        -- upvalues: l_previousView_0 (copy)
        l_previousView_0(true);
    end, {
        l_previousView_0
    });
    local v51 = l_useSelector_0(function(v50) --[[ Line: 77 ]]
        return v50.GlobalGuiInset;
    end);
    local v52 = nil;
    v52 = if v36 then v13().formFactor == v28.ProfileFormFactor.Wide else l_useSelector_0(function(v53) --[[ Line: 86 ]]
        return v53.FormFactor;
    end) == l_FormFactor_0.WIDE;
    local v54 = v2.useCallback(function() --[[ Line: 93 ]]
        -- upvalues: v2 (ref), v32 (ref)
        return v2.createElement(v32, {});
    end, {});
    local v55 = v2.useCallback(function() --[[ Line: 97 ]]
        -- upvalues: v2 (ref), v12 (ref), v48 (copy), v29 (ref)
        return v2.createElement(v12, {
            navigateBack = v48, 
            transparentBackground = v29 and true or nil, 
            backgroundTransparency = nil
        });
    end, {});
    local v56 = l_getSafeAreaSize_0(v46, v51);
    local v57 = if l_FFlagProfilePlatformNewProfileHeader_0 then if l_FFlagSwitchProfileWidthHookToSocialCommon_0 then l_useProfileCardWidth_0() else v16(v52) else math.min(v56.X.Offset, v22.MAXIMUM_CONTAINER_WIDTH);
    local v58 = nil;
    if l_FFlagProfilePlatformNewProfileHeader_0 then
        local l_profileId_0 = v42.profileId;
        local v60 = l_useDispatch_0();
        local l_v60_0 = v60 --[[ copy: 17 -> 21 ]];
        local l_l_profileId_0_0 = l_profileId_0 --[[ copy: 16 -> 22 ]];
        l_useEffectOnMount_0(function() --[[ Line: 117 ]]
            -- upvalues: l_v60_0 (copy), v24 (ref), l_l_profileId_0_0 (copy)
            l_v60_0(v24.GetPresencesFromUserIds.API({
                l_l_profileId_0_0
            })):catch(function(_) --[[ Line: 118 ]]

            end);
        end);
        local v65 = l_useSelector_0(function(v64) --[[ Line: 121 ]]
            -- upvalues: v23 (ref), l_l_profileId_0_0 (copy)
            return v23.Selectors.getUserPresenceByUserId(v64, l_l_profileId_0_0) or {
                userPresenceType = v23.Enums.PresenceType.Offline, 
                lastLocation = ""
            };
        end);
        local v66 = v25(v65.userPresenceType, v65.universeId);
        local v67 = v21(v66);
        v58 = v20(v57, v67);
    end;
    local v68 = nil;
    local v69 = nil;
    v69 = if l_FFlagProfilePlatformNewProfileHeader_0 and l_profileType_0 == v28.ProfileTypes.User then v58 else if v34 then v18(l_profileType_0) else v22.USER_PEEK_VIEW_OPEN_HEIGHT;
    v68 = if v56.Y.Offset - v47 < v69 then UDim.new(1, 0) else UDim.new(0, v69);
    if l_FFlagEnableWideModeForCommunityProfilePage_0 and v13().isFullView then
        return v2.createElement(v31, {
            renderContent = v54, 
            navigateBack = v48
        });
    elseif v52 then
        return v2.createElement(v30, {
            renderContent = v54, 
            renderTopBar = v55, 
            topBarHeight = v47, 
            viewWidth = v57, 
            navigateBack = v48
        });
    elseif v29 then
        return v2.createElement(v33, {
            bottomDockedContainerHeight = 0, 
            briefViewContentHeight = v68, 
            contentSlot = v54(), 
            fullViewContentHeight = UDim.new(1, 0), 
            mountAsFullView = false, 
            onClosed = v49, 
            onViewStateChanged = nil, 
            topBarHeight = v47, 
            topBarSlot = v55(), 
            viewWidth = if v35 then UDim.new(0, v56.X.Offset) else UDim.new(0, v57), 
            transitionPercentCallback = v37 and function(v70) --[[ Line: 188 ]]
                -- upvalues: v43 (copy)
                v43.setPeekViewOpenPercent(v70);
            end or nil, 
            profileType = if l_FFlagProfilePlatformNewProfileHeader_0 then l_profileType_0 else nil
        });
    else
        return v2.createElement(l_PeekViewWithTopBar_0, {
            bottomDockedContainerHeight = 0, 
            briefViewContentHeight = v68, 
            contentSlot = v54(), 
            fullViewContentHeight = UDim.new(1, -v47), 
            mountAsFullView = false, 
            onClosed = v49, 
            onViewStateChanged = nil, 
            topBarHeight = v47, 
            topBarSlot = v55(), 
            viewWidth = if v35 then UDim.new(0, v56.X.Offset) else UDim.new(0, v57), 
            transitionPercentCallback = v37 and function(v71) --[[ Line: 210 ]]
                -- upvalues: v43 (copy)
                v43.setPeekViewOpenPercent(v71);
            end or nil, 
            hasSolidDragger = (not l_FFlagProfilePlatformNewProfileHeader_0 or l_profileType_0 ~= v28.ProfileTypes.User and not (l_profileType_0 == v28.ProfileTypes.Contact)) and nil
        }, {
            Content = v54()
        });
    end;
end;