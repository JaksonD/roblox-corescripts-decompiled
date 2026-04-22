local l_Parent_0 = script:FindFirstAncestor("GamePlayButton").Parent;
local v1 = require(l_Parent_0.tutils);
local v2 = require(l_Parent_0.React);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v6 = require(l_Parent_0.UIBlox);
local l_Button_0 = v6.App.Button.Button;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_ComboButton_0 = v6.App.Button.ComboButton;
local l_Images_0 = v6.App.ImageSet.Images;
local l_MenuDirection_0 = v6.App.Menu.MenuDirection;
local v12 = require(l_Parent_0.Foundation);
local l_Button_1 = v12.Button;
local l_IconButton_0 = v12.IconButton;
local l_Skeleton_0 = v12.Skeleton;
local l_ButtonVariant_0 = v12.Enums.ButtonVariant;
local l_InputSize_0 = v12.Enums.InputSize;
local l_Radius_0 = v12.Enums.Radius;
local l_useTokens_0 = v12.Hooks.useTokens;
local l_GamesProductInfoReducer_0 = require(l_Parent_0.GameProductInfoRodux).GamesProductInfoReducer;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v22 = require(script.Parent.useOnPlayButtonCallback);
local v23 = require(script.Parent.useOnPlaySquadButtonCallback);
local v24 = require(script.Parent.usePlayButtonState);
local v25 = require(script.Parent.PlayButtonStates);
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local l_FFlagLuaAppSupportUnifiedUIBloxPlayButton_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportUnifiedUIBloxPlayButton;
local l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUnifyPlayButtonAllSurfacesIxp;
local v31 = game:DefineFastFlag("LuaAppJoinTextPlayableButton", false) or l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0;
local v32 = game:DefineFastFlag("LuaAppIconPlayButton", false) or l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0;
local v33 = l_FFlagLuaAppSupportUnifiedUIBloxPlayButton_0 and (game:DefineFastFlag("LuaAppPlayButtonLoadingSkeleton3", false) or l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0);
local v34 = game:DefineFastFlag("LuaAppFixPlayButtonDefaultLaunchSource", false);
local v35 = v32 and "play-xlarge" or nil;
local v36 = l_Images_0["icons/common/play"];
local v37 = l_Images_0["icons/actions/truncationCollapse"];
local function v38() --[[ Line: 61 ]]

