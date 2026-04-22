local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_IXPService_0 = game:GetService("IXPService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Players_0 = game:GetService("Players");
local l_SafetyService_0 = game:GetService("SafetyService");
local v7 = require(l_CorePackages_0.Packages.Foundation);
local v8 = require(l_CorePackages_0.Packages.React);
local l_CoreScriptsRootProvider_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider;
local v10 = require(l_script_FirstAncestor_0.Components.ReportTypeSelector);
local v11 = require(l_script_FirstAncestor_0.Components.Constants);
local l_ReportModes_0 = v11.ReportModes;
local l_ReportTypes_0 = v11.ReportTypes;
local v14 = require(l_script_FirstAncestor_0.Components.SelectInSceneReportMenu);
local v15 = require(l_script_FirstAncestor_0.Components.Containers.ReportPersonMenuItemsContainer);
local v16 = require(l_script_FirstAncestor_0.Components.Containers.ReportExperienceMenuItemsContainer);
local v17 = require(l_script_FirstAncestor_0.ReportAnything.Utility.ReportAnythingAnalytics);
local v18 = require(l_script_FirstAncestor_0.Analytics.ReportAbuseAnalytics);
local v19 = require(l_script_FirstAncestor_0.ReportAnything.Components.AnnotationModal);
local v20 = require(l_script_FirstAncestor_0.Components.ChatModalSelectorDialogController);
local v21 = require(l_script_FirstAncestor_0.Components.ModalBasedSelectorDialogController);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_setTimeout_0 = require(l_CorePackages_0.Packages.LuauPolyfill).setTimeout;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v26 = require(l_script_FirstAncestor_0.Hooks.useReportAnythingWithScreenshot);
local v27 = require(l_script_FirstAncestor_0.Utility.getMenuItemSizings);
local v28 = require(l_script_FirstAncestor_0.Reducers.analyticsReducer);
local v29 = require(l_script_FirstAncestor_0.Components.createCleanup);
local l_useTokens_0 = v7.Hooks.useTokens;
local l_Text_0 = v7.Text;
local l_View_0 = v7.View;
local v33 = require(l_CorePackages_0.Workspace.Packages.DsaIllegalContentReporting);
local l_isShowEUDSAIllegalContentReportingLink_0 = v33.isShowEUDSAIllegalContentReportingLink;
local l_DSAReportLink_0 = v33.DSAReportLink;
local l_isShowUKOSAIllegalContentReportingLink_0 = v33.isShowUKOSAIllegalContentReportingLink;
local l_OSAReportLink_0 = v33.OSAReportLink;
local l_isShowGenericIllegalContentReportingLink_0 = v33.isShowGenericIllegalContentReportingLink;
local l_GenericReportLink_0 = v33.GenericReportLink;
local v40 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusRoot_0 = v40.FocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v40.FocusNavigableSurfaceIdentifierEnum;
local v43 = require(l_script_FirstAncestor_0.Flags.isAbuseReportMenuOpenCloseSignalEnabled);
local v44 = require(l_script_FirstAncestor_0.Flags.GetFFlagWHAM1707ExperimentForceEnabled);
local v45 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FStringReportMenuIXPLayer_0 = v45.FStringReportMenuIXPLayer;
local l_FStringEARReportMenuIXPLayer_0 = v45.FStringEARReportMenuIXPLayer;
local v48 = game:DefineFastString("SelectInSceneIXPField", "EnableSelectInScene");
local v49 = game:DefineFastString("WHAM1707IXPField", "EnableWHAM1707");
local l_FFlagHighlightModePreciseSelectionEnabled_0 = v45.FFlagHighlightModePreciseSelectionEnabled;
local v51 = require(l_script_FirstAncestor_0.Flags.FFlagHideShortcutsOnReportDropdown);
local v52 = game:DefineFastFlag("AbuseReportTabClearCapturedScreenshotOnCloseFix", false);
local v53 = game:DefineFastInt("AbuseReportTabClearCapturedScreenshotOnCloseFixDelay", 500);
local l_FFlagMigrateAllOsaMessagingToCentralService_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagMigrateAllOsaMessagingToCentralService;
local v55 = game:DefineFastFlag("IEMReportScrollingFix", false);
local v56 = require(l_script_FirstAncestor_0.Flags.FFlagReportFocusNavIEMButtons);
local l_FFlagIEMTabFocusNav_0 = v45.FFlagIEMTabFocusNav;
local v58 = require(l_script_FirstAncestor_0.Utility.isShowSelectInSceneReportMenu);
local l_getHighlightModeVariant_0 = require(l_CorePackages_0.Workspace.Packages.InGameAssetReporting).getHighlightModeVariant;
local l_SegmentedControl_0 = require(l_CorePackages_0.Packages.UIBlox).App.Control.SegmentedControl;
local v61 = {
    l_ReportModes_0.Classic, 
    l_ReportModes_0.SelectInScene
};
local v62 = {
    l_ReportTypes_0.Person, 
    l_ReportTypes_0.Experience
};
local function _() --[[ Line: 99 ]] --[[ Name: isInSelectInSceneExperiment ]]
    -- upvalues: l_IXPService_0 (copy), l_FStringReportMenuIXPLayer_0 (copy), v48 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 101 ]]
        -- upvalues: l_IXPService_0 (ref), l_FStringReportMenuIXPLayer_0 (ref)
        return l_IXPService_0:GetUserLayerVariables(l_FStringReportMenuIXPLayer_0);
    end);
    if not l_status_0 or not l_result_0 or l_result_0[v48] == nil then
        return false;
    else
        l_IXPService_0:LogUserLayerExposure(l_FStringReportMenuIXPLayer_0);
        return l_result_0[v48];
    end;
