local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_IXPService_0 = game:GetService("IXPService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Players_0 = game:GetService("Players");
local l_SafetyService_0 = game:GetService("SafetyService");
local v6 = require(l_CorePackages_0.Packages.Foundation);
local v7 = require(l_CorePackages_0.Packages.React);
local l_CoreScriptsRootProvider_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider;
local v9 = require(l_script_FirstAncestor_0.Components.ReportTypeSelector);
local v10 = require(l_script_FirstAncestor_0.Components.Constants);
local l_ReportModes_0 = v10.ReportModes;
local l_ReportTypes_0 = v10.ReportTypes;
local v13 = require(l_script_FirstAncestor_0.Components.SelectInSceneReportMenu);
local v14 = require(l_script_FirstAncestor_0.Components.Containers.ReportPersonMenuItemsContainer);
local v15 = require(l_script_FirstAncestor_0.Components.Containers.ReportExperienceMenuItemsContainer);
local v16 = require(l_script_FirstAncestor_0.ReportAnything.Utility.ReportAnythingAnalytics);
local v17 = require(l_script_FirstAncestor_0.Analytics.ReportAbuseAnalytics);
local v18 = require(l_script_FirstAncestor_0.ReportAnything.Components.AnnotationModal);
local v19 = require(l_script_FirstAncestor_0.Components.ChatModalSelectorDialogController);
local v20 = require(l_script_FirstAncestor_0.Components.ModalBasedSelectorDialogController);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_setTimeout_0 = require(l_CorePackages_0.Packages.LuauPolyfill).setTimeout;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v25 = require(l_script_FirstAncestor_0.Hooks.useReportAnythingWithScreenshot);
local v26 = require(l_script_FirstAncestor_0.Utility.getMenuItemSizings);
local v27 = require(l_script_FirstAncestor_0.Reducers.analyticsReducer);
local v28 = require(l_script_FirstAncestor_0.Components.createCleanup);
local l_useTokens_0 = v6.Hooks.useTokens;
local l_Text_0 = v6.Text;
local l_View_0 = v6.View;
local v32 = require(l_CorePackages_0.Workspace.Packages.DsaIllegalContentReporting);
local l_isShowEUDSAIllegalContentReportingLink_0 = v32.isShowEUDSAIllegalContentReportingLink;
local l_DSAReportLink_0 = v32.DSAReportLink;
local l_isShowUKOSAIllegalContentReportingLink_0 = v32.isShowUKOSAIllegalContentReportingLink;
local l_OSAReportLink_0 = v32.OSAReportLink;
local l_isShowGenericIllegalContentReportingLink_0 = v32.isShowGenericIllegalContentReportingLink;
local l_GenericReportLink_0 = v32.GenericReportLink;
local v39 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusRoot_0 = v39.FocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v39.FocusNavigableSurfaceIdentifierEnum;
local v42 = require(l_script_FirstAncestor_0.Flags.isAbuseReportMenuOpenCloseSignalEnabled);
local v43 = require(l_script_FirstAncestor_0.Flags.GetFFlagWHAM1707ExperimentForceEnabled);
local v44 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FStringReportMenuIXPLayer_0 = v44.FStringReportMenuIXPLayer;
local l_FStringEARReportMenuIXPLayer_0 = v44.FStringEARReportMenuIXPLayer;
local v47 = game:DefineFastString("SelectInSceneIXPField", "EnableSelectInScene");
local v48 = game:DefineFastString("WHAM1707IXPField", "EnableWHAM1707");
local l_FFlagHighlightModePreciseSelectionEnabled_0 = v44.FFlagHighlightModePreciseSelectionEnabled;
local v50 = require(l_script_FirstAncestor_0.Flags.FFlagHideShortcutsOnReportDropdown);
local v51 = game:DefineFastFlag("AbuseReportTabClearCapturedScreenshotOnCloseFix", false);
local v52 = game:DefineFastInt("AbuseReportTabClearCapturedScreenshotOnCloseFixDelay", 500);
local l_FFlagMigrateAllOsaMessagingToCentralService_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagMigrateAllOsaMessagingToCentralService;
local v54 = require(l_script_FirstAncestor_0.Utility.isShowSelectInSceneReportMenu);
local l_getHighlightModeVariant_0 = require(l_CorePackages_0.Workspace.Packages.InGameAssetReporting).getHighlightModeVariant;
local l_SegmentedControl_0 = require(l_CorePackages_0.Packages.UIBlox).App.Control.SegmentedControl;
local v57 = {
    l_ReportModes_0.Classic, 
    l_ReportModes_0.SelectInScene
};
local v58 = {
    l_ReportTypes_0.Person, 
    l_ReportTypes_0.Experience
};
local function _() --[[ Line: 92 ]] --[[ Name: isInSelectInSceneExperiment ]]
    -- upvalues: l_IXPService_0 (copy), l_FStringReportMenuIXPLayer_0 (copy), v47 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 94 ]]
        -- upvalues: l_IXPService_0 (ref), l_FStringReportMenuIXPLayer_0 (ref)
        return l_IXPService_0:GetUserLayerVariables(l_FStringReportMenuIXPLayer_0);
    end);
    if not l_status_0 or not l_result_0 or l_result_0[v47] == nil then
        return false;
    else
        l_IXPService_0:LogUserLayerExposure(l_FStringReportMenuIXPLayer_0);
        return l_result_0[v47];
    end;
