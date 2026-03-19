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
local l_ListTable_0 = v12.App.Table.ListTable;
local v24 = require(script.Parent.ExperienceInfoTableRow);
local v25 = require(script.Parent.ExperienceDetailsPanel);
return v2.forwardRef(function(v26, v27) --[[ Line: 46 ]]
    -- upvalues: v9 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_FFlagHideCloseButtonEdp_0 (copy), v8 (copy), v14 (copy), l_useDispatch_0 (copy), v2 (copy), v19 (copy), l_AppLinking_0 (copy), v20 (copy), v21 (copy), v13 (copy), l_useLocalization_0 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_useTokens_0 (copy), l_ListTable_0 (copy), v3 (copy), v24 (copy), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (copy), v25 (copy)
    local v28 = v9(v26.universeId, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v26.shouldHydrateLegacyIxp else nil, if l_FFlagHideCloseButtonEdp_0 then v26.hideCloseButton else nil);
    local v29 = v8(v14);
    local v30 = l_useDispatch_0();
    local v32 = v2.useCallback(function(v31) --[[ Line: 54 ]]
        -- upvalues: v30 (copy), v19 (ref)
        v30(v19(v31));
    end);
    local v33 = v8(l_AppLinking_0);
    local v35 = v2.useCallback(function(v34) --[[ Line: 60 ]]
        -- upvalues: v30 (copy), v20 (ref)
        v30(v20(v34));
    end, {
        v30
    });
    local v36 = v2.useCallback(function() --[[ Line: 64 ]]
        -- upvalues: v30 (copy), v21 (ref)
        v30(v21());
    end, {
        v30
    });
    local v38 = v13(function(v37) --[[ Line: 68 ]]
        return v37.enableExperienceDetailsPanel();
    end);
    local v39 = l_useLocalization_0({
        StatsInfoTitle = "Feature.ExperienceDetails.Body.StatsInfoTitle"
    });
    local v40 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    local v41 = l_useTokens_0();
    local v43 = v2.createElement(l_ListTable_0, {
        cells = v3.map(v28.rows, function(v42) --[[ Line: 82 ]]
            -- upvalues: v2 (ref), v24 (ref), v38 (copy), v41 (copy), v26 (copy), v40 (copy), v29 (copy), v28 (copy), v32 (copy), v35 (copy), v36 (copy), v33 (copy), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (ref)
            return v2.createElement(v24, {
                horizontalPadding = if not v38 then v41.Padding.Medium else nil, 
                infoName = v42.infoName, 
                infoData = v42.infoData or "", 
                infoIcon = v42.infoIcon, 
                renderTextOverride = v42.infoDataOverride and v26.renderTextOverride and function() --[[ Line: 89 ]]
                    -- upvalues: v42 (copy), v26 (ref)
                    return v42.infoDataOverride(v26.renderTextOverride);
                end or nil, 
                linkProps = if not (not not v42.linkPage or v42.navigateOverride) or v40 then nil else {
                    eventIngest = v29, 
                    rootPlaceId = v28.rootPlaceId, 
                    linkPage = v42.linkPage, 
                    linkUrl = v42.linkUrl, 
                    navigate = v42.navigateOverride or v32, 
                    analyticsSubPage = v42.analyticsSubPage
                }, 
                externalLinkProps = if not v42.linkUrl or v40 then nil else {
                    linkUrl = v42.linkUrl, 
                    openLeaveRobloxAlert = v35, 
                    closeAlert = v36, 
                    linking = v33, 
                    clickCallback = v42.linkClickCallback
                }, 
                universeId = if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then v26.universeId else nil, 
                testId = v42.testId
            });
        end), 
        automaticSize = Enum.AutomaticSize.Y, 
        dividerStartOffset = not v38 and 0 or nil
    });
    if v38 then
        return v2.createElement(v25, {
            ref = v27, 
            title = v39.StatsInfoTitle, 
            roundContentCorners = true
        }, v43);
    else
        return v43;
    end;
end);