end;
local function v68() --[[ Line: 113 ]] --[[ Name: isInWHAM1707Experiment ]]
    -- upvalues: v44 (copy), l_IXPService_0 (copy), l_FStringEARReportMenuIXPLayer_0 (copy), v49 (copy)
    if v44() then
        return true;
    else
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 119 ]]
            -- upvalues: l_IXPService_0 (ref), l_FStringEARReportMenuIXPLayer_0 (ref)
            return l_IXPService_0:GetUserLayerVariables(l_FStringEARReportMenuIXPLayer_0);
        end);
        if not l_status_1 or not l_result_1 or l_result_1[v49] == nil then
            return false;
        else
            l_IXPService_0:LogUserLayerExposure(l_FStringEARReportMenuIXPLayer_0);
            return l_result_1[v49];
        end;
    end;
end;
local function v127(v69) --[[ Line: 131 ]]
    -- upvalues: v8 (copy), v28 (copy), v11 (copy), v61 (copy), v62 (copy), v29 (copy), v26 (copy), v27 (copy), l_useTokens_0 (copy), l_useLocalization_0 (copy), v43 (copy), v68 (copy), l_SafetyService_0 (copy), v19 (copy), v20 (copy), v21 (copy), v52 (copy), l_setTimeout_0 (copy), v18 (copy), v53 (copy), l_Players_0 (copy), v58 (copy), l_IXPService_0 (copy), l_FStringReportMenuIXPLayer_0 (copy), v48 (copy), v56 (copy), l_GuiService_0 (copy), l_FFlagIEMTabFocusNav_0 (copy), v51 (copy), v17 (copy), l_ReportTypes_0 (copy), v15 (copy), v16 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v55 (copy), l_SegmentedControl_0 (copy), l_ReportModes_0 (copy), v14 (copy), l_FFlagHighlightModePreciseSelectionEnabled_0 (copy), l_getHighlightModeVariant_0 (copy), v10 (copy), l_View_0 (copy), l_Text_0 (copy), l_isShowUKOSAIllegalContentReportingLink_0 (copy), l_FFlagMigrateAllOsaMessagingToCentralService_0 (copy), l_isShowEUDSAIllegalContentReportingLink_0 (copy), l_DSAReportLink_0 (copy), l_OSAReportLink_0 (copy), l_isShowGenericIllegalContentReportingLink_0 (copy), l_GenericReportLink_0 (copy)
    local v70, v71 = v8.useState(false);
    local v72, v73 = v8.useState(1);
    local v74, v75 = v8.useState(1);
    local v76, v77 = v8.useState(nil);
    local v78, v79 = v8.useState(0);
    local v80, v81 = v8.useState(false);
    local v82, v83 = v8.useState(false);
    local v84, v85 = v8.useState(true);
    local v86 = v8.useRef(nil);
    local v87 = v8.useRef(nil);
    local v88, v89 = v8.useState({
        width = 0, 
        height = 0
    });
    local v90 = false;
    if v88.width < v88.height then
        v90 = v88.width < 700;
    end;
    local v91, v92 = v8.useReducer(v28, v11.AnalyticsInitialState);
    local v93 = v61[v72];
    local v94 = v62[v74];
    local v95 = v8.useCallback(v29(v91, v92, v77, v94), {
        v91, 
        v74
    });
    local v96, v97 = v26(v70, v69.hideReportTab, v69.showReportTab, v95);
    local v98 = v27();
    local v99 = l_useTokens_0();
    local v100 = l_useLocalization_0(v11.localizationKeys);
    v8.useEffect(function() --[[ Line: 162 ]]
        -- upvalues: v69 (copy), v71 (copy), v43 (ref), v68 (ref), v96 (copy), l_SafetyService_0 (ref), v19 (ref), v20 (ref), v21 (ref), v77 (copy), v79 (copy), v52 (ref), l_setTimeout_0 (ref), v18 (ref), v97 (copy), v11 (ref), v53 (ref)
        v69.registerOnReportTabDisplayed(function() --[[ Line: 163 ]]
            -- upvalues: v71 (ref), v43 (ref), v68 (ref), v96 (ref), l_SafetyService_0 (ref)
            v71(true);
            if v43() and v68() and v96.screenshotContentId ~= "" then
                l_SafetyService_0:ReportMenuTabOpen();
            end;
        end);
        v69.registerOnReportTabHidden(function() --[[ Line: 172 ]]
            -- upvalues: v71 (ref), v19 (ref), v20 (ref), v21 (ref), v43 (ref), v68 (ref), l_SafetyService_0 (ref)
            v71(false);
            v19.unmountAnnotationPage();
            v20.unmountModalSelector();
            v21.unmountModalSelector();
            if v43() and v68() then
                l_SafetyService_0:ReportMenuTabClose();
            end;
        end);
        v69.registerSetNextPlayerToReport(function(v101) --[[ Line: 182 ]]
            -- upvalues: v77 (ref)
            v77(v101);
        end);
        v69.registerOnMenuWidthChange(function(v102) --[[ Line: 185 ]]
            -- upvalues: v79 (ref)
            v79(v102);
        end);
        v69.registerOnSettingsHidden(function() --[[ Line: 188 ]]
            -- upvalues: v52 (ref), l_setTimeout_0 (ref), v18 (ref), v97 (ref), v11 (ref), v53 (ref)
            if v52 then
                l_setTimeout_0(function() --[[ Line: 195 ]]
                    -- upvalues: v18 (ref), v97 (ref), v11 (ref)
                    if v18:getAbuseReportSessionEntryPoint() == "" then
                        v97({
                            type = v11.ReportAnythingActions.ClearAll
                        });
                        return;
                    else
                        return;
                    end;
                end, v53);
                return;
            else
                if v18:getAbuseReportSessionEntryPoint() == "" then
                    v97({
                        type = v11.ReportAnythingActions.ClearAll
                    });
                end;
                return;
            end;
        end);
    end, {
        v96
    });
    v8.useEffect(function() --[[ Line: 213 ]]
        -- upvalues: v70 (copy), v75 (copy), v73 (copy), v83 (copy), l_Players_0 (ref), v81 (copy)
        if not v70 then
            v75(0);
            v73(1);
            v83(false);
            return;
        elseif #l_Players_0:GetPlayers() <= 1 then
            v81(true);
            v75(2);
            return;
        else
            v75(1);
            v81(false);
            return;
        end;
    end, {
        v70
    });
    v8.useEffect(function() --[[ Line: 233 ]]
        -- upvalues: v70 (copy), v92 (copy), v11 (ref), v18 (ref), v58 (ref), l_IXPService_0 (ref), l_FStringReportMenuIXPLayer_0 (ref), v48 (ref), v83 (copy), v89 (copy)
        if v70 then
            v92({
                type = v11.AnalyticsActions.SetMenuOpenedTimestamp, 
                timestamp = math.floor(workspace:GetServerTimeNow() * 1000)
            });
            v18:startAbuseReportSession("ReportPage");
            if v58(v92) then
                local l_status_2, l_result_2 = pcall(function() --[[ Line: 101 ]]
                    -- upvalues: l_IXPService_0 (ref), l_FStringReportMenuIXPLayer_0 (ref)
                    return l_IXPService_0:GetUserLayerVariables(l_FStringReportMenuIXPLayer_0);
                end);
                local v105;
                if not l_status_2 or not l_result_2 or l_result_2[v48] == nil then
                    v105 = false;
                else
                    l_IXPService_0:LogUserLayerExposure(l_FStringReportMenuIXPLayer_0);
                    v105 = l_result_2[v48];
                end;
                if v105 then
                    v83(true);
                end;
            end;
        end;
        local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
        if l_CurrentCamera_0 ~= nil then
            local l_ViewportSize_0 = l_CurrentCamera_0.ViewportSize;
            v89({
                width = l_ViewportSize_0.X, 
                height = l_ViewportSize_0.Y
            });
            v92({
                type = v11.AnalyticsActions.SetViewportInformation, 
                viewportSizeX = l_ViewportSize_0.X, 
                viewportSizeY = l_ViewportSize_0.Y
            });
        end;
    end, {
        v70, 
        v78
    });
    if v56 then
        v8.useEffect(function() --[[ Line: 267 ]]
            -- upvalues: v70 (copy), v69 (copy), l_GuiService_0 (ref), v85 (copy)
            if not v70 then
                return;
            else
                local function _() --[[ Line: 272 ]] --[[ Name: isMenuSelected ]]
                    -- upvalues: v69 (ref), l_GuiService_0 (ref)
                    local l_getSettingsHubRef_0 = v69.getSettingsHubRef;
                    local v109 = l_getSettingsHubRef_0 and l_getSettingsHubRef_0();
                    local v110 = v109 and v109.MenuContainer;
                    local v111 = false;
                    if l_GuiService_0.SelectedCoreObject ~= nil then
                        v111 = false;
                        if v110 ~= nil then
                            v111 = l_GuiService_0.SelectedCoreObject:IsDescendantOf(v110);
                        end;
                    end;
                    return v111;
                end;
                local l_v85_0 = v85;
                local l_getSettingsHubRef_1 = v69.getSettingsHubRef;
                local v115 = l_getSettingsHubRef_1 and l_getSettingsHubRef_1();
                local v116 = v115 and v115.MenuContainer;
                local v117 = false;
                if l_GuiService_0.SelectedCoreObject ~= nil then
                    v117 = false;
                    if v116 ~= nil then
                        v117 = l_GuiService_0.SelectedCoreObject:IsDescendantOf(v116);
                    end;
                end;
                l_v85_0(not v117);
                l_v85_0 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 283 ]]
                    -- upvalues: v85 (ref), v69 (ref), l_GuiService_0 (ref)
                    local l_v85_1 = v85;
                    local l_getSettingsHubRef_2 = v69.getSettingsHubRef;
                    local v120 = l_getSettingsHubRef_2 and l_getSettingsHubRef_2();
                    local v121 = v120 and v120.MenuContainer;
                    local v122 = false;
                    if l_GuiService_0.SelectedCoreObject ~= nil then
                        v122 = false;
                        if v121 ~= nil then
                            v122 = l_GuiService_0.SelectedCoreObject:IsDescendantOf(v121);
                        end;
                    end;
                    l_v85_1(not v122);
                end);
                return function() --[[ Line: 287 ]]
                    -- upvalues: l_v85_0 (copy)
                    l_v85_0:Disconnect();
                end;
            end;
        end, {
            v70, 
            v69.getSettingsHubRef
        });
    end;
    if l_FFlagIEMTabFocusNav_0 then
        v8.useEffect(function() --[[ Line: 295 ]]
            -- upvalues: v70 (copy), v86 (copy), v69 (copy)
            if not v70 then
                return;
            else
                local v123 = nil;
                if v86.current and v86.current.tabRefs then
                    v123 = {
                        v86.current.tabRefs[1].current:FindFirstChild("Tab"), 
                        v86.current.tabRefs[2].current:FindFirstChild("Tab")
                    };
                end;
                if v69.setFirstSelectableObjects and v123 then
                    v69.setFirstSelectableObjects(v123);
                end;
                return;
            end;
        end, {
            v70, 
            v86, 
            v69.setFirstSelectableObjects, 
            v82
        });
    end;
    if not v70 then
        return nil;
    else
        local v124 = nil;
        local v125 = {
            onReportComplete = v69.onReportComplete, 
            onDropdownMenuOpenChange = if v51 then v69.onDropdownMenuOpenChange else nil, 
            reportAnythingAnalytics = v17, 
            reportAnythingState = v96, 
            reportAnythingDispatch = v97, 
            hideReportTab = v69.hideReportTab, 
            isReportTabVisible = v70, 
            showReportSentPage = v69.showReportSentPage, 
            analyticsState = v91, 
            analyticsDispatch = v92, 
            preselectedPlayer = v76, 
            setPreselectedPlayer = v77, 
            menuWidth = v78, 
            viewportDimension = v88, 
            setLastSelectableObjects = if v56 then v69.setLastSelectableObjects else nil
        };
        if v94 == l_ReportTypes_0.Person then
            v124 = v8.createElement(v15, {
                utilityProps = v125, 
                isSmallPortraitViewport = v90
            });
        elseif v94 == l_ReportTypes_0.Experience then
            v124 = v8.createElement(v16, {
                utilityProps = v125, 
                isSmallPortraitViewport = v90
            });
        end;
        return v8.createElement("Frame", {
            ref = v87, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0), 
            Position = UDim2.new(0, 0, 0, v98.TopPadding)
        }, {
            FocusNavigationCoreScriptsWrapper = v8.createElement(l_FocusRoot_0, {
                surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.RouterView, 
                frameProps = {
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, 
                isIsolated = not v55 or nil, 
                isAutoFocusRoot = not v56 or v84, 
                shouldRestoreFocus = not v56 or false
            }, {
                [v11.AbuseReportMenuPlaceholderFrame] = v8.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }, {
                    MenuLayoutFrame = v8.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.new(1, 0, 0, 0)
                    }, {
                        Layout = v8.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            HorizontalAlignment = 0, 
                            Padding = UDim.new(0, 12)
                        }), 
                        Padding = v8.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, v98.ItemPadding), 
                            PaddingBottom = UDim.new(0, v98.ItemPadding)
                        }), 
                        SelectInSceneToggleFrame = if v82 then v8.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            Position = UDim2.new(0.5, 0, 0, 0), 
                            AnchorPoint = Vector2.new(0.5, 0), 
                            LayoutOrder = 0
                        }, {
                            SelectInSceneToggle = v8.createElement(l_SegmentedControl_0, {
                                onTabActivated = function(v126) --[[ Line: 399 ]] --[[ Name: onTabActivated ]]
                                    -- upvalues: v73 (copy)
                                    v73(v126);
                                end, 
                                selectedTabIndex = v72, 
                                tabs = {
                                    {
                                        tabName = v100.BuildAReport
                                    }, 
                                    {
                                        tabName = v100.SelectInScene
                                    }
                                }, 
                                width = UDim.new(0, v78), 
                                ref = if l_FFlagIEMTabFocusNav_0 then v86 else nil
                            })
                        }) else nil, 
                        Menu = if v93 == l_ReportModes_0.SelectInScene then v8.createElement(v14, {
                            hideReportTab = v69.hideReportTab, 
                            variant = if l_FFlagHighlightModePreciseSelectionEnabled_0 then l_getHighlightModeVariant_0() else nil
                        }) else if v93 == l_ReportModes_0.Classic then v8.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            LayoutOrder = 1
                        }, {
                            Layout = v8.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                SortOrder = Enum.SortOrder.LayoutOrder, 
                                Padding = UDim.new(0, v98.ItemPadding)
                            }), 
                            ReportTypeSelector = v8.createElement(v10, {
                                label = v100.ReportType, 
                                abuseType = v100[v62[v74]], 
                                layoutOrder = 0, 
                                utilityProps = v125, 
                                isSelectionDisabled = v80, 
                                menuWidth = v78, 
                                isSmallPortraitViewport = v90, 
                                onClickLeft = function() --[[ Line: 442 ]] --[[ Name: onClickLeft ]]
                                    -- upvalues: v97 (copy), v11 (ref), v92 (copy), v75 (copy), v74 (copy), v62 (ref)
                                    v97({
                                        type = v11.ReportAnythingActions.ClearAnnotationFlowProperties
                                    });
                                    v92({
                                        type = v11.AnalyticsActions.IncrementExperiencePersonChanged
                                    });
                                    v75((v74 - 1 - 1) % #v62 + 1);
                                end, 
                                onClickRight = function() --[[ Line: 452 ]] --[[ Name: onClickRight ]]
                                    -- upvalues: v97 (copy), v11 (ref), v92 (copy), v75 (copy), v74 (copy), v62 (ref)
                                    v97({
                                        type = v11.ReportAnythingActions.ClearAnnotationFlowProperties
                                    });
                                    v92({
                                        type = v11.AnalyticsActions.IncrementExperiencePersonChanged
                                    });
                                    v75((v74 - 1 + 1) % #v62 + 1);
                                end
                            }), 
                            MenuItemsContainer = v8.createElement("Frame", {
                                BackgroundTransparency = 1, 
                                LayoutOrder = 1, 
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                Size = UDim2.new(1, 0, 0, 0)
                            }, {
                                MenuItems = v124
                            }), 
                            FooterFrame = v8.createElement(l_View_0, {
                                tag = "size-full-0 auto-y", 
                                LayoutOrder = 2
                            }, {
                                TextFrame = v8.createElement(l_View_0, {
                                    tag = "size-full col align-x-left gap-small padding-top-medium"
                                }, {
                                    Divider = v8.createElement(l_View_0, {
                                        tag = "size-full-0 stroke-muted padding-top-medium", 
                                        LayoutOrder = 1
                                    }), 
                                    InfoText = v8.createElement(l_Text_0, {
                                        Text = if l_isShowUKOSAIllegalContentReportingLink_0() then v100.FooterInformation2 else v100.FooterInformation1, 
                                        fontStyle = v99.Typography.BodySmall, 
                                        textStyle = v99.Color.Content.Muted, 
                                        TextWrapped = true, 
                                        TextXAlignment = Enum.TextXAlignment.Left, 
                                        tag = "auto-xy", 
                                        LayoutOrder = 2
                                    })
                                })
                            }), 
                            DSALinkFrame = if not l_FFlagMigrateAllOsaMessagingToCentralService_0 and l_isShowEUDSAIllegalContentReportingLink_0() then v8.createElement("Frame", {
                                BackgroundTransparency = 1, 
                                LayoutOrder = 3, 
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                Size = UDim2.new(1, 0, 0, 0)
                            }, {
                                DSALink = v8.createElement(l_DSAReportLink_0)
                            }) else nil, 
                            OSALinkFrame = if not l_FFlagMigrateAllOsaMessagingToCentralService_0 and l_isShowUKOSAIllegalContentReportingLink_0() then v8.createElement(l_View_0, {
                                tag = "size-full-0 auto-y", 
                                LayoutOrder = 3
                            }, {
                                OSALink = v8.createElement(l_OSAReportLink_0)
                            }) else nil, 
                            GenericIllegalContentReportLink = if l_FFlagMigrateAllOsaMessagingToCentralService_0 and l_isShowGenericIllegalContentReportingLink_0() then v8.createElement(l_View_0, {
                                tag = "size-full-0 auto-y", 
                                LayoutOrder = 3
                            }, v8.createElement(l_GenericReportLink_0)) else nil
                        }) else nil
                    })
                })
            })
        });
    end;
end;
return function(v128) --[[ Line: 530 ]]
    -- upvalues: l_Localization_0 (copy), l_LocalizationService_0 (copy), v8 (copy), l_CoreScriptsRootProvider_0 (copy), l_LocalizationProvider_0 (copy), v11 (copy), v127 (copy)
    local v129 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    return v8.createElement(l_CoreScriptsRootProvider_0, {}, {
        LocalizationProvider = v8.createElement(l_LocalizationProvider_0, {
            localization = v129
        }, {
            [v11.AbuseReportMenuRootName] = v8.createElement(v127, v128)
        })
    });
end;