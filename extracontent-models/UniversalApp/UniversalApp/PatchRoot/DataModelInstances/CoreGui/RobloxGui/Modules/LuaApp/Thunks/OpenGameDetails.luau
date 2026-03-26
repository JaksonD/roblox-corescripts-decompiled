local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_NavigateDown_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Thunks.NavigateDown;
local v6 = require(l_CorePackages_0.Workspace.Packages.GameDetail);
local l_SetGameDetailsPeekViewState_0 = v6.PeekView.SetGameDetailsPeekViewState;
local l_UseGameDetailsPeekView_0 = v6.PeekView.UseGameDetailsPeekView;
local v9 = require(l_CorePackages_0.Workspace.Packages.GameDetailTelemetry);
local l_FFlagEDPTTITrackingEnabled_0 = v9.FFlagEDPTTITrackingEnabled;
local l_EDPTTIConstants_0 = v9.EDPTTIConstants;
local l_FFlagLuaAppSduiEdpEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppSduiEdpEnabled;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v14 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v15 = require(l_Modules_0.LuaApp.Util.startNewPeekViewHistory);
local l_EDPTTIManager_0 = v9.EDPTTIManager;
local function _(v17, v18) --[[ Line: 24 ]] --[[ Name: openBriefGameDetailsPeekView ]]
    -- upvalues: v15 (copy), l_SetGameDetailsPeekViewState_0 (copy), l_PeekViewState_0 (copy), v14 (copy)
    local v19 = v15(v17, v18);
    local l_newRoute_0 = v19.newRoute;
    local l_newHistory_0 = v19.newHistory;
    v17:dispatch(l_SetGameDetailsPeekViewState_0(l_PeekViewState_0.Closed));
    v17:dispatch(v14(l_newRoute_0, l_newHistory_0));
end;
local function v26(v23, v24) --[[ Line: 33 ]] --[[ Name: openFullGameDetailsPeekView ]]
    -- upvalues: v1 (copy), l_NavigateDown_0 (copy)
    local v25 = v1.Dictionary.join(v24, {
        extraProps = v1.Dictionary.join(v24.extraProps or {}, {
            mountAsFullView = true
        })
    });
    v23:dispatch(l_NavigateDown_0(v25));
end;
local function _(v27, v28) --[[ Line: 40 ]] --[[ Name: openExperienceDetailsPage ]]
    -- upvalues: v1 (copy), l_AppPage_0 (copy), l_NavigateDown_0 (copy)
    local v29 = v1.Dictionary.join(v28, {
        name = l_AppPage_0.ExperienceDetail
    });
    v27:dispatch(l_NavigateDown_0(v29));
end;
return function(v31, v32) --[[ Line: 47 ]]
    -- upvalues: l_FFlagEDPTTITrackingEnabled_0 (copy), l_EDPTTIManager_0 (copy), l_EDPTTIConstants_0 (copy), l_FFlagLuaAppSduiEdpEnabled_0 (copy), l_CorePackages_0 (copy), l_AppPage_0 (copy), v1 (copy), l_FormFactor_0 (copy), l_UseGameDetailsPeekView_0 (copy), l_PeekViewState_0 (copy), v26 (copy), v15 (copy), l_SetGameDetailsPeekViewState_0 (copy), v14 (copy), l_NavigateDown_0 (copy)
    return function(v33) --[[ Line: 48 ]]
        -- upvalues: l_FFlagEDPTTITrackingEnabled_0 (ref), l_EDPTTIManager_0 (ref), l_EDPTTIConstants_0 (ref), l_FFlagLuaAppSduiEdpEnabled_0 (ref), l_CorePackages_0 (ref), l_AppPage_0 (ref), v32 (ref), v1 (ref), v31 (copy), l_FormFactor_0 (ref), l_UseGameDetailsPeekView_0 (ref), l_PeekViewState_0 (ref), v26 (ref), v15 (ref), l_SetGameDetailsPeekViewState_0 (ref), v14 (ref), l_NavigateDown_0 (ref)
        if l_FFlagEDPTTITrackingEnabled_0 then
            l_EDPTTIManager_0.startTracking(l_EDPTTIConstants_0.EDP_ENTRY_PATH.GAME_DETAIL_OPEN_GAME_DETAILS);
        end;
        if l_FFlagLuaAppSduiEdpEnabled_0 then
            local v34 = require(l_CorePackages_0.Workspace.Packages.GameDetail);
            local l_SduiLoadTimer_0 = require(l_CorePackages_0.Workspace.Packages.SduiSharedUtilities).SduiLoadTimer;
            local l_fetchExperienceDetailsPage_0 = v34.fetchExperienceDetailsPage;
            local v37 = l_SduiLoadTimer_0.createLoadTimer(l_AppPage_0.ExperienceDetail);
            v32 = v1.Dictionary.join(v32 or {}, {
                pageTimer = v37
            });
            l_fetchExperienceDetailsPage_0(tostring(v31), v37);
        end;
        local v38 = {
            name = l_AppPage_0.GameDetail, 
            detail = tostring(v31), 
            extraProps = v32
        };
        local v39 = v33:getState();
        local l_FormFactor_1 = v39.FormFactor;
        local l_viewState_0 = v39.GameDetailsPeekView.viewState;
        if l_FormFactor_1 == l_FormFactor_0.COMPACT and l_UseGameDetailsPeekView_0() then
            if l_viewState_0 == l_PeekViewState_0.Full or l_viewState_0 == l_PeekViewState_0.Extended or v32 and v32.mountAsFullView then
                v26(v33, v38);
                return;
            else
                local v42 = v15(v33, v38);
                local l_newRoute_1 = v42.newRoute;
                local l_newHistory_1 = v42.newHistory;
                v33:dispatch(l_SetGameDetailsPeekViewState_0(l_PeekViewState_0.Closed));
                v33:dispatch(v14(l_newRoute_1, l_newHistory_1));
                return;
            end;
        else
            local v45 = v1.Dictionary.join(v38, {
                name = l_AppPage_0.ExperienceDetail
            });
            v33:dispatch(l_NavigateDown_0(v45));
            return;
        end;
    end;
end;