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
local l_ButtonVariant_0 = v10.Enums.ButtonVariant;
local l_ButtonSize_0 = v10.Enums.ButtonSize;
local l_GamesProductInfoReducer_0 = require(l_Parent_0.GameProductInfoRodux).GamesProductInfoReducer;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v17 = require(script.Parent.useOnPlayButtonCallback);
local v18 = require(script.Parent.useOnPlaySquadButtonCallback);
local v19 = require(script.Parent.usePlayButtonState);
local v20 = require(script.Parent.PlayButtonStates);
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUnifyPlayButtonAllSurfacesIxp;
local v25 = game:DefineFastFlag("LuaAppJoinTextPlayableButton", false) or l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0;
local v26 = game:DefineFastFlag("LuaAppIconPlayButton", false) or l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0;
local v27 = game:DefineFastFlag("LuaAppFixPlayButtonDefaultLaunchSource", false);
local v28 = v26 and "play-xlarge" or nil;
local v29 = l_Images_0["icons/common/play"];
local v30 = l_Images_0["icons/actions/truncationCollapse"];
local function v31() --[[ Line: 50 ]]

end;
return v2.memo(function(v32) --[[ Line: 112 ]] --[[ Name: PlayButton ]]
    -- upvalues: v2 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useSelector_0 (copy), l_GamesProductInfoReducer_0 (copy), v1 (copy), v19 (copy), v17 (copy), v27 (copy), v18 (copy), l_MenuDirection_0 (copy), v20 (copy), l_useLocalization_0 (copy), l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 (copy), l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), l_ButtonSize_0 (copy), l_ButtonVariant_0 (copy), v25 (copy), v26 (copy), v28 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v29 (copy), l_ComboButton_0 (copy), v30 (copy), l_IconButton_0 (copy), v31 (copy), l_Button_0 (copy)
    local v33 = v2.useRef(false);
    v2.useEffect(function() --[[ Line: 114 ]]
        -- upvalues: v33 (copy)
        v33.current = true;
        return function() --[[ Line: 116 ]]
            -- upvalues: v33 (ref)
            v33.current = false;
        end;
    end, {});
    local v34 = l_useRoactService_0(l_RoactNetworking_0);
    local v36 = l_useSelector_0(function(v35) --[[ Line: 122 ]]
        -- upvalues: v32 (copy), l_GamesProductInfoReducer_0 (ref)
        if v32.universeId then
            return v35[l_GamesProductInfoReducer_0.key][v32.universeId];
        else
            return nil;
        end;
    end, v1.shallowEqual);
    local l_playButtonState_0 = v19(v34, v32.universeId, v32.fetchDelayInSeconds, v32.isPlayableWhenLoading).playButtonState;
    local v38 = v17(v32.universeId, v32.referralSource, v32.eventContext or "PlayButton", nil, v32.launchSource or v27 and "UnknownLaunchSource" or "LuaGameCard", v32.experienceJoinData, v32.placeId);
    local v39 = v18(l_MenuDirection_0.Up, l_playButtonState_0, v32.referralSource, v32.universeId);
    local v40 = v2.useCallback(function() --[[ Line: 148 ]]
        -- upvalues: v33 (copy), v32 (copy), l_playButtonState_0 (copy), v20 (ref), v38 (copy)
        if not v33.current then
            return;
        else
            if v32.onActivated then
                v32.onActivated();
            end;
            if v32.onPurchaseRequiredCallback and (l_playButtonState_0 == v20.PaidAccess or l_playButtonState_0 == v20.FiatPaidAccess) then
                v32.onPurchaseRequiredCallback();
                return;
            else
                v38(l_playButtonState_0, v32.reportExperienceLaunched);
                return;
            end;
        end;
    end, {
        v38, 
        l_playButtonState_0, 
        v32.onPurchaseRequiredCallback, 
        v32.reportExperienceLaunched, 
        v32.onActivated
    });
    local v42 = v2.useCallback(function(v41) --[[ Line: 178 ]]
        -- upvalues: v33 (copy), v32 (copy), v39 (copy)
        if not v33.current then
            return;
        else
            if v32.onActivated then
                v32.onActivated();
            end;
            v39(v41);
            return;
        end;
    end, {
        v39, 
        v32.onActivated
    });
    local v43 = l_useLocalization_0({
        join = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded", 
        joinWithParty = "Feature.Squads.Action.JoinWithParty", 
        unavailable = "Feature.ExperienceDetails.PlayButtonText.Unavailable", 
        waitingForParty = "Feature.Squads.Action.WaitingForParty"
    });
    local v44 = nil;
    local v45 = nil;
    if l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 then
        local v48, v49 = l_useUserExperiment_0({
            l_AppUserLayers_0.PlayButtonUXExposureLayer
        }, function(v46) --[[ Line: 199 ]]
            -- upvalues: l_AppUserLayers_0 (ref)
            local v47 = v46[l_AppUserLayers_0.PlayButtonUXExposureLayer] or {};
            return v47.HasJoinTextButton, v47.HasIconPlayButton;
        end, true);
        v44 = v48;
        v45 = v49;
    end;
    local v50 = false;
    local v51 = false;
    local v52 = false;
    local v53 = v32.buttonSize or l_ButtonSize_0.Medium;
    local l_fillBehavior_0 = v32.fillBehavior;
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    if l_playButtonState_0 == v20.Loading then
        if v32.hideIfLoading then
            return nil;
        else
            v55 = l_ButtonVariant_0.Emphasis;
        end;
    elseif l_playButtonState_0 == v20.Playable then
        v55 = l_ButtonVariant_0.Emphasis;
        if v25 and (not l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 or v44) then
            v57 = v32.playableText or v43.join;
        else
            if not v26 and not v32.hidePlayableIcon then
                v56 = "icons/common/play";
            end;
            v57 = v32.playableText;
            if v26 and not v32.hidePlayableIcon then
                v56 = v57 and v57 ~= "" and "icons/common/play" or v28;
            end;
        end;
    elseif l_GetFFlagIsSquadEnabled_0() and l_playButtonState_0 == v20.PlayableWithParty then
        v56 = v29;
        v57 = if v32.hideOptionalText then nil else v43.joinWithParty;
        v50 = true;
    elseif l_GetFFlagIsSquadEnabled_0() and l_playButtonState_0 == v20.WaitingForParty then
        v56 = v29;
        v57 = if v32.hideOptionalText then nil else v43.waitingForParty;
        v52 = true;
        v51 = true;
        v50 = true;
    elseif l_playButtonState_0 == v20.PaidAccess then
        v57 = tostring(v36 and v36.price or 0);
        v55 = l_ButtonVariant_0.Emphasis;
        v56 = "icons/common/robux";
    elseif l_playButtonState_0 == v20.FiatPaidAccess then
        v55 = l_ButtonVariant_0.Emphasis;
        local v58 = v36 and v36.localizedFiatPrice or "";
        v57 = v32.fiatText or v58;
    elseif l_playButtonState_0 == v20.ActionNeeded then
        v55 = l_ButtonVariant_0.SubEmphasis;
        v56 = "icons/status/private";
        v57 = if v32.hideOptionalText then nil else v43.join;
    elseif l_playButtonState_0 == v20.UnplayableOther then
        if v32.hideIfUnplayable then
            return nil;
        else
            v55 = l_ButtonVariant_0.Subtle;
            v56 = "icons/status/unavailable";
            v57 = if v32.hideOptionalText then nil else v43.unavailable;
            v52 = true;
        end;
    else
        error("invalid play button state!");
    end;
    if v50 then
        return v2.createElement(l_ComboButton_0, {
            layoutOrder = v32.LayoutOrder, 
            position = v32.Position, 
            size = UDim2.new(v32.width or UDim.new(1, 0), v32.squadButtonHeight or UDim.new(1, 0)), 
            button = {
                icon = v56, 
                text = v57, 
                isDisabled = v52, 
                onActivated = if not v52 then v40 else function() --[[ Line: 280 ]]

                end
            }, 
            overflow = {
                icon = v30, 
                isDisabled = v51, 
                onActivated = if not v51 then v42 else function() --[[ Line: 285 ]]

                end
            }, 
            testId = v32.testId
        });
    else
        local v59 = if v26 then (not (v57 ~= nil) or v57 == "") and v56 ~= nil else nil;
        if v26 and (not l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 or v45) and v59 then
            return v2.createElement(l_IconButton_0, {
                LayoutOrder = v32.LayoutOrder, 
                Position = v32.Position, 
                icon = v56, 
                variant = v55, 
                size = v53, 
                width = v32.width, 
                fillBehavior = l_fillBehavior_0, 
                isDisabled = v52, 
                onActivated = if not v52 then v40 else v31, 
                testId = v32.testId
            });
        else
            return v2.createElement(l_Button_0, {
                LayoutOrder = v32.LayoutOrder, 
                Position = v32.Position, 
                icon = v56, 
                text = v57, 
                variant = v55, 
                size = v53, 
                width = v32.width, 
                fillBehavior = l_fillBehavior_0, 
                isDisabled = v52, 
                onActivated = if not v52 then v40 else v31, 
                testId = v32.testId
            });
        end;
    end;
end);