local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_NavigateDown_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Thunks.NavigateDown;
local v6 = require(l_CorePackages_0.Workspace.Packages.GameDetail);
local l_SetGameDetailsPeekViewState_0 = v6.PeekView.SetGameDetailsPeekViewState;
local l_UseGameDetailsPeekView_0 = v6.PeekView.UseGameDetailsPeekView;
local l_FFlagLuaAppSduiEdpEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppSduiEdpEnabled;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v11 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v12 = require(l_Modules_0.LuaApp.Util.startNewPeekViewHistory);
local function _(v13, v14) --[[ Line: 19 ]] --[[ Name: openBriefGameDetailsPeekView ]]
    -- upvalues: v12 (copy), l_SetGameDetailsPeekViewState_0 (copy), l_PeekViewState_0 (copy), v11 (copy)
    local v15 = v12(v13, v14);
    local l_newRoute_0 = v15.newRoute;
    local l_newHistory_0 = v15.newHistory;
    v13:dispatch(l_SetGameDetailsPeekViewState_0(l_PeekViewState_0.Closed));
    v13:dispatch(v11(l_newRoute_0, l_newHistory_0));
end;
local function v22(v19, v20) --[[ Line: 28 ]] --[[ Name: openFullGameDetailsPeekView ]]
    -- upvalues: v1 (copy), l_NavigateDown_0 (copy)
    local v21 = v1.Dictionary.join(v20, {
        extraProps = v1.Dictionary.join(v20.extraProps or {}, {
            mountAsFullView = true
        })
    });
    v19:dispatch(l_NavigateDown_0(v21));
end;
local function _(v23, v24) --[[ Line: 35 ]] --[[ Name: openExperienceDetailsPage ]]
    -- upvalues: v1 (copy), l_AppPage_0 (copy), l_NavigateDown_0 (copy)
    local v25 = v1.Dictionary.join(v24, {
        name = l_AppPage_0.ExperienceDetail
    });
    v23:dispatch(l_NavigateDown_0(v25));
end;
return function(v27, v28) --[[ Line: 42 ]]
    -- upvalues: l_FFlagLuaAppSduiEdpEnabled_0 (copy), l_CorePackages_0 (copy), l_AppPage_0 (copy), v1 (copy), l_FormFactor_0 (copy), l_UseGameDetailsPeekView_0 (copy), l_PeekViewState_0 (copy), v22 (copy), v12 (copy), l_SetGameDetailsPeekViewState_0 (copy), v11 (copy), l_NavigateDown_0 (copy)
    return function(v29) --[[ Line: 43 ]]
        -- upvalues: l_FFlagLuaAppSduiEdpEnabled_0 (ref), l_CorePackages_0 (ref), l_AppPage_0 (ref), v28 (ref), v1 (ref), v27 (copy), l_FormFactor_0 (ref), l_UseGameDetailsPeekView_0 (ref), l_PeekViewState_0 (ref), v22 (ref), v12 (ref), l_SetGameDetailsPeekViewState_0 (ref), v11 (ref), l_NavigateDown_0 (ref)
        if l_FFlagLuaAppSduiEdpEnabled_0 then
            local v30 = require(l_CorePackages_0.Workspace.Packages.GameDetail);
            local l_SduiLoadTimer_0 = require(l_CorePackages_0.Workspace.Packages.SduiSharedUtilities).SduiLoadTimer;
            local l_fetchExperienceDetailsPage_0 = v30.fetchExperienceDetailsPage;
            local v33 = l_SduiLoadTimer_0.createLoadTimer(l_AppPage_0.ExperienceDetail);
            v28 = v1.Dictionary.join(v28 or {}, {
                pageTimer = v33
            });
            l_fetchExperienceDetailsPage_0(tostring(v27), v33);
        end;
        local v34 = {
            name = l_AppPage_0.GameDetail, 
            detail = tostring(v27), 
            extraProps = v28
        };
        local v35 = v29:getState();
        local l_FormFactor_1 = v35.FormFactor;
        local l_viewState_0 = v35.GameDetailsPeekView.viewState;
        if l_FormFactor_1 == l_FormFactor_0.COMPACT and l_UseGameDetailsPeekView_0() then
            if l_viewState_0 == l_PeekViewState_0.Full or l_viewState_0 == l_PeekViewState_0.Extended or v28 and v28.mountAsFullView then
                v22(v29, v34);
                return;
            else
                local v38 = v12(v29, v34);
                local l_newRoute_1 = v38.newRoute;
                local l_newHistory_1 = v38.newHistory;
                v29:dispatch(l_SetGameDetailsPeekViewState_0(l_PeekViewState_0.Closed));
                v29:dispatch(v11(l_newRoute_1, l_newHistory_1));
                return;
            end;
        else
            local v41 = v1.Dictionary.join(v34, {
                name = l_AppPage_0.ExperienceDetail
            });
            v29:dispatch(l_NavigateDown_0(v41));
            return;
        end;
    end;
end;