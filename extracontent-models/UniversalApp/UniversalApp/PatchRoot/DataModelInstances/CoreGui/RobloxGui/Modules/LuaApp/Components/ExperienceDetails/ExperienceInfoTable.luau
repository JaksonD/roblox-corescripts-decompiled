local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Dash);
local v4 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v5 = require(l_CorePackages_0.Workspace.Packages.Localization);
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v5.Hooks.useLocalization;
local v8 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v9 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.Hooks.useExperienceInfoData);
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local v12 = require(l_CorePackages_0.Packages.UIBlox);
local v13 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v14 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddUniverseIdToGameDetailsEvents;
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local v19 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v20 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert);
local v21 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local l_FFlagHideCloseButtonEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagHideCloseButtonEdp;
local l_FFlagLuaAppAddTestIdsForEdpInfoTable_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddTestIdsForEdpInfoTable;
local l_ListTable_0 = v12.App.Table.ListTable;
local v25 = require(script.Parent.ExperienceInfoTableRow);
local v26 = require(script.Parent.ExperienceDetailsPanel);
return v2.forwardRef(function(v27, v28) --[[ Line: 48 ]]
    -- upvalues: v9 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_FFlagHideCloseButtonEdp_0 (copy), v8 (copy), v14 (copy), l_useDispatch_0 (copy), v2 (copy), v19 (copy), l_AppLinking_0 (copy), v20 (copy), v21 (copy), v13 (copy), l_useLocalization_0 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_useTokens_0 (copy), l_ListTable_0 (copy), v3 (copy), v25 (copy), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (copy), l_FFlagLuaAppAddTestIdsForEdpInfoTable_0 (copy), v26 (copy)
    local v29 = v9(v27.universeId, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v27.shouldHydrateLegacyIxp else nil, if l_FFlagHideCloseButtonEdp_0 then v27.hideCloseButton else nil);
    local v30 = v8(v14);
    local v31 = l_useDispatch_0();
    local v33 = v2.useCallback(function(v32) --[[ Line: 56 ]]
        -- upvalues: v31 (copy), v19 (ref)
        v31(v19(v32));
    end);
    local v34 = v8(l_AppLinking_0);
    local v36 = v2.useCallback(function(v35) --[[ Line: 62 ]]
        -- upvalues: v31 (copy), v20 (ref)
        v31(v20(v35));
    end, {
        v31
    });
    local v37 = v2.useCallback(function() --[[ Line: 66 ]]
        -- upvalues: v31 (copy), v21 (ref)
        v31(v21());
    end, {
        v31
    });
    local v39 = v13(function(v38) --[[ Line: 70 ]]
        return v38.enableExperienceDetailsPanel();
    end);
    local v40 = l_useLocalization_0({
        StatsInfoTitle = "Feature.ExperienceDetails.Body.StatsInfoTitle"
    });
    local v41 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    local v42 = l_useTokens_0();
    local v44 = v2.createElement(l_ListTable_0, {
        cells = v3.map(v29.rows, function(v43) --[[ Line: 84 ]]
            -- upvalues: v2 (ref), v25 (ref), v39 (copy), v42 (copy), v27 (copy), v41 (copy), v30 (copy), v29 (copy), v33 (copy), v36 (copy), v37 (copy), v34 (copy), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (ref), l_FFlagLuaAppAddTestIdsForEdpInfoTable_0 (ref)
            return v2.createElement(v25, {
                horizontalPadding = if not v39 then v42.Padding.Medium else nil, 
                infoName = v43.infoName, 
                infoData = v43.infoData or "", 
                infoIcon = v43.infoIcon, 
                renderTextOverride = v43.infoDataOverride and v27.renderTextOverride and function() --[[ Line: 91 ]]
                    -- upvalues: v43 (copy), v27 (ref)
                    return v43.infoDataOverride(v27.renderTextOverride);
                end or nil, 
                linkProps = if not (not not v43.linkPage or v43.navigateOverride) or v41 then nil else {
                    eventIngest = v30, 
                    rootPlaceId = v29.rootPlaceId, 
                    linkPage = v43.linkPage, 
                    linkUrl = v43.linkUrl, 
                    navigate = v43.navigateOverride or v33, 
                    analyticsSubPage = v43.analyticsSubPage
                }, 
                externalLinkProps = if not v43.linkUrl or v41 then nil else {
                    linkUrl = v43.linkUrl, 
                    openLeaveRobloxAlert = v36, 
                    closeAlert = v37, 
                    linking = v34, 
                    clickCallback = v43.linkClickCallback
                }, 
                universeId = if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then v27.universeId else nil, 
                testId = if l_FFlagLuaAppAddTestIdsForEdpInfoTable_0 then v43.testId else nil
            });
        end), 
        automaticSize = Enum.AutomaticSize.Y, 
        dividerStartOffset = not v39 and 0 or nil
    });
    if v39 then
        return v2.createElement(v26, {
            ref = v28, 
            title = v40.StatsInfoTitle, 
            roundContentCorners = true
        }, v44);
    else
        return v44;
    end;
end);