end;
local function v64() --[[ Line: 106 ]] --[[ Name: isInWHAM1707Experiment ]]
    -- upvalues: v43 (copy), l_IXPService_0 (copy), l_FStringEARReportMenuIXPLayer_0 (copy), v48 (copy)
    if v43() then
        return true;
    else
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 112 ]]
            -- upvalues: l_IXPService_0 (ref), l_FStringEARReportMenuIXPLayer_0 (ref)
            return l_IXPService_0:GetUserLayerVariables(l_FStringEARReportMenuIXPLayer_0);
        end);
        if not l_status_1 or not l_result_1 or l_result_1[v48] == nil then
            return false;
        else
            l_IXPService_0:LogUserLayerExposure(l_FStringEARReportMenuIXPLayer_0);
            return l_result_1[v48];
        end;
    end;
end;
local function v103(v65) --[[ Line: 124 ]]
    -- upvalues: v7 (copy), v27 (copy), v10 (copy), v57 (copy), v58 (copy), v28 (copy), v25 (copy), v26 (copy), l_useTokens_0 (copy), l_useLocalization_0 (copy), v42 (copy), v64 (copy), l_SafetyService_0 (copy), v18 (copy), v19 (copy), v20 (copy), v51 (copy), l_setTimeout_0 (copy), v17 (copy), v52 (copy), l_Players_0 (copy), v54 (copy), l_IXPService_0 (copy), l_FStringReportMenuIXPLayer_0 (copy), v47 (copy), v50 (copy), v16 (copy), l_ReportTypes_0 (copy), v14 (copy), v15 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_SegmentedControl_0 (copy), l_ReportModes_0 (copy), v13 (copy), l_FFlagHighlightModePreciseSelectionEnabled_0 (copy), l_getHighlightModeVariant_0 (copy), v9 (copy), l_View_0 (copy), l_Text_0 (copy), l_isShowUKOSAIllegalContentReportingLink_0 (copy), l_FFlagMigrateAllOsaMessagingToCentralService_0 (copy), l_isShowEUDSAIllegalContentReportingLink_0 (copy), l_DSAReportLink_0 (copy), l_OSAReportLink_0 (copy), l_isShowGenericIllegalContentReportingLink_0 (copy), l_GenericReportLink_0 (copy)
    local v66, v67 = v7.useState(false);
    local v68, v69 = v7.useState(1);
    local v70, v71 = v7.useState(1);
    local v72, v73 = v7.useState(nil);
    local v74, v75 = v7.useState(0);
    local v76, v77 = v7.useState(false);
    local v78, v79 = v7.useState(false);
    local v80, v81 = v7.useState({
        width = 0, 
        height = 0
    });
    local v82 = false;
    if v80.width < v80.height then
        v82 = v80.width < 700;
    end;
    local v83, v84 = v7.useReducer(v27, v10.AnalyticsInitialState);
    local v85 = v57[v68];
    local v86 = v58[v70];
    local v87 = v7.useCallback(v28(v83, v84, v73, v86), {
        v83, 
        v70
    });
    local v88, v89 = v25(v66, v65.hideReportTab, v65.showReportTab, v87);
    local v90 = v26();
    local v91 = l_useTokens_0();
    local v92 = l_useLocalization_0(v10.localizationKeys);
    v7.useEffect(function() --[[ Line: 152 ]]
        -- upvalues: v65 (copy), v67 (copy), v42 (ref), v64 (ref), v88 (copy), l_SafetyService_0 (ref), v18 (ref), v19 (ref), v20 (ref), v73 (copy), v75 (copy), v51 (ref), l_setTimeout_0 (ref), v17 (ref), v89 (copy), v10 (ref), v52 (ref)
        v65.registerOnReportTabDisplayed(function() --[[ Line: 153 ]]
            -- upvalues: v67 (ref), v42 (ref), v64 (ref), v88 (ref), l_SafetyService_0 (ref)
            v67(true);
            if v42() and v64() and v88.screenshotContentId ~= "" then
                l_SafetyService_0:ReportMenuTabOpen();
            end;
        end);
        v65.registerOnReportTabHidden(function() --[[ Line: 162 ]]
            -- upvalues: v67 (ref), v18 (ref), v19 (ref), v20 (ref), v42 (ref), v64 (ref), l_SafetyService_0 (ref)
            v67(false);
            v18.unmountAnnotationPage();
            v19.unmountModalSelector();
            v20.unmountModalSelector();
            if v42() and v64() then
                l_SafetyService_0:ReportMenuTabClose();
            end;
        end);
        v65.registerSetNextPlayerToReport(function(v93) --[[ Line: 172 ]]
            -- upvalues: v73 (ref)
            v73(v93);
        end);
        v65.registerOnMenuWidthChange(function(v94) --[[ Line: 175 ]]
            -- upvalues: v75 (ref)
            v75(v94);
        end);
        v65.registerOnSettingsHidden(function() --[[ Line: 178 ]]
            -- upvalues: v51 (ref), l_setTimeout_0 (ref), v17 (ref), v89 (ref), v10 (ref), v52 (ref)
            if v51 then
                l_setTimeout_0(function() --[[ Line: 185 ]]
                    -- upvalues: v17 (ref), v89 (ref), v10 (ref)
                    if v17:getAbuseReportSessionEntryPoint() == "" then
                        v89({
                            type = v10.ReportAnythingActions.ClearAll
                        });
                        return;
                    else
                        return;
                    end;
                end, v52);
                return;
            else
                if v17:getAbuseReportSessionEntryPoint() == "" then
                    v89({
                        type = v10.ReportAnythingActions.ClearAll
                    });
                end;
                return;
            end;
        end);
    end, {
        v88
    });
    v7.useEffect(function() --[[ Line: 203 ]]
        -- upvalues: v66 (copy), v71 (copy), v69 (copy), v79 (copy), l_Players_0 (ref), v77 (copy)
        if not v66 then
            v71(0);
            v69(1);
            v79(false);
            return;
        elseif #l_Players_0:GetPlayers() <= 1 then
            v77(true);
            v71(2);
            return;
        else
            v71(1);
            v77(false);
            return;
        end;
    end, {
        v66
    });
    v7.useEffect(function() --[[ Line: 223 ]]
        -- upvalues: v66 (copy), v84 (copy), v10 (ref), v17 (ref), v54 (ref), l_IXPService_0 (ref), l_FStringReportMenuIXPLayer_0 (ref), v47 (ref), v79 (copy), v81 (copy)
        if v66 then
            v84({
                type = v10.AnalyticsActions.SetMenuOpenedTimestamp, 
                timestamp = math.floor(workspace:GetServerTimeNow() * 1000)
            });
            v17:startAbuseReportSession("ReportPage");
            if v54(v84) then
                local l_status_2, l_result_2 = pcall(function() --[[ Line: 94 ]]
                    -- upvalues: l_IXPService_0 (ref), l_FStringReportMenuIXPLayer_0 (ref)
                    return l_IXPService_0:GetUserLayerVariables(l_FStringReportMenuIXPLayer_0);
                end);
                local v97;
                if not l_status_2 or not l_result_2 or l_result_2[v47] == nil then
                    v97 = false;
                else
                    l_IXPService_0:LogUserLayerExposure(l_FStringReportMenuIXPLayer_0);
                    v97 = l_result_2[v47];
                end;
                if v97 then
                    v79(true);
                end;
            end;
        end;
        local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
        if l_CurrentCamera_0 ~= nil then
            local l_ViewportSize_0 = l_CurrentCamera_0.ViewportSize;
            v81({
                width = l_ViewportSize_0.X, 
                height = l_ViewportSize_0.Y
            });
            v84({
                type = v10.AnalyticsActions.SetViewportInformation, 
                viewportSizeX = l_ViewportSize_0.X, 
                viewportSizeY = l_ViewportSize_0.Y
            });
        end;
    end, {
        v66, 
        v74
    });
    if not v66 then
        return nil;
    else
        local v100 = nil;
        local v101 = {
            onReportComplete = v65.onReportComplete, 
            onDropdownMenuOpenChange = if v50 then v65.onDropdownMenuOpenChange else nil, 
            reportAnythingAnalytics = v16, 
            reportAnythingState = v88, 
            reportAnythingDispatch = v89, 
            hideReportTab = v65.hideReportTab, 
            isReportTabVisible = v66, 
            showReportSentPage = v65.showReportSentPage, 
            analyticsState = v83, 
            analyticsDispatch = v84, 
            preselectedPlayer = v72, 
            setPreselectedPlayer = v73, 
            menuWidth = v74, 
            viewportDimension = v80
        };
        if v86 == l_ReportTypes_0.Person then
            v100 = v7.createElement(v14, {
                utilityProps = v101, 
                isSmallPortraitViewport = v82
            });
        elseif v86 == l_ReportTypes_0.Experience then
            v100 = v7.createElement(v15, {
                utilityProps = v101, 
                isSmallPortraitViewport = v82
            });
        end;
        return v7.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0), 
            Position = UDim2.new(0, 0, 0, v90.TopPadding)
        }, {
            FocusNavigationCoreScriptsWrapper = v7.createElement(l_FocusRoot_0, {
                surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.RouterView, 
                frameProps = {
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, 
                isIsolated = true, 
                isAutoFocusRoot = true
            }, {
                [v10.AbuseReportMenuPlaceholderFrame] = v7.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }, {
                    MenuLayoutFrame = v7.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.new(1, 0, 0, 0)
                    }, {
                        Layout = v7.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            HorizontalAlignment = 0, 
                            Padding = UDim.new(0, 12)
                        }), 
                        Padding = v7.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, v90.ItemPadding), 
                            PaddingBottom = UDim.new(0, v90.ItemPadding)
                        }), 
                        SelectInSceneToggleFrame = if v78 then v7.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            Position = UDim2.new(0.5, 0, 0, 0), 
                            AnchorPoint = Vector2.new(0.5, 0), 
                            LayoutOrder = 0
                        }, {
                            SelectInSceneToggle = v7.createElement(l_SegmentedControl_0, {
                                onTabActivated = function(v102) --[[ Line: 337 ]] --[[ Name: onTabActivated ]]
                                    -- upvalues: v69 (copy)
                                    v69(v102);
                                end, 
                                selectedTabIndex = v68, 
                                tabs = {
                                    {
                                        tabName = v92.BuildAReport
                                    }, 
                                    {
                                        tabName = v92.SelectInScene
                                    }
                                }, 
                                width = UDim.new(0, v74)
                            })
                        }) else nil, 
                        Menu = if v85 == l_ReportModes_0.SelectInScene then v7.createElement(v13, {
                            hideReportTab = v65.hideReportTab, 
                            variant = if l_FFlagHighlightModePreciseSelectionEnabled_0 then l_getHighlightModeVariant_0() else nil
                        }) else if v85 == l_ReportModes_0.Classic then v7.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            LayoutOrder = 1
                        }, {
                            Layout = v7.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                SortOrder = Enum.SortOrder.LayoutOrder, 
                                Padding = UDim.new(0, v90.ItemPadding)
                            }), 
                            ReportTypeSelector = v7.createElement(v9, {
                                label = v92.ReportType, 
                                abuseType = v92[v58[v70]], 
                                layoutOrder = 0, 
                                utilityProps = v101, 
                                isSelectionDisabled = v76, 
                                menuWidth = v74, 
                                isSmallPortraitViewport = v82, 
                                onClickLeft = function() --[[ Line: 379 ]] --[[ Name: onClickLeft ]]
                                    -- upvalues: v89 (copy), v10 (ref), v84 (copy), v71 (copy), v70 (copy), v58 (ref)
                                    v89({
                                        type = v10.ReportAnythingActions.ClearAnnotationFlowProperties
                                    });
                                    v84({
                                        type = v10.AnalyticsActions.IncrementExperiencePersonChanged
                                    });
                                    v71((v70 - 1 - 1) % #v58 + 1);
                                end, 
                                onClickRight = function() --[[ Line: 389 ]] --[[ Name: onClickRight ]]
                                    -- upvalues: v89 (copy), v10 (ref), v84 (copy), v71 (copy), v70 (copy), v58 (ref)
                                    v89({
                                        type = v10.ReportAnythingActions.ClearAnnotationFlowProperties
                                    });
                                    v84({
                                        type = v10.AnalyticsActions.IncrementExperiencePersonChanged
                                    });
                                    v71((v70 - 1 + 1) % #v58 + 1);
                                end
                            }), 
                            MenuItemsContainer = v7.createElement("Frame", {
                                BackgroundTransparency = 1, 
                                LayoutOrder = 1, 
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                Size = UDim2.new(1, 0, 0, 0)
                            }, {
                                MenuItems = v100
                            }), 
                            FooterFrame = v7.createElement(l_View_0, {
                                tag = "size-full-0 auto-y", 
                                LayoutOrder = 2
                            }, {
                                TextFrame = v7.createElement(l_View_0, {
                                    tag = "size-full col align-x-left gap-small padding-top-medium"
                                }, {
                                    Divider = v7.createElement(l_View_0, {
                                        tag = "size-full-0 stroke-muted padding-top-medium", 
                                        LayoutOrder = 1
                                    }), 
                                    InfoText = v7.createElement(l_Text_0, {
                                        Text = if l_isShowUKOSAIllegalContentReportingLink_0() then v92.FooterInformation2 else v92.FooterInformation1, 
                                        fontStyle = v91.Typography.BodySmall, 
                                        textStyle = v91.Color.Content.Muted, 
                                        TextWrapped = true, 
                                        TextXAlignment = Enum.TextXAlignment.Left, 
                                        tag = "auto-xy", 
                                        LayoutOrder = 2
                                    })
                                })
                            }), 
                            DSALinkFrame = if not l_FFlagMigrateAllOsaMessagingToCentralService_0 and l_isShowEUDSAIllegalContentReportingLink_0() then v7.createElement("Frame", {
                                BackgroundTransparency = 1, 
                                LayoutOrder = 3, 
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                Size = UDim2.new(1, 0, 0, 0)
                            }, {
                                DSALink = v7.createElement(l_DSAReportLink_0)
                            }) else nil, 
                            OSALinkFrame = if not l_FFlagMigrateAllOsaMessagingToCentralService_0 and l_isShowUKOSAIllegalContentReportingLink_0() then v7.createElement(l_View_0, {
                                tag = "size-full-0 auto-y", 
                                LayoutOrder = 3
                            }, {
                                OSALink = v7.createElement(l_OSAReportLink_0)
                            }) else nil, 
                            GenericIllegalContentReportLink = if l_FFlagMigrateAllOsaMessagingToCentralService_0 and l_isShowGenericIllegalContentReportingLink_0() then v7.createElement(l_View_0, {
                                tag = "size-full-0 auto-y", 
                                LayoutOrder = 3
                            }, v7.createElement(l_GenericReportLink_0)) else nil
                        }) else nil
                    })
                })
            })
        });
    end;
end;
return function(v104) --[[ Line: 467 ]]
    -- upvalues: l_Localization_0 (copy), l_LocalizationService_0 (copy), v7 (copy), l_CoreScriptsRootProvider_0 (copy), l_LocalizationProvider_0 (copy), v10 (copy), v103 (copy)
    local v105 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    return v7.createElement(l_CoreScriptsRootProvider_0, {}, {
        LocalizationProvider = v7.createElement(l_LocalizationProvider_0, {
            localization = v105
        }, {
            [v10.AbuseReportMenuRootName] = v7.createElement(v103, v104)
        })
    });
end;