local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Responsive);
local l_GetInputModeStore_0 = v3.GetInputModeStore;
local _ = require(l_Parent_0.Foundation);
local v6 = require(l_Parent_0.Cryo);
local v7 = require(l_Parent_0.DiscoveryAnalytics);
local l_localizeStrings_0 = require(l_Parent_0.Localization).localizeStrings;
local v9 = require(l_Parent_0.SduiCoreSystem);
local l_SduiActionType_0 = v9.SduiActionType;
local l_SduiBuilder_0 = v9.SduiBuilder;
local l_SduiErrors_0 = v9.SduiErrors;
local l_SduiPlayButton_0 = require(l_Parent_0.SduiSharedContent).SduiPlayButton;
local l_SduiParsers_0 = v9.SduiParsers;
local l_SduiParseHelpers_0 = v9.SduiParseHelpers;
local l_useUidRefString_0 = v9.useUidRefString;
local l_default_0 = require(l_Parent_0.GameTile).HoverTileCoordinator.default;
local v18 = require(l_script_FirstAncestor_0.Content.SduiTile);
local v19 = require(l_script_FirstAncestor_0.Content.SduiGameTileFooter);
local v20 = require(l_script_FirstAncestor_0.FocusNavigation.SduiHoldToPlay);
local l_FFlagSduiTileDisableLegacyHover_0 = require(l_script_FirstAncestor_0.Flags).FFlagSduiTileDisableLegacyHover;
return v2.memo(function(v22) --[[ Line: 57 ]] --[[ Name: SduiGameTile ]]
    -- upvalues: l_useUidRefString_0 (copy), v2 (copy), l_SduiErrors_0 (copy), l_GetInputModeStore_0 (copy), l_SduiParseHelpers_0 (copy), l_SduiParsers_0 (copy), l_SduiActionType_0 (copy), l_default_0 (copy), v3 (copy), l_SduiBuilder_0 (copy), l_FFlagSduiTileDisableLegacyHover_0 (copy), l_SduiPlayButton_0 (copy), l_localizeStrings_0 (copy), v7 (copy), v20 (copy), v19 (copy), v18 (copy), v6 (copy)
    local l_current_0 = l_useUidRefString_0().current;
    local l_universeId_0 = v22.universeId;
    local l_placeId_0 = v22.placeId;
    local v26 = v2.useRef(nil);
    local v28 = v2.useCallback(function(v27) --[[ Line: 65 ]]
        -- upvalues: v26 (copy), v22 (copy)
        v26.current = v27;
        if v22.setGuiObject then
            v22.setGuiObject(v27);
        end;
    end, {
        v22.setGuiObject
    });
    local v29 = v2.useRef(false);
    local v31 = v2.useCallback(function(v30) --[[ Line: 73 ]]
        -- upvalues: v29 (copy)
        v29.current = v30;
    end, {});
    local v39 = v2.useCallback(function() --[[ Line: 77 ]]
        -- upvalues: v22 (copy), l_SduiErrors_0 (ref), l_GetInputModeStore_0 (ref), l_SduiParseHelpers_0 (ref), v29 (copy), l_SduiParsers_0 (ref), l_SduiActionType_0 (ref), l_placeId_0 (copy), l_universeId_0 (copy)
        v22.sduiContext.dependencies.logger.reportCounter(l_SduiErrors_0.SduiCounterName.GameTileActivated, {
            name = l_GetInputModeStore_0(false).getLastInputType(false)
        }, true);
        local function v35(v32) --[[ Line: 82 ]] --[[ Name: logFailure ]]
            -- upvalues: l_SduiParseHelpers_0 (ref), v22 (ref), l_SduiErrors_0 (ref), l_GetInputModeStore_0 (ref)
            local v33 = if v32 then l_SduiParseHelpers_0.stringifyValue(v32) else "";
            local v34 = l_SduiParseHelpers_0.stringifyValue(v22.componentConfig);
            v22.sduiContext.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.FailedToExecuteAction, {
                componentType = "GameTile", 
                message = ("Error executing GameTile.onActivated error: '%*' config: %*"):format(v33, v34), 
                name = l_GetInputModeStore_0(false).getLastInputType(false)
            }, v22.sduiContext.appPage);
        end;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 92 ]]
            -- upvalues: v29 (ref), v22 (ref), l_SduiParsers_0 (ref), l_SduiActionType_0 (ref), l_placeId_0 (ref), l_universeId_0 (ref), l_SduiErrors_0 (ref), l_GetInputModeStore_0 (ref), v35 (copy)
            if not v29.current then
                if v22.onActivated then
                    v22.onActivated();
                    return;
                else
                    local v36 = l_SduiParsers_0.safeParseCallback({
                        actionType = l_SduiActionType_0.OpenGameDetails, 
                        actionParams = {
                            placeId = l_placeId_0, 
                            universeId = l_universeId_0
                        }
                    }, v22.sduiContext, v22.analyticsContext);
                    if v36 then
                        v22.sduiContext.dependencies.logger.reportCounter(l_SduiErrors_0.SduiCounterName.GameTileActivatedExecuteCallback, {
                            name = l_GetInputModeStore_0(false).getLastInputType(false)
                        }, true);
                        v36();
                        return;
                    else
                        v35("Callback is nil after parsing");
                        return;
                    end;
                end;
            else
                v22.sduiContext.dependencies.logger.reportCounter(l_SduiErrors_0.SduiCounterName.GameTileActivatedWhenDisabled, {
                    name = l_GetInputModeStore_0(false).getLastInputType(false)
                });
                return;
            end;
        end);
        if not l_status_0 then
            v35(l_result_0);
        end;
    end, {
        v22.onActivated, 
        v22.sduiContext, 
        v22.analyticsContext, 
        l_placeId_0, 
        l_universeId_0, 
        v22.componentConfig
    });
    local v40, v41 = v2.useState(false);
    local v42, v43 = v2.useState(false);
    local v44 = v2.useCallback(function() --[[ Line: 137 ]]
        -- upvalues: v41 (copy), v22 (copy)
        v41(true);
        if v22.setCustomConditionState then
            v22.setCustomConditionState("selected", true);
        end;
    end, {
        v22.setCustomConditionState
    });
    local v45 = v2.useCallback(function() --[[ Line: 144 ]]
        -- upvalues: v41 (copy), v22 (copy)
        v41(false);
        if v22.setCustomConditionState then
            v22.setCustomConditionState("selected", false);
        end;
    end, {
        v22.setCustomConditionState
    });
    local v46 = v2.useRef(0);
    if v42 == false then
        v46.current = 0;
    end;
    local l_default_1 = l_default_0.default;
    local v49 = v2.useCallback(function() --[[ Line: 168 ]]
        -- upvalues: v46 (copy), l_current_0 (copy), l_GetInputModeStore_0 (ref), v3 (ref), l_default_1 (copy)
        if v46.current == 0 and l_current_0 and l_GetInputModeStore_0(false).getLastInputType(false) == v3.Input.Pointer then
            l_default_1:requestHover(l_current_0);
        end;
        local l_v46_0 = v46;
        l_v46_0.current = l_v46_0.current + 1;
    end, {
        l_current_0
    });
    local v51 = v2.useCallback(function() --[[ Line: 178 ]]
        -- upvalues: v46 (copy), l_current_0 (copy), l_default_1 (copy)
        local l_v46_1 = v46;
        l_v46_1.current = l_v46_1.current - 1;
        if v46.current < 0 then
            v46.current = 0;
        end;
        if v46.current == 0 and l_current_0 then
            l_default_1:cancelHover(l_current_0);
        end;
    end, {
        l_current_0
    });
    v2.useEffect(function() --[[ Line: 188 ]]
        -- upvalues: l_current_0 (copy), v42 (copy), l_default_1 (copy), v43 (copy), v22 (copy), v46 (copy)
        local l_l_current_0_0 = l_current_0;
        local l_v42_0 = v42;
        local v54 = nil;
        v54 = l_default_1.changed:connect(function(v55) --[[ Line: 192 ]]
            -- upvalues: l_current_0 (ref), v43 (ref), v22 (ref), l_v42_0 (ref)
            local v56 = v55 == l_current_0;
            v43(v56);
            if v22.setCustomConditionState and v56 ~= l_v42_0 then
                v22.setCustomConditionState("hovered", v56);
            end;
            l_v42_0 = v56;
        end);
        return function() --[[ Line: 201 ]]
            -- upvalues: l_default_1 (ref), l_l_current_0_0 (copy), v46 (ref), v54 (ref)
            l_default_1:cancelHover(l_l_current_0_0);
            v46.current = 0;
            if v54 ~= nil then
                v54:disconnect();
            end;
        end;
    end, {
        l_current_0, 
        v22.setCustomConditionState
    });
    local v60 = v2.useMemo(function() --[[ Line: 212 ]]
        -- upvalues: v22 (copy), v42 (copy), l_SduiBuilder_0 (ref), l_universeId_0 (copy), l_placeId_0 (copy), l_FFlagSduiTileDisableLegacyHover_0 (ref), v2 (ref), l_SduiPlayButton_0 (ref), l_localizeStrings_0 (ref)
        if v22.ctaButtonComponent then
            return v22.ctaButtonComponent;
        elseif not v42 then
            return nil;
        else
            local v57 = l_SduiBuilder_0.buildAnalyticsContext({}, v22.analyticsContext, {
                universeId = l_universeId_0, 
                placeId = l_placeId_0, 
                eventContext = "ExperienceTile", 
                referralSource = v22.sduiContext.appPage
            });
            if not l_FFlagSduiTileDisableLegacyHover_0 and v22.enableLegacyHoverState then
                return v2.createElement(l_SduiPlayButton_0, {
                    universeId = l_universeId_0, 
                    placeId = l_placeId_0, 
                    buttonSize = "Medium", 
                    fillBehavior = "Fill", 
                    isPlayableWhenLoading = true, 
                    squadButtonHeight = UDim.new(0, 40), 
                    sduiContext = v22.sduiContext, 
                    analyticsContext = v57
                });
            else
                local l_localization_0 = v22.sduiContext.dependencies.localization;
                local v59 = l_localizeStrings_0(l_localization_0, {
                    Join = "Common.VisitGame.Label.Play"
                });
                return v2.createElement(l_SduiPlayButton_0, {
                    universeId = l_universeId_0, 
                    placeId = l_placeId_0, 
                    sduiContext = v22.sduiContext, 
                    playableText = v59.Join, 
                    hidePlayableIcon = true, 
                    height = 40, 
                    width = UDim.new(0, 60), 
                    buttonSize = "Medium", 
                    analyticsContext = v57, 
                    hideOptionalText = true, 
                    isPlayableWhenLoading = true, 
                    squadButtonHeight = UDim.new(0, 40)
                });
            end;
        end;
    end, {
        v42, 
        v22.enableLegacyHoverState, 
        l_universeId_0, 
        l_placeId_0, 
        v22.ctaButtonComponent, 
        v22.analyticsContext, 
        v22.sduiContext
    });
    local v64 = if l_FFlagSduiTileDisableLegacyHover_0 then nil else v2.useCallback(function(v61, v62, v63) --[[ Line: 275 ]]
        -- upvalues: v22 (copy), v2 (ref), v49 (copy), v51 (copy), v60 (copy)
        if v22.enableLegacyHoverState then
            return v2.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Position = UDim2.new(0, -v61, 0, -v61), 
                Size = UDim2.new(1, v61 * 2, 0, 0), 
                BackgroundColor3 = v62, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 0, 
                [v2.Event.MouseEnter] = v49, 
                [v2.Event.MouseLeave] = v51
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalFlex = Enum.UIFlexAlignment.Fill
                }), 
                UIPadding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v61), 
                    PaddingRight = UDim.new(0, v61), 
                    PaddingBottom = UDim.new(0, v61), 
                    PaddingTop = UDim.new(0, v61 * 2)
                }), 
                UICorner = v2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v63)
                }), 
                ctaButtonComponent = v60
            });
        else
            return nil;
        end;
    end, {
        v60, 
        v49, 
        v51, 
        v22.enableLegacyHoverState
    });
    local v65 = nil;
    if v40 then
        if v22.focusNavActionsComponent then
            v65 = v2.cloneElement(v22.focusNavActionsComponent, {
                extraLocalProps = {
                    guiObject = v26.current
                }
            });
        elseif not v22.disableHoldToPlay then
            local v66 = l_SduiBuilder_0.buildAnalyticsContext({}, v22.analyticsContext, {
                eventContext = v7.Constants.Context.HoldToPlayLauncher, 
                referralSource = v22.sduiContext.appPage
            });
            v65 = v2.createElement(v20, {
                sduiContext = v22.sduiContext, 
                analyticsContext = v66, 
                universeId = l_universeId_0, 
                placeId = v22.placeId, 
                guiObject = v26.current, 
                setDisabledForHold = v31
            });
        end;
    end;
    local v67 = v2.useMemo(function() --[[ Line: 335 ]]
        -- upvalues: v22 (copy), v2 (ref), v19 (ref), v42 (copy), v40 (copy), l_universeId_0 (copy), l_placeId_0 (copy)
        if v22.disableDefaultFooterLogic then
            return v22.footerComponent;
        else
            return v2.createElement(v19, {
                isHovered = v42, 
                isSelected = v40, 
                ageRatingText = v22.ageRatingText, 
                footerComponent = v22.footerComponent, 
                sduiContext = v22.sduiContext, 
                universeId = l_universeId_0, 
                placeId = l_placeId_0, 
                analyticsContext = v22.analyticsContext, 
                ratingText = v22.ratingText, 
                playerCount = v22.playerCount
            });
        end;
    end, {
        v42, 
        v40, 
        l_universeId_0, 
        l_placeId_0, 
        v22.ageRatingText, 
        v22.disableDefaultFooterLogic, 
        v22.footerComponent, 
        v22.sduiContext, 
        v22.analyticsContext, 
        v22.ratingText, 
        v22.playerCount
    });
    return v2.createElement(v18, v6.Dictionary.join(v22, {
        ctaButtonComponent = v60, 
        onMouseEnter = v49, 
        onMouseLeave = v51, 
        onSelectionGained = v44, 
        onSelectionLost = v45, 
        renderLegacyHoverState = if l_FFlagSduiTileDisableLegacyHover_0 then nil else v64, 
        isHovered = v42, 
        setGuiObject = v28, 
        onActivated = v39, 
        focusNavActionsComponent = v65, 
        footerComponent = v67, 
        testId = "--sdui-game-tile"
    }));
end);