local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_FullPageModal_0 = v5.App.Dialog.Modal.FullPageModal;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local v8 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportListTable);
local v9 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportSummaryPage);
local _ = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportTypes);
local v11 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportDialogBodyLoading);
local v12 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportTargetComponent);
local v13 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportDataFetchStatusMessage);
local v14 = require(l_Modules_0.LuaApp.Components.AbuseReporting.Constants);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_useScreenSize_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useScreenSize;
local l_isSelectedDataDSAIllegalContent_0 = require(l_CorePackages_0.Workspace.Packages.DsaIllegalContentReporting).isSelectedDataDSAIllegalContent;
local v20 = require(script.Parent.getThumbnailData);
local v21 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility);
local l_VRConstants_0 = v21.VRConstants;
local l_VRPanelWidthIXP_0 = v21.VRPanelWidthIXP;
local v24 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local l_isShowEUDSAIllegalContentReportingLink_0 = require(l_CorePackages_0.Workspace.Packages.DsaIllegalContentReporting).isShowEUDSAIllegalContentReportingLink;
local l_GetFFlagLuafiedReportThumbnail_0 = v4.GetFFlagLuafiedReportThumbnail;
local l_GetFFlagLuafiedReportErrorStates_0 = v4.GetFFlagLuafiedReportErrorStates;
local l_GetFFlagDSAIllegalContentReporting_0 = v4.GetFFlagDSAIllegalContentReporting;
local l_GetFFlagDSAVRSkipFrontendGeoCheck_0 = v4.GetFFlagDSAVRSkipFrontendGeoCheck;
local l_GetFFlagVRPanelWidthIXPEnabled_0 = v4.GetFFlagVRPanelWidthIXPEnabled;
local l_FFlagLuaAppForceVrAppPanelWidthRollout_0 = v4.FFlagLuaAppForceVrAppPanelWidthRollout;
local function _(v32) --[[ Line: 62 ]]
    -- upvalues: l_GetFFlagLuafiedReportErrorStates_0 (copy)
    return l_GetFFlagLuafiedReportErrorStates_0() and v32.loadingState.BEDUILoading;
end;
local function _(v34) --[[ Line: 66 ]]
    -- upvalues: l_GetFFlagLuafiedReportErrorStates_0 (copy)
    return l_GetFFlagLuafiedReportErrorStates_0() and v34.loadingState.BEDUIError;
end;
local function v43(v36, v37, v38, v39, v40, v41) --[[ Line: 70 ]] --[[ Name: getButtonsFromProps ]]
    -- upvalues: l_ButtonType_0 (copy)
    local v42 = {};
    if v39 then
        table.insert(v42, {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                onActivated = function() --[[ Line: 83 ]] --[[ Name: onActivated ]]
                    -- upvalues: v36 (copy)
                    v36.onBack();
                end, 
                text = v37
            }
        });
    end;
    if v41 then
        table.insert(v42, {
            buttonType = l_ButtonType_0.PrimarySystem, 
            props = {
                onActivated = function() --[[ Line: 94 ]] --[[ Name: onActivated ]]
                    -- upvalues: v36 (copy)
                    v36.onClose();
                end, 
                text = v38
            }
        });
    end;
    if v40 then
        table.insert(v42, {
            buttonType = l_ButtonType_0.PrimarySystem, 
            props = {
                onActivated = function() --[[ Line: 105 ]] --[[ Name: onActivated ]]
                    -- upvalues: v36 (copy)
                    v36.onSubmitReport();
                end, 
                text = v36.BEDUIComponents and v36.BEDUIComponents.submission.buttonText or "", 
                isDisabled = v36.loadingState.submitLoading
            }
        });
    end;
    return v42;
end;
local function _(v44, v45) --[[ Line: 116 ]]
    if v44.loadingState.submitLoading or v44.loadingState.BEDUILoading then
        return v45.Semantic.Color.Text.Default.Color3;
    else
        return v45.Semantic.Color.Action.Alert.Content.Color3;
    end;
