local l_Parent_0 = script:FindFirstAncestor("GamePlayButton").Parent;
local v1 = require(l_Parent_0.tutils);
local v2 = require(l_Parent_0.React);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v6 = require(l_Parent_0.UIBlox);
local l_ComboButton_0 = v6.App.Button.ComboButton;
local l_Images_0 = v6.App.ImageSet.Images;
local l_MenuDirection_0 = v6.App.Menu.MenuDirection;
local v10 = require(l_Parent_0.Foundation);
local l_Button_0 = v10.Button;
local l_IconButton_0 = v10.IconButton;
local l_Skeleton_0 = v10.Skeleton;
local l_ButtonVariant_0 = v10.Enums.ButtonVariant;
local l_InputSize_0 = v10.Enums.InputSize;
local l_Radius_0 = v10.Enums.Radius;
local l_useTokens_0 = v10.Hooks.useTokens;
local l_GamesProductInfoReducer_0 = require(l_Parent_0.GameProductInfoRodux).GamesProductInfoReducer;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v20 = require(script.Parent.useOnPlayButtonCallback);
local v21 = require(script.Parent.useOnPlaySquadButtonCallback);
local v22 = require(script.Parent.usePlayButtonState);
local v23 = require(script.Parent.PlayButtonStates);
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUnifyPlayButtonAllSurfacesIxp;
local v28 = game:DefineFastFlag("LuaAppJoinTextPlayableButton", false) or l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0;
local v29 = game:DefineFastFlag("LuaAppIconPlayButton", false) or l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0;
local v30 = game:DefineFastFlag("LuaAppPlayButtonLoadingSkeleton", false) or l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0;
local v31 = game:DefineFastFlag("LuaAppFixPlayButtonDefaultLaunchSource", false);
local v32 = v29 and "play-xlarge" or nil;
local v33 = l_Images_0["icons/common/play"];
local v34 = l_Images_0["icons/actions/truncationCollapse"];
local function v35() --[[ Line: 57 ]]