end;
local v39 = {
    [l_InputSize_0.XSmall] = "Size_600", 
    [l_InputSize_0.Small] = "Size_800", 
    [l_InputSize_0.Medium] = "Size_1000", 
    [l_InputSize_0.Large] = "Size_1200"
};
return v2.memo(function(v40) --[[ Line: 136 ]] --[[ Name: PlayButton ]]
    -- upvalues: v2 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useSelector_0 (copy), l_GamesProductInfoReducer_0 (copy), v1 (copy), v24 (copy), v22 (copy), v34 (copy), v23 (copy), l_MenuDirection_0 (copy), v25 (copy), l_useLocalization_0 (copy), l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 (copy), l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), l_FFlagLuaAppSupportUnifiedUIBloxPlayButton_0 (copy), l_useTokens_0 (copy), l_InputSize_0 (copy), v33 (copy), v39 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_ButtonVariant_0 (copy), v31 (copy), v32 (copy), v35 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v36 (copy), l_ComboButton_0 (copy), v37 (copy), l_ButtonType_0 (copy), l_Images_0 (copy), l_Button_0 (copy), v38 (copy), l_IconButton_0 (copy), l_Button_1 (copy)
    local v41 = v2.useRef(false);
    v2.useEffect(function() --[[ Line: 138 ]]
        -- upvalues: v41 (copy)
        v41.current = true;
        return function() --[[ Line: 140 ]]
            -- upvalues: v41 (ref)
            v41.current = false;
        end;
    end, {});
    local v42 = l_useRoactService_0(l_RoactNetworking_0);
    local v44 = l_useSelector_0(function(v43) --[[ Line: 146 ]]
        -- upvalues: v40 (copy), l_GamesProductInfoReducer_0 (ref)
        if v40.universeId then
            return v43[l_GamesProductInfoReducer_0.key][v40.universeId];
        else
            return nil;
        end;
    end, v1.shallowEqual);
    local l_playButtonState_0 = v24(v42, v40.universeId, v40.fetchDelayInSeconds, v40.isPlayableWhenLoading).playButtonState;
    local v46 = v22(v40.universeId, v40.referralSource, v40.eventContext or "PlayButton", nil, v40.launchSource or v34 and "UnknownLaunchSource" or "LuaGameCard", v40.experienceJoinData, v40.placeId);
    local v47 = v23(l_MenuDirection_0.Up, l_playButtonState_0, v40.referralSource, v40.universeId);
    local v48 = v2.useCallback(function() --[[ Line: 172 ]]
        -- upvalues: v41 (copy), v40 (copy), l_playButtonState_0 (copy), v25 (ref), v46 (copy)
        if not v41.current then
            return;
        else
            if v40.onActivated then
                v40.onActivated();
            end;
            if v40.onPurchaseRequiredCallback and (l_playButtonState_0 == v25.PaidAccess or l_playButtonState_0 == v25.FiatPaidAccess) then
                v40.onPurchaseRequiredCallback();
                return;
            else
                v46(l_playButtonState_0, v40.reportExperienceLaunched);
                return;
            end;
        end;
    end, {
        v46, 
        l_playButtonState_0, 
        v40.onPurchaseRequiredCallback, 
        v40.reportExperienceLaunched, 
        v40.onActivated
    });
    local v50 = v2.useCallback(function(v49) --[[ Line: 202 ]]
        -- upvalues: v41 (copy), v40 (copy), v47 (copy)
        if not v41.current then
            return;
        else
            if v40.onActivated then
                v40.onActivated();
            end;
            v47(v49);
            return;
        end;
    end, {
        v47, 
        v40.onActivated
    });
    local v51 = l_useLocalization_0({
        join = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded", 
        joinWithParty = "Feature.Squads.Action.JoinWithParty", 
        unavailable = "Feature.ExperienceDetails.PlayButtonText.Unavailable", 
        waitingForParty = "Feature.Squads.Action.WaitingForParty"
    });
    local v52 = nil;
    local v53 = nil;
    local v54 = nil;
    if l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 then
        local v57, v58, v59 = l_useUserExperiment_0({
            l_AppUserLayers_0.PlayButtonUXExposureLayer
        }, function(v55) --[[ Line: 223 ]]
            -- upvalues: l_AppUserLayers_0 (ref)
            local v56 = v55[l_AppUserLayers_0.PlayButtonUXExposureLayer] or {};
            return v56.HasJoinTextButton, v56.HasIconPlayButton, v56.HasPlayButtonLoadingSkeleton;
        end, true);
        v52 = v57;
        v53 = v58;
        v54 = v59;
    end;
    local v60 = if l_FFlagLuaAppSupportUnifiedUIBloxPlayButton_0 then l_useTokens_0() else nil;
    local v61 = false;
    local v62 = false;
    local v63 = false;
    local v64 = v40.buttonSize or l_InputSize_0.Medium;
    local v65 = l_FFlagLuaAppSupportUnifiedUIBloxPlayButton_0 and v40.width and "Fill" or v40.fillBehavior;
    local v66 = nil;
    local v67 = nil;
    local v68 = nil;
    local v69 = nil;
    local v70 = nil;
    if l_playButtonState_0 == v25.Loading then
        if v40.hideIfLoading then
            return nil;
        else
            if v33 and not (l_FFlagLuaAppSupportUnifiedUIBloxPlayButton_0 and v40.useUIBloxButton) and (not l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 or v54) then
                local v71 = v39[v64] or "Size_1000";
                local v72 = v60 and v60.Size[v71];
                v70 = if v65 == "Fill" then UDim.new(1, 0) else UDim.new(0, v72);
                local v73 = UDim2.new(v70, UDim.new(0, v72));
                local l_l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0_0 = l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0;
                local v75 = v2.createElement(l_Skeleton_0, {
                    Size = if l_l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0_0 then UDim2.fromScale(1, 1) else v73, 
                    radius = l_Radius_0.Medium, 
                    ZIndex = 2
                });
                v69 = if l_l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0_0 then v2.createElement("TextButton", {
                    Size = v73, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Text = "", 
                    AutoButtonColor = false, 
                    ZIndex = 2, 
                    [v2.Event.Activated] = v48
                }, {
                    Skeleton = v75
                }) else v75;
                v63 = true;
            end;
            v66 = l_ButtonVariant_0.Emphasis;
        end;
    elseif l_playButtonState_0 == v25.Playable then
        v66 = l_ButtonVariant_0.Emphasis;
        if v31 and (not l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 or v52) then
            v68 = v40.playableText or v51.join;
        else
            if not v32 and not v40.hidePlayableIcon then
                v67 = "icons/common/play";
            end;
            v68 = v40.playableText;
            if v32 and not v40.hidePlayableIcon then
                v67 = v68 and v68 ~= "" and "icons/common/play" or v35;
            end;
        end;
    elseif l_GetFFlagIsSquadEnabled_0() and l_playButtonState_0 == v25.PlayableWithParty then
        v67 = v36;
        v68 = if v40.hideOptionalText then nil else v51.joinWithParty;
        v61 = true;
    elseif l_GetFFlagIsSquadEnabled_0() and l_playButtonState_0 == v25.WaitingForParty then
        v67 = v36;
        v68 = if v40.hideOptionalText then nil else v51.waitingForParty;
        v63 = true;
        v62 = true;
        v61 = true;
    elseif l_playButtonState_0 == v25.PaidAccess then
        v68 = tostring(v44 and v44.price or 0);
        v66 = l_ButtonVariant_0.Emphasis;
        v67 = "icons/common/robux";
    elseif l_playButtonState_0 == v25.FiatPaidAccess then
        v66 = l_ButtonVariant_0.Emphasis;
        local v76 = v44 and v44.localizedFiatPrice or "";
        v68 = v40.fiatText or v76;
    elseif l_playButtonState_0 == v25.ActionNeeded then
        v66 = l_ButtonVariant_0.SubEmphasis;
        v67 = "icons/status/private";
        v68 = if v40.hideOptionalText then nil else v51.join;
    elseif l_playButtonState_0 == v25.UnplayableOther then
        if v40.hideIfUnplayable then
            return nil;
        else
            v66 = l_ButtonVariant_0.Subtle;
            v67 = "icons/status/unavailable";
            v68 = if v40.hideOptionalText then nil else v51.unavailable;
            v63 = true;
        end;
    else
        error("invalid play button state!");
    end;
    local v77 = nil;
    if v61 then
        v77 = v2.createElement(l_ComboButton_0, {
            layoutOrder = if l_FFlagLuaAppSupportUnifiedUIBloxPlayButton_0 then nil else v40.LayoutOrder, 
            position = if l_FFlagLuaAppSupportUnifiedUIBloxPlayButton_0 then nil else v40.Position, 
            size = UDim2.new(v40.width or UDim.new(1, 0), v40.squadButtonHeight or UDim.new(1, 0)), 
            button = {
                icon = v67, 
                text = v68, 
                isDisabled = v63, 
                onActivated = if not v63 then v48 else function() --[[ Line: 358 ]]

                end
            }, 
            overflow = {
                icon = v37, 
                isDisabled = v62, 
                onActivated = if not v62 then v50 else function() --[[ Line: 363 ]]

                end
            }, 
            testId = v40.testId
        });
    elseif l_FFlagLuaAppSupportUnifiedUIBloxPlayButton_0 and v40.useUIBloxButton then
        local v78 = v39[v64] or "Size_1000";
        local v79 = if v60 and v60.Size[v78] then v60.Size[v78] else 40;
        local v80 = v65 == "Fit";
        local v81 = if v80 then UDim2.new(0, 0, 0, v79) else UDim2.new(1, 0, 0, v79);
        local v82 = l_playButtonState_0 == v25.Loading;
        local v83 = if v66 == l_ButtonVariant_0.SubEmphasis then l_ButtonType_0.PrimarySystem else if v66 == l_ButtonVariant_0.Subtle then l_ButtonType_0.Secondary else l_ButtonType_0.PrimaryContextual;
        local v84 = if v67 == v35 then v36 else v67;
        if type(v84) == "string" then
            v84 = l_Images_0[v84];
        end;
        v77 = v2.createElement(l_Button_0, {
            size = v81, 
            fitContent = v80, 
            buttonType = v83, 
            icon = v84, 
            text = v68, 
            isLoading = v82, 
            isDisabled = v63 or v82, 
            userInteractionEnabled = not (v63 or v82), 
            onActivated = if not not v63 or v82 then v38 else v48, 
            [v2.Tag] = if v40.testId then ("data-testid=%*"):format(v40.testId) else nil
        });
        if l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 and v82 then
            v69 = v2.createElement("TextButton", {
                Size = v81, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = "", 
                AutoButtonColor = false, 
                ZIndex = 2, 
                [v2.Event.Activated] = v48
            });
        end;
    else
        local v85 = if v32 then (not (v68 ~= nil) or v68 == "") and v67 ~= nil else nil;
        v77 = if v32 and (not l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 or v53) and v85 then v2.createElement(l_IconButton_0, {
            LayoutOrder = if l_FFlagLuaAppSupportUnifiedUIBloxPlayButton_0 then nil else v40.LayoutOrder, 
            Position = if l_FFlagLuaAppSupportUnifiedUIBloxPlayButton_0 then nil else v40.Position, 
            icon = v67, 
            variant = v66, 
            size = v64, 
            width = if v33 and l_playButtonState_0 == v25.Loading then v70 else if l_FFlagLuaAppSupportUnifiedUIBloxPlayButton_0 then nil else v40.width, 
            fillBehavior = v65, 
            isDisabled = v63, 
            onActivated = if not v63 then v48 else v38, 
            testId = v40.testId
        }) else v2.createElement(l_Button_1, {
            LayoutOrder = if l_FFlagLuaAppSupportUnifiedUIBloxPlayButton_0 then nil else v40.LayoutOrder, 
            Position = if l_FFlagLuaAppSupportUnifiedUIBloxPlayButton_0 then nil else v40.Position, 
            icon = v67, 
            text = v68, 
            variant = v66, 
            size = v64, 
            width = if v33 and l_playButtonState_0 == v25.Loading then v70 else if l_FFlagLuaAppSupportUnifiedUIBloxPlayButton_0 then nil else v40.width, 
            fillBehavior = v65, 
            isDisabled = v63, 
            onActivated = if not v63 then v48 else v38, 
            testId = v40.testId
        });
    end;
    if l_FFlagLuaAppSupportUnifiedUIBloxPlayButton_0 then
        return v2.createElement("Frame", {
            LayoutOrder = v40.LayoutOrder, 
            Position = v40.Position, 
            Size = if v40.width then UDim2.new(v40.width, UDim.new(0, 0)) else if v65 == "Fill" then UDim2.new(1, 0, 1, 0) else nil, 
            AutomaticSize = if v65 == "Fill" then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            LoadingSkeleton = if l_playButtonState_0 == v25.Loading then v69 else nil, 
            PlayButton = v77
        });
    else
        return v77;
    end;
end);