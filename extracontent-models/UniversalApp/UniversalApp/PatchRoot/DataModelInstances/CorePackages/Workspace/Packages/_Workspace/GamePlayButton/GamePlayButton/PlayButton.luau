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
local l_FFlagUIBloxAddTestIdToComboButtonAndCellTailDescription_0 = require(l_Parent_0.SharedFlags).UIBlox.FFlagUIBloxAddTestIdToComboButtonAndCellTailDescription;
local v29 = v26 and "play-xlarge" or nil;
local v30 = l_Images_0["icons/common/play"];
local v31 = l_Images_0["icons/actions/truncationCollapse"];
local function v32() --[[ Line: 52 ]]

end;
return v2.memo(function(v33) --[[ Line: 114 ]] --[[ Name: PlayButton ]]
    -- upvalues: v2 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useSelector_0 (copy), l_GamesProductInfoReducer_0 (copy), v1 (copy), v19 (copy), v17 (copy), v27 (copy), v18 (copy), l_MenuDirection_0 (copy), v20 (copy), l_useLocalization_0 (copy), l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 (copy), l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), l_ButtonSize_0 (copy), l_ButtonVariant_0 (copy), v25 (copy), v26 (copy), v29 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v30 (copy), l_ComboButton_0 (copy), v31 (copy), l_FFlagUIBloxAddTestIdToComboButtonAndCellTailDescription_0 (copy), l_IconButton_0 (copy), v32 (copy), l_Button_0 (copy)
    local v34 = v2.useRef(false);
    v2.useEffect(function() --[[ Line: 116 ]]
        -- upvalues: v34 (copy)
        v34.current = true;
        return function() --[[ Line: 118 ]]
            -- upvalues: v34 (ref)
            v34.current = false;
        end;
    end, {});
    local v35 = l_useRoactService_0(l_RoactNetworking_0);
    local v37 = l_useSelector_0(function(v36) --[[ Line: 124 ]]
        -- upvalues: v33 (copy), l_GamesProductInfoReducer_0 (ref)
        if v33.universeId then
            return v36[l_GamesProductInfoReducer_0.key][v33.universeId];
        else
            return nil;
        end;
    end, v1.shallowEqual);
    local l_playButtonState_0 = v19(v35, v33.universeId, v33.fetchDelayInSeconds, v33.isPlayableWhenLoading).playButtonState;
    local v39 = v17(v33.universeId, v33.referralSource, v33.eventContext or "PlayButton", nil, v33.launchSource or v27 and "UnknownLaunchSource" or "LuaGameCard", v33.experienceJoinData, v33.placeId);
    local v40 = v18(l_MenuDirection_0.Up, l_playButtonState_0, v33.referralSource, v33.universeId);
    local v41 = v2.useCallback(function() --[[ Line: 150 ]]
        -- upvalues: v34 (copy), v33 (copy), l_playButtonState_0 (copy), v20 (ref), v39 (copy)
        if not v34.current then
            return;
        else
            if v33.onActivated then
                v33.onActivated();
            end;
            if v33.onPurchaseRequiredCallback and (l_playButtonState_0 == v20.PaidAccess or l_playButtonState_0 == v20.FiatPaidAccess) then
                v33.onPurchaseRequiredCallback();
                return;
            else
                v39(l_playButtonState_0, v33.reportExperienceLaunched);
                return;
            end;
        end;
    end, {
        v39, 
        l_playButtonState_0, 
        v33.onPurchaseRequiredCallback, 
        v33.reportExperienceLaunched, 
        v33.onActivated
    });
    local v43 = v2.useCallback(function(v42) --[[ Line: 180 ]]
        -- upvalues: v34 (copy), v33 (copy), v40 (copy)
        if not v34.current then
            return;
        else
            if v33.onActivated then
                v33.onActivated();
            end;
            v40(v42);
            return;
        end;
    end, {
        v40, 
        v33.onActivated
    });
    local v44 = l_useLocalization_0({
        join = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded", 
        joinWithParty = "Feature.Squads.Action.JoinWithParty", 
        unavailable = "Feature.ExperienceDetails.PlayButtonText.Unavailable", 
        waitingForParty = "Feature.Squads.Action.WaitingForParty"
    });
    local v45 = nil;
    local v46 = nil;
    if l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 then
        local v49, v50 = l_useUserExperiment_0({
            l_AppUserLayers_0.PlayButtonUXExposureLayer
        }, function(v47) --[[ Line: 201 ]]
            -- upvalues: l_AppUserLayers_0 (ref)
            local v48 = v47[l_AppUserLayers_0.PlayButtonUXExposureLayer] or {};
            return v48.HasJoinTextButton, v48.HasIconPlayButton;
        end, true);
        v45 = v49;
        v46 = v50;
    end;
    local v51 = false;
    local v52 = false;
    local v53 = false;
    local v54 = v33.buttonSize or l_ButtonSize_0.Medium;
    local l_fillBehavior_0 = v33.fillBehavior;
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    if l_playButtonState_0 == v20.Loading then
        if v33.hideIfLoading then
            return nil;
        else
            v56 = l_ButtonVariant_0.Emphasis;
        end;
    elseif l_playButtonState_0 == v20.Playable then
        v56 = l_ButtonVariant_0.Emphasis;
        if v25 and (not l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 or v45) then
            v58 = v33.playableText or v44.join;
        else
            if not v26 and not v33.hidePlayableIcon then
                v57 = "icons/common/play";
            end;
            v58 = v33.playableText;
            if v26 and not v33.hidePlayableIcon then
                v57 = v58 and v58 ~= "" and "icons/common/play" or v29;
            end;
        end;
    elseif l_GetFFlagIsSquadEnabled_0() and l_playButtonState_0 == v20.PlayableWithParty then
        v57 = v30;
        v58 = if v33.hideOptionalText then nil else v44.joinWithParty;
        v51 = true;
    elseif l_GetFFlagIsSquadEnabled_0() and l_playButtonState_0 == v20.WaitingForParty then
        v57 = v30;
        v58 = if v33.hideOptionalText then nil else v44.waitingForParty;
        v53 = true;
        v52 = true;
        v51 = true;
    elseif l_playButtonState_0 == v20.PaidAccess then
        v58 = tostring(v37 and v37.price or 0);
        v56 = l_ButtonVariant_0.Emphasis;
        v57 = "icons/common/robux";
    elseif l_playButtonState_0 == v20.FiatPaidAccess then
        v56 = l_ButtonVariant_0.Emphasis;
        local v59 = v37 and v37.localizedFiatPrice or "";
        v58 = v33.fiatText or v59;
    elseif l_playButtonState_0 == v20.ActionNeeded then
        v56 = l_ButtonVariant_0.SubEmphasis;
        v57 = "icons/status/private";
        v58 = if v33.hideOptionalText then nil else v44.join;
    elseif l_playButtonState_0 == v20.UnplayableOther then
        if v33.hideIfUnplayable then
            return nil;
        else
            v56 = l_ButtonVariant_0.Subtle;
            v57 = "icons/status/unavailable";
            v58 = if v33.hideOptionalText then nil else v44.unavailable;
            v53 = true;
        end;
    else
        error("invalid play button state!");
    end;
    if v51 then
        return v2.createElement(l_ComboButton_0, {
            layoutOrder = v33.LayoutOrder, 
            position = v33.Position, 
            size = UDim2.new(v33.width or UDim.new(1, 0), v33.squadButtonHeight or UDim.new(1, 0)), 
            button = {
                icon = v57, 
                text = v58, 
                isDisabled = v53, 
                onActivated = if not v53 then v41 else function() --[[ Line: 282 ]]

                end
            }, 
            overflow = {
                icon = v31, 
                isDisabled = v52, 
                onActivated = if not v52 then v43 else function() --[[ Line: 287 ]]

                end
            }, 
            testId = if l_FFlagUIBloxAddTestIdToComboButtonAndCellTailDescription_0 then v33.testId else nil
        });
    else
        local v60 = if v26 then (not (v58 ~= nil) or v58 == "") and v57 ~= nil else nil;
        if v26 and (not l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 or v46) and v60 then
            return v2.createElement(l_IconButton_0, {
                LayoutOrder = v33.LayoutOrder, 
                Position = v33.Position, 
                icon = v57, 
                variant = v56, 
                size = v54, 
                width = v33.width, 
                fillBehavior = l_fillBehavior_0, 
                isDisabled = v53, 
                onActivated = if not v53 then v41 else v32, 
                testId = v33.testId
            });
        else
            return v2.createElement(l_Button_0, {
                LayoutOrder = v33.LayoutOrder, 
                Position = v33.Position, 
                icon = v57, 
                text = v58, 
                variant = v56, 
                size = v54, 
                width = v33.width, 
                fillBehavior = l_fillBehavior_0, 
                isDisabled = v53, 
                onActivated = if not v53 then v41 else v32, 
                testId = v33.testId
            });
        end;
    end;
end);