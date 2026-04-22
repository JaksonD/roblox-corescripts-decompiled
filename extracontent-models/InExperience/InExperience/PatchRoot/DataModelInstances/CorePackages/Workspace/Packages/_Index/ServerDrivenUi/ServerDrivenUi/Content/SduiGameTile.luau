local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Responsive);
local l_GetInputModeStore_0 = v3.GetInputModeStore;
local v5 = require(l_Parent_0.Foundation);
local v6 = require(l_Parent_0.Cryo);
local v7 = require(l_Parent_0.DiscoveryAnalytics);
local l_localizeStrings_0 = require(l_Parent_0.Localization).localizeStrings;
local l_useTokens_0 = v5.Hooks.useTokens;
local l_usePreferences_0 = v5.Hooks.usePreferences;
local v11 = require(l_Parent_0.SduiCoreSystem);
local l_SduiActionType_0 = v11.SduiActionType;
local l_SduiBuilder_0 = v11.SduiBuilder;
local l_SduiErrors_0 = v11.SduiErrors;
local l_SduiPlayButton_0 = require(l_Parent_0.SduiSharedContent).SduiPlayButton;
local l_SduiParsers_0 = v11.SduiParsers;
local l_SduiParseHelpers_0 = v11.SduiParseHelpers;
local l_useUidRefString_0 = v11.useUidRefString;
local v19 = require(l_Parent_0.GameTile);
local l_default_0 = v19.HoverTileCoordinator.default;
local l_ZoomAnimatedFrame_0 = v19.ZoomAnimatedFrame;
local v22 = require(l_script_FirstAncestor_0.Content.SduiTile);
local v23 = require(l_script_FirstAncestor_0.Content.SduiGameTileFooter);
local v24 = require(l_script_FirstAncestor_0.FocusNavigation.SduiHoldToPlay);
local l_FFlagSduiTileDisableLegacyHover_0 = require(l_script_FirstAncestor_0.Flags).FFlagSduiTileDisableLegacyHover;
local l_FFlagSduiCarouselHoverFixes_0 = require(l_Parent_0.SharedFlags).FFlagSduiCarouselHoverFixes;
local l_FFlagLuaAppResetHoverOnSduiPlayButtonActivation_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppResetHoverOnSduiPlayButtonActivation;
return v2.memo(function(v28) --[[ Line: 64 ]] --[[ Name: SduiGameTile ]]
    -- upvalues: l_FFlagSduiCarouselHoverFixes_0 (copy), l_useTokens_0 (copy), l_usePreferences_0 (copy), l_FFlagSduiTileDisableLegacyHover_0 (copy), l_useUidRefString_0 (copy), v2 (copy), l_SduiErrors_0 (copy), l_GetInputModeStore_0 (copy), l_SduiParseHelpers_0 (copy), l_SduiParsers_0 (copy), l_SduiActionType_0 (copy), l_default_0 (copy), v3 (copy), l_FFlagLuaAppResetHoverOnSduiPlayButtonActivation_0 (copy), l_SduiBuilder_0 (copy), l_SduiPlayButton_0 (copy), l_localizeStrings_0 (copy), v7 (copy), v24 (copy), v23 (copy), v22 (copy), v6 (copy), l_ZoomAnimatedFrame_0 (copy)
    local v29 = nil;
    local v30 = nil;
    local v31 = nil;
    if l_FFlagSduiCarouselHoverFixes_0 then
        v29 = l_useTokens_0();
        v30 = l_usePreferences_0();
        v31 = not l_FFlagSduiTileDisableLegacyHover_0 and v28.enableLegacyHoverState;
    end;
    local l_current_0 = l_useUidRefString_0().current;
    local l_universeId_0 = v28.universeId;
    local l_placeId_0 = v28.placeId;
    local v35 = v2.useRef(nil);
    local v37 = v2.useCallback(function(v36) --[[ Line: 80 ]]
        -- upvalues: v35 (copy), v28 (copy)
        v35.current = v36;
        if v28.setGuiObject then
            v28.setGuiObject(v36);
        end;
    end, {
        v28.setGuiObject
    });
    local v38 = v2.useRef(false);
    local v40 = v2.useCallback(function(v39) --[[ Line: 88 ]]
        -- upvalues: v38 (copy)
        v38.current = v39;
    end, {});
    local v48 = v2.useCallback(function() --[[ Line: 92 ]]
        -- upvalues: v28 (copy), l_SduiErrors_0 (ref), l_GetInputModeStore_0 (ref), l_SduiParseHelpers_0 (ref), v38 (copy), l_SduiParsers_0 (ref), l_SduiActionType_0 (ref), l_placeId_0 (copy), l_universeId_0 (copy)
        v28.sduiContext.dependencies.logger.reportCounter(l_SduiErrors_0.SduiCounterName.GameTileActivated, {
            name = l_GetInputModeStore_0(false).getLastInputType(false)
        }, true);
        local function v44(v41) --[[ Line: 97 ]] --[[ Name: logFailure ]]
            -- upvalues: l_SduiParseHelpers_0 (ref), v28 (ref), l_SduiErrors_0 (ref), l_GetInputModeStore_0 (ref)
            local v42 = if v41 then l_SduiParseHelpers_0.stringifyValue(v41) else "";
            local v43 = l_SduiParseHelpers_0.stringifyValue(v28.componentConfig);
            v28.sduiContext.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.FailedToExecuteAction, {
                componentType = "GameTile", 
                message = ("Error executing GameTile.onActivated error: '%*' config: %*"):format(v42, v43), 
                name = l_GetInputModeStore_0(false).getLastInputType(false)
            }, v28.sduiContext.appPage);
        end;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 107 ]]
            -- upvalues: v38 (ref), v28 (ref), l_SduiParsers_0 (ref), l_SduiActionType_0 (ref), l_placeId_0 (ref), l_universeId_0 (ref), l_SduiErrors_0 (ref), l_GetInputModeStore_0 (ref), v44 (copy)
            if not v38.current then
                if v28.onActivated then
                    v28.onActivated();
                    return;
                else
                    local v45 = l_SduiParsers_0.safeParseCallback({
                        actionType = l_SduiActionType_0.OpenGameDetails, 
                        actionParams = {
                            placeId = l_placeId_0, 
                            universeId = l_universeId_0
                        }
                    }, v28.sduiContext, v28.analyticsContext);
                    if v45 then
                        v28.sduiContext.dependencies.logger.reportCounter(l_SduiErrors_0.SduiCounterName.GameTileActivatedExecuteCallback, {
                            name = l_GetInputModeStore_0(false).getLastInputType(false)
                        }, true);
                        v45();
                        return;
                    else
                        v44("Callback is nil after parsing");
                        return;
                    end;
                end;
            else
                v28.sduiContext.dependencies.logger.reportCounter(l_SduiErrors_0.SduiCounterName.GameTileActivatedWhenDisabled, {
                    name = l_GetInputModeStore_0(false).getLastInputType(false)
                });
                return;
            end;
        end);
        if not l_status_0 then
            v44(l_result_0);
        end;
    end, {
        v28.onActivated, 
        v28.sduiContext, 
        v28.analyticsContext, 
        l_placeId_0, 
        l_universeId_0, 
        v28.componentConfig
    });
    local v49, v50 = v2.useState(false);
    local v51, v52 = v2.useState(false);
    local v53 = v2.useCallback(function() --[[ Line: 152 ]]
        -- upvalues: v50 (copy), v28 (copy)
        v50(true);
        if v28.setCustomConditionState then
            v28.setCustomConditionState("selected", true);
        end;
    end, {
        v28.setCustomConditionState
    });
    local v54 = v2.useCallback(function() --[[ Line: 159 ]]
        -- upvalues: v50 (copy), v28 (copy)
        v50(false);
        if v28.setCustomConditionState then
            v28.setCustomConditionState("selected", false);
        end;
    end, {
        v28.setCustomConditionState
    });
    local v55 = v2.useRef(0);
    if v51 == false then
        v55.current = 0;
    end;
    local l_default_1 = l_default_0.default;
    local v58 = v2.useCallback(function() --[[ Line: 183 ]]
        -- upvalues: v55 (copy), l_current_0 (copy), l_GetInputModeStore_0 (ref), v3 (ref), l_default_1 (copy)
        if v55.current == 0 and l_current_0 and l_GetInputModeStore_0(false).getLastInputType(false) == v3.Input.Pointer then
            l_default_1:requestHover(l_current_0);
        end;
        local l_v55_0 = v55;
        l_v55_0.current = l_v55_0.current + 1;
    end, {
        l_current_0
    });
    local v60 = v2.useCallback(function() --[[ Line: 193 ]]
        -- upvalues: v55 (copy), l_current_0 (copy), l_default_1 (copy)
        local l_v55_1 = v55;
        l_v55_1.current = l_v55_1.current - 1;
        if v55.current < 0 then
            v55.current = 0;
        end;
        if v55.current == 0 and l_current_0 then
            l_default_1:cancelHover(l_current_0);
        end;
    end, {
        l_current_0
    });
    v2.useEffect(function() --[[ Line: 203 ]]
        -- upvalues: l_current_0 (copy), v51 (copy), l_default_1 (copy), v52 (copy), v28 (copy), v55 (copy)
        local l_l_current_0_0 = l_current_0;
        local l_v51_0 = v51;
        local v63 = nil;
        v63 = l_default_1.changed:connect(function(v64) --[[ Line: 207 ]]
            -- upvalues: l_current_0 (ref), v52 (ref), v28 (ref), l_v51_0 (ref)
            local v65 = v64 == l_current_0;
            v52(v65);
            if v28.setCustomConditionState and v65 ~= l_v51_0 then
                v28.setCustomConditionState("hovered", v65);
            end;
            l_v51_0 = v65;
        end);
        return function() --[[ Line: 216 ]]
            -- upvalues: l_default_1 (ref), l_l_current_0_0 (copy), v55 (ref), v63 (ref)
            l_default_1:cancelHover(l_l_current_0_0);
            v55.current = 0;
            if v63 ~= nil then
                v63:disconnect();
            end;
        end;
    end, {
        l_current_0, 
        v28.setCustomConditionState
    });
    local v66 = if l_FFlagLuaAppResetHoverOnSduiPlayButtonActivation_0 then v2.useCallback(function() --[[ Line: 227 ]]
        -- upvalues: v51 (copy), l_default_1 (copy)
        if v51 then
            l_default_1:reset();
        end;
    end, {
        v51
    }) else nil;
    local v70 = v2.useMemo(function() --[[ Line: 235 ]]
        -- upvalues: v28 (copy), v51 (copy), l_SduiBuilder_0 (ref), l_universeId_0 (copy), l_placeId_0 (copy), l_FFlagSduiTileDisableLegacyHover_0 (ref), v2 (ref), l_SduiPlayButton_0 (ref), l_FFlagLuaAppResetHoverOnSduiPlayButtonActivation_0 (ref), v66 (copy), l_localizeStrings_0 (ref)
        if v28.ctaButtonComponent then
            return v28.ctaButtonComponent;
        elseif not v51 then
            return nil;
        else
            local v67 = l_SduiBuilder_0.buildAnalyticsContext({}, v28.analyticsContext, {
                universeId = l_universeId_0, 
                placeId = l_placeId_0, 
                eventContext = "ExperienceTile", 
                referralSource = v28.sduiContext.appPage
            });
            if not l_FFlagSduiTileDisableLegacyHover_0 and v28.enableLegacyHoverState then
                return v2.createElement(l_SduiPlayButton_0, {
                    universeId = l_universeId_0, 
                    placeId = l_placeId_0, 
                    buttonSize = "Medium", 
                    fillBehavior = "Fill", 
                    isPlayableWhenLoading = true, 
                    squadButtonHeight = UDim.new(0, 40), 
                    sduiContext = v28.sduiContext, 
                    analyticsContext = v67, 
                    onActivatedEffect = if l_FFlagLuaAppResetHoverOnSduiPlayButtonActivation_0 then v66 else nil
                });
            else
                local l_localization_0 = v28.sduiContext.dependencies.localization;
                local v69 = l_localizeStrings_0(l_localization_0, {
                    Join = "Common.VisitGame.Label.Play"
                });
                return v2.createElement(l_SduiPlayButton_0, {
                    universeId = l_universeId_0, 
                    placeId = l_placeId_0, 
                    sduiContext = v28.sduiContext, 
                    playableText = v69.Join, 
                    hidePlayableIcon = true, 
                    height = 40, 
                    width = UDim.new(0, 60), 
                    buttonSize = "Medium", 
                    analyticsContext = v67, 
                    hideOptionalText = true, 
                    isPlayableWhenLoading = true, 
                    squadButtonHeight = UDim.new(0, 40), 
                    onActivatedEffect = if l_FFlagLuaAppResetHoverOnSduiPlayButtonActivation_0 then v66 else nil
                });
            end;
        end;
    end, {
        v51, 
        v28.enableLegacyHoverState, 
        l_universeId_0, 
        l_placeId_0, 
        v28.ctaButtonComponent, 
        v28.analyticsContext, 
        v28.sduiContext, 
        if l_FFlagLuaAppResetHoverOnSduiPlayButtonActivation_0 then v66 else nil
    });
    local v74 = if l_FFlagSduiTileDisableLegacyHover_0 then nil else v2.useCallback(function(v71, v72, v73) --[[ Line: 305 ]]
        -- upvalues: v28 (copy), v2 (ref), v58 (copy), v60 (copy), v70 (copy)
        if v28.enableLegacyHoverState then
            return v2.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Position = UDim2.new(0, -v71, 0, -v71), 
                Size = UDim2.new(1, v71 * 2, 0, 0), 
                BackgroundColor3 = v72, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 0, 
                [v2.Event.MouseEnter] = v58, 
                [v2.Event.MouseLeave] = v60
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalFlex = Enum.UIFlexAlignment.Fill
                }), 
                UIPadding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v71), 
                    PaddingRight = UDim.new(0, v71), 
                    PaddingBottom = UDim.new(0, v71), 
                    PaddingTop = UDim.new(0, v71 * 2)
                }), 
                UICorner = v2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v73)
                }), 
                ctaButtonComponent = v70
            });
        else
            return nil;
        end;
    end, {
        v70, 
        v58, 
        v60, 
        v28.enableLegacyHoverState
    });
    local v75 = nil;
    if v49 then
        if v28.focusNavActionsComponent then
            v75 = v2.cloneElement(v28.focusNavActionsComponent, {
                extraLocalProps = {
                    guiObject = v35.current
                }
            });
        elseif not v28.disableHoldToPlay then
            local v76 = l_SduiBuilder_0.buildAnalyticsContext({}, v28.analyticsContext, {
                eventContext = v7.Constants.Context.HoldToPlayLauncher, 
                referralSource = v28.sduiContext.appPage
            });
            v75 = v2.createElement(v24, {
                sduiContext = v28.sduiContext, 
                analyticsContext = v76, 
                universeId = l_universeId_0, 
                placeId = v28.placeId, 
                guiObject = v35.current, 
                setDisabledForHold = v40
            });
        end;
    end;
    local v77 = v2.useMemo(function() --[[ Line: 365 ]]
        -- upvalues: v28 (copy), v2 (ref), v23 (ref), v51 (copy), v49 (copy), l_universeId_0 (copy), l_placeId_0 (copy)
        if v28.disableDefaultFooterLogic then
            return v28.footerComponent;
        else
            return v2.createElement(v23, {
                isHovered = v51, 
                isSelected = v49, 
                ageRatingText = v28.ageRatingText, 
                footerComponent = v28.footerComponent, 
                sduiContext = v28.sduiContext, 
                universeId = l_universeId_0, 
                placeId = l_placeId_0, 
                analyticsContext = v28.analyticsContext, 
                ratingText = v28.ratingText, 
                playerCount = v28.playerCount
            });
        end;
    end, {
        v51, 
        v49, 
        l_universeId_0, 
        l_placeId_0, 
        v28.ageRatingText, 
        v28.disableDefaultFooterLogic, 
        v28.footerComponent, 
        v28.sduiContext, 
        v28.analyticsContext, 
        v28.ratingText, 
        v28.playerCount
    });
    local v78 = v2.createElement(v22, v6.Dictionary.join(v28, {
        ctaButtonComponent = v70, 
        onMouseEnter = v58, 
        onMouseLeave = v60, 
        onSelectionGained = v53, 
        onSelectionLost = v54, 
        renderLegacyHoverState = if l_FFlagSduiTileDisableLegacyHover_0 then nil else v74, 
        isHovered = v51, 
        setGuiObject = v37, 
        onActivated = v48, 
        focusNavActionsComponent = v75, 
        footerComponent = v77, 
        testId = "--sdui-game-tile"
    }));
    if l_FFlagSduiCarouselHoverFixes_0 and v31 then
        local l_XSmall_0 = v29.Gap.XSmall;
        return v2.createElement(l_ZoomAnimatedFrame_0, {
            isZoomEnabled = v51, 
            expansionOffsetX = l_XSmall_0 * 2, 
            expansionOffsetTop = l_XSmall_0, 
            expansionOffsetBottom = l_XSmall_0, 
            reducedMotion = v30.reducedMotion
        }, {
            Tile = v78
        });
    else
        return v78;
    end;
end);