end;
return function(v47) --[[ Line: 124 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useScreenSize_0 (copy), l_isSelectedDataDSAIllegalContent_0 (copy), l_GetFFlagDSAVRSkipFrontendGeoCheck_0 (copy), l_GetFFlagDSAIllegalContentReporting_0 (copy), l_isShowEUDSAIllegalContentReportingLink_0 (copy), l_useSelector_0 (copy), v20 (copy), l_GetFFlagLuafiedReportErrorStates_0 (copy), l_FFlagLuaAppForceVrAppPanelWidthRollout_0 (copy), l_GetFFlagVRPanelWidthIXPEnabled_0 (copy), v24 (copy), l_VRPanelWidthIXP_0 (copy), l_withLocalization_0 (copy), v3 (copy), l_FullPageModal_0 (copy), l_UserInputService_0 (copy), v14 (copy), l_VRConstants_0 (copy), v43 (copy), l_GetFFlagLuafiedReportThumbnail_0 (copy), v12 (copy), v8 (copy), v9 (copy), v11 (copy), v13 (copy)
    local v48 = l_useDesignTokens_0();
    local v49 = l_useScreenSize_0();
    local v50 = false;
    local v51 = false;
    if v47.BEDUIComponents ~= nil then
        v51 = false;
        if v47.BEDUIComponents.submission.text ~= nil then
            v51 = l_isSelectedDataDSAIllegalContent_0(v47.selectionData);
        end;
    end;
    v50 = if l_GetFFlagDSAVRSkipFrontendGeoCheck_0() then v51 and l_GetFFlagDSAIllegalContentReporting_0() else v51 and l_isShowEUDSAIllegalContentReportingLink_0();
    local v52 = l_useSelector_0(v20({
        reportData = v47.reportData
    }));
    local v53 = false;
    if #v47.prevListNodes > 0 then
        v53 = not (l_GetFFlagLuafiedReportErrorStates_0() and v47.loadingState.BEDUIError);
    end;
    local v54 = false;
    if v47.currentList == nil then
        v54 = false;
        if #v47.selectionData > 0 then
            v54 = not v50;
        end;
    end;
    local v55 = l_GetFFlagLuafiedReportErrorStates_0() and v47.loadingState.BEDUIError;
    local v56 = if not not v47.loadingState.submitLoading or v47.loadingState.BEDUILoading then v48.Semantic.Color.Text.Default.Color3 else v48.Semantic.Color.Action.Alert.Content.Color3;
    local v57 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and l_GetFFlagVRPanelWidthIXPEnabled_0() then v24.useTestVariables(l_VRPanelWidthIXP_0.VrAppPanelWidthMultiplier) else nil;
    return l_withLocalization_0({
        backButtonText = "CommonUI.Controls.Action.Back", 
        closeButtonText = "Feature.Friends.Action.Close"
    })(function(v58) --[[ Line: 156 ]]
        -- upvalues: v3 (ref), l_FullPageModal_0 (ref), l_UserInputService_0 (ref), v47 (copy), v14 (ref), v49 (copy), l_FFlagLuaAppForceVrAppPanelWidthRollout_0 (ref), v57 (copy), l_VRConstants_0 (ref), v53 (copy), v54 (copy), v55 (copy), v43 (ref), v48 (copy), l_GetFFlagLuafiedReportThumbnail_0 (ref), l_GetFFlagLuafiedReportErrorStates_0 (ref), v12 (ref), v52 (copy), v8 (ref), v9 (ref), v11 (ref), v13 (ref), v56 (copy)
        local v59 = false;
        local l_createElement_0 = v3.createElement;
        local l_l_FullPageModal_0_0 = l_FullPageModal_0;
        local v62 = {
            distanceFromTop = if l_UserInputService_0.StatusBarSize then l_UserInputService_0.StatusBarSize.Y else 0, 
            title = v47.BEDUIComponents and v47.BEDUIComponents.title.text or "", 
            screenSize = if v47.reportSurface ~= v14.BEDUI_SURFACES.VR and v49 then v49 else if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v57 then Vector2.new(l_VRConstants_0.MainScreenResolution.X * v57, l_VRConstants_0.MainScreenResolution.Y) else l_VRConstants_0.MainScreenResolution, 
            buttonStackProps = if not not v53 or v54 or v55 then {
                forcedFillDirection = Enum.FillDirection.Horizontal, 
                buttons = v43(v47, v58.backButtonText, v58.closeButtonText, v53, v54, v55)
            } else nil, 
            onCloseClicked = function() --[[ Line: 181 ]] --[[ Name: onCloseClicked ]]
                -- upvalues: v47 (ref)
                v47.onClose();
                v47.onLogAbandon();
            end
        };
        local v63 = {};
        local l_createElement_1 = v3.createElement;
        local v65 = "Frame";
        local v66 = {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = v48.Global.Opacity_0
        };
        local v67 = {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        };
        local v68;
        if l_GetFFlagLuafiedReportThumbnail_0() then
            local l_v47_0 = v47;
            if not (l_GetFFlagLuafiedReportErrorStates_0() and l_v47_0.loadingState.BEDUIError) then
                v68 = v3.createElement(v12, {
                    primaryText = v52.primaryText, 
                    secondaryText = v52.secondaryText, 
                    thumbnailUrl = v52.thumbnailUrl
                });
                v59 = true;
            end;
        end;
        if not v59 then
            v68 = nil;
        end;
        v59 = false;
        v67.ReportTarget = v68;
        v68 = v3.createElement;
        local v70 = "Frame";
        local v71 = {};
        local l_new_0 = UDim2.new;
        local v73 = 1;
        local v74 = 0;
        local v75 = 1;
        local l_v47_1 = v47;
        v71.Size = l_new_0(v73, v74, v75, if not (l_GetFFlagLuafiedReportErrorStates_0() and l_v47_1.loadingState.BEDUIError) then -v48.Global.Size_1400 else 0);
        v71.BackgroundTransparency = v48.Global.Opacity_0;
        v71.LayoutOrder = 2;
        l_new_0 = {};
        if v47.currentList then
            v73 = v3.createElement(v8, {
                currentList = v47.currentList, 
                onSelect = v47.onSelect
            });
        elseif #v47.selectionData > 0 then
            v73 = v3.createElement(v9, {
                heading = v47.BEDUIComponents and v47.BEDUIComponents.submission.heading or "", 
                selectionData = v47.selectionData, 
                dsaText = v47.BEDUIComponents and v47.BEDUIComponents.submission.text or "", 
                onSummaryPageMounted = v47.onSummaryPageMounted
            });
        else
            v75 = v47;
            v73 = if l_GetFFlagLuafiedReportErrorStates_0() and v75.loadingState.BEDUILoading then v3.createElement(v11, {}) else nil;
        end;
        l_new_0.ReportCategoryTable = v73;
        l_new_0.ReportDataFetchStatusMessage = if l_GetFFlagLuafiedReportErrorStates_0() then v3.createElement(v13, {
            statusPrimaryText = v47.loadingState.statusPrimaryText, 
            statusSecondaryText = v47.loadingState.statusSecondaryText, 
            BEDUIError = v47.loadingState.BEDUIError, 
            submitError = v47.loadingState.submitError, 
            color = v56
        }) else nil;
        v67.ReportContent = v68(v70, v71, l_new_0);
        v63.ViewFrame = l_createElement_1(v65, v66, v67);
        return l_createElement_0(l_l_FullPageModal_0_0, v62, v63);
    end);
end;