end;
local v36 = {
    [l_InputSize_0.XSmall] = "Size_600", 
    [l_InputSize_0.Small] = "Size_800", 
    [l_InputSize_0.Medium] = "Size_1000", 
    [l_InputSize_0.Large] = "Size_1200"
};
return v2.memo(function(v37) --[[ Line: 129 ]] --[[ Name: PlayButton ]]
    -- upvalues: v2 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useSelector_0 (copy), l_GamesProductInfoReducer_0 (copy), v1 (copy), v22 (copy), v20 (copy), v31 (copy), v21 (copy), l_MenuDirection_0 (copy), v23 (copy), l_useLocalization_0 (copy), l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 (copy), l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), v30 (copy), l_useTokens_0 (copy), l_InputSize_0 (copy), v36 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_ButtonVariant_0 (copy), v28 (copy), v29 (copy), v32 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v33 (copy), l_ComboButton_0 (copy), v34 (copy), l_IconButton_0 (copy), v35 (copy), l_Button_0 (copy)
    local v38 = v2.useRef(false);
    v2.useEffect(function() --[[ Line: 131 ]]
        -- upvalues: v38 (copy)
        v38.current = true;
        return function() --[[ Line: 133 ]]
            -- upvalues: v38 (ref)
            v38.current = false;
        end;
    end, {});
    local v39 = l_useRoactService_0(l_RoactNetworking_0);
    local v41 = l_useSelector_0(function(v40) --[[ Line: 139 ]]
        -- upvalues: v37 (copy), l_GamesProductInfoReducer_0 (ref)
        if v37.universeId then
            return v40[l_GamesProductInfoReducer_0.key][v37.universeId];
        else
            return nil;
        end;
    end, v1.shallowEqual);
    local l_playButtonState_0 = v22(v39, v37.universeId, v37.fetchDelayInSeconds, v37.isPlayableWhenLoading).playButtonState;
    local v43 = v20(v37.universeId, v37.referralSource, v37.eventContext or "PlayButton", nil, v37.launchSource or v31 and "UnknownLaunchSource" or "LuaGameCard", v37.experienceJoinData, v37.placeId);
    local v44 = v21(l_MenuDirection_0.Up, l_playButtonState_0, v37.referralSource, v37.universeId);
    local v45 = v2.useCallback(function() --[[ Line: 165 ]]
        -- upvalues: v38 (copy), v37 (copy), l_playButtonState_0 (copy), v23 (ref), v43 (copy)
        if not v38.current then
            return;
        else
            if v37.onActivated then
                v37.onActivated();
            end;
            if v37.onPurchaseRequiredCallback and (l_playButtonState_0 == v23.PaidAccess or l_playButtonState_0 == v23.FiatPaidAccess) then
                v37.onPurchaseRequiredCallback();
                return;
            else
                v43(l_playButtonState_0, v37.reportExperienceLaunched);
                return;
            end;
        end;
    end, {
        v43, 
        l_playButtonState_0, 
        v37.onPurchaseRequiredCallback, 
        v37.reportExperienceLaunched, 
        v37.onActivated
    });
    local v47 = v2.useCallback(function(v46) --[[ Line: 195 ]]
        -- upvalues: v38 (copy), v37 (copy), v44 (copy)
        if not v38.current then
            return;
        else
            if v37.onActivated then
                v37.onActivated();
            end;
            v44(v46);
            return;
        end;
    end, {
        v44, 
        v37.onActivated
    });
    local v48 = l_useLocalization_0({
        join = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded", 
        joinWithParty = "Feature.Squads.Action.JoinWithParty", 
        unavailable = "Feature.ExperienceDetails.PlayButtonText.Unavailable", 
        waitingForParty = "Feature.Squads.Action.WaitingForParty"
    });
    local v49 = nil;
    local v50 = nil;
    local v51 = nil;
    if l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 then
        local v54, v55, v56 = l_useUserExperiment_0({
            l_AppUserLayers_0.PlayButtonUXExposureLayer
        }, function(v52) --[[ Line: 216 ]]
            -- upvalues: l_AppUserLayers_0 (ref)
            local v53 = v52[l_AppUserLayers_0.PlayButtonUXExposureLayer] or {};
            return v53.HasJoinTextButton, v53.HasIconPlayButton, v53.HasPlayButtonLoadingSkeleton;
        end, true);
        v49 = v54;
        v50 = v55;
        v51 = v56;
    end;
    local v57 = if v30 then l_useTokens_0() else nil;
    local v58 = false;
    local v59 = false;
    local v60 = false;
    local v61 = v37.buttonSize or l_InputSize_0.Medium;
    local l_fillBehavior_0 = v37.fillBehavior;
    local v63 = nil;
    local v64 = nil;
    local v65 = nil;
    if l_playButtonState_0 == v23.Loading then
        if v37.hideIfLoading then
            return nil;
        elseif v30 and (not l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 or v51) then
            local v66 = v36[v61] or "Size_1000";
            local v67 = v57 and v57.Size[v66];
            local v68 = nil;
            v68 = if l_fillBehavior_0 == "Fill" then UDim.new(1, 0) else if v37.width then v37.width else UDim.new(0, v67);
            local v69 = UDim2.new(v68, UDim.new(0, v67));
            local l_l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0_0 = l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0;
            local v71 = v2.createElement(l_Skeleton_0, {
                Size = if l_l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0_0 then UDim2.fromScale(1, 1) else v69, 
                LayoutOrder = if not l_l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0_0 then v37.LayoutOrder else nil, 
                Position = if not l_l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0_0 then v37.Position else nil, 
                radius = l_Radius_0.Medium
            });
            if l_l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0_0 then
                return v2.createElement("TextButton", {
                    LayoutOrder = v37.LayoutOrder, 
                    Position = v37.Position, 
                    Size = v69, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Text = "", 
                    AutoButtonColor = false, 
                    [v2.Event.Activated] = v45
                }, {
                    Skeleton = v71
                });
            else
                return v71;
            end;
        else
            v63 = l_ButtonVariant_0.Emphasis;
        end;
    elseif l_playButtonState_0 == v23.Playable then
        v63 = l_ButtonVariant_0.Emphasis;
        if v28 and (not l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 or v49) then
            v65 = v37.playableText or v48.join;
        else
            if not v29 and not v37.hidePlayableIcon then
                v64 = "icons/common/play";
            end;
            v65 = v37.playableText;
            if v29 and not v37.hidePlayableIcon then
                v64 = v65 and v65 ~= "" and "icons/common/play" or v32;
            end;
        end;
    elseif l_GetFFlagIsSquadEnabled_0() and l_playButtonState_0 == v23.PlayableWithParty then
        v64 = v33;
        v65 = if v37.hideOptionalText then nil else v48.joinWithParty;
        v58 = true;
    elseif l_GetFFlagIsSquadEnabled_0() and l_playButtonState_0 == v23.WaitingForParty then
        v64 = v33;
        v65 = if v37.hideOptionalText then nil else v48.waitingForParty;
        v60 = true;
        v59 = true;
        v58 = true;
    elseif l_playButtonState_0 == v23.PaidAccess then
        v65 = tostring(v41 and v41.price or 0);
        v63 = l_ButtonVariant_0.Emphasis;
        v64 = "icons/common/robux";
    elseif l_playButtonState_0 == v23.FiatPaidAccess then
        v63 = l_ButtonVariant_0.Emphasis;
        local v72 = v41 and v41.localizedFiatPrice or "";
        v65 = v37.fiatText or v72;
    elseif l_playButtonState_0 == v23.ActionNeeded then
        v63 = l_ButtonVariant_0.SubEmphasis;
        v64 = "icons/status/private";
        v65 = if v37.hideOptionalText then nil else v48.join;
    elseif l_playButtonState_0 == v23.UnplayableOther then
        if v37.hideIfUnplayable then
            return nil;
        else
            v63 = l_ButtonVariant_0.Subtle;
            v64 = "icons/status/unavailable";
            v65 = if v37.hideOptionalText then nil else v48.unavailable;
            v60 = true;
        end;
    else
        error("invalid play button state!");
    end;
    if v58 then
        return v2.createElement(l_ComboButton_0, {
            layoutOrder = v37.LayoutOrder, 
            position = v37.Position, 
            size = UDim2.new(v37.width or UDim.new(1, 0), v37.squadButtonHeight or UDim.new(1, 0)), 
            button = {
                icon = v64, 
                text = v65, 
                isDisabled = v60, 
                onActivated = if not v60 then v45 else function() --[[ Line: 348 ]]

                end
            }, 
            overflow = {
                icon = v34, 
                isDisabled = v59, 
                onActivated = if not v59 then v47 else function() --[[ Line: 353 ]]

                end
            }, 
            testId = v37.testId
        });
    else
        local v73 = if v29 then (not (v65 ~= nil) or v65 == "") and v64 ~= nil else nil;
        if v29 and (not l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 or v50) and v73 then
            return v2.createElement(l_IconButton_0, {
                LayoutOrder = v37.LayoutOrder, 
                Position = v37.Position, 
                icon = v64, 
                variant = v63, 
                size = v61, 
                width = v37.width, 
                fillBehavior = l_fillBehavior_0, 
                isDisabled = v60, 
                onActivated = if not v60 then v45 else v35, 
                testId = v37.testId
            });
        else
            return v2.createElement(l_Button_0, {
                LayoutOrder = v37.LayoutOrder, 
                Position = v37.Position, 
                icon = v64, 
                text = v65, 
                variant = v63, 
                size = v61, 
                width = v37.width, 
                fillBehavior = l_fillBehavior_0, 
                isDisabled = v60, 
                onActivated = if not v60 then v45 else v35, 
                testId = v37.testId
            });
        end;
    end;
end);