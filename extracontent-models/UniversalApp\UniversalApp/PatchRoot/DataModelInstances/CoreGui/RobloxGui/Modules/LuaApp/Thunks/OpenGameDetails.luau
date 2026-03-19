local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_NavigateDown_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Thunks.NavigateDown;
local v6 = require(l_CorePackages_0.Workspace.Packages.GameDetail);
local l_SetGameDetailsPeekViewState_0 = v6.PeekView.SetGameDetailsPeekViewState;
local l_UseGameDetailsPeekView_0 = v6.PeekView.UseGameDetailsPeekView;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v10 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v11 = require(l_Modules_0.LuaApp.Util.startNewPeekViewHistory);
local function _(v12, v13) --[[ Line: 16 ]] --[[ Name: openBriefGameDetailsPeekView ]]
    -- upvalues: v11 (copy), l_SetGameDetailsPeekViewState_0 (copy), l_PeekViewState_0 (copy), v10 (copy)
    local v14 = v11(v12, v13);
    local l_newRoute_0 = v14.newRoute;
    local l_newHistory_0 = v14.newHistory;
    v12:dispatch(l_SetGameDetailsPeekViewState_0(l_PeekViewState_0.Closed));
    v12:dispatch(v10(l_newRoute_0, l_newHistory_0));
end;
local function v21(v18, v19) --[[ Line: 25 ]] --[[ Name: openFullGameDetailsPeekView ]]
    -- upvalues: v1 (copy), l_NavigateDown_0 (copy)
    local v20 = v1.Dictionary.join(v19, {
        extraProps = v1.Dictionary.join(v19.extraProps or {}, {
            mountAsFullView = true
        })
    });
    v18:dispatch(l_NavigateDown_0(v20));
end;
local function _(v22, v23) --[[ Line: 32 ]] --[[ Name: openExperienceDetailsPage ]]
    -- upvalues: v1 (copy), l_AppPage_0 (copy), l_NavigateDown_0 (copy)
    local v24 = v1.Dictionary.join(v23, {
        name = l_AppPage_0.ExperienceDetail
    });
    v22:dispatch(l_NavigateDown_0(v24));
end;
return function(v26, v27) --[[ Line: 39 ]]
    -- upvalues: l_AppPage_0 (copy), l_FormFactor_0 (copy), l_UseGameDetailsPeekView_0 (copy), l_PeekViewState_0 (copy), v21 (copy), v11 (copy), l_SetGameDetailsPeekViewState_0 (copy), v10 (copy), v1 (copy), l_NavigateDown_0 (copy)
    return function(v28) --[[ Line: 40 ]]
        -- upvalues: l_AppPage_0 (ref), v26 (copy), v27 (copy), l_FormFactor_0 (ref), l_UseGameDetailsPeekView_0 (ref), l_PeekViewState_0 (ref), v21 (ref), v11 (ref), l_SetGameDetailsPeekViewState_0 (ref), v10 (ref), v1 (ref), l_NavigateDown_0 (ref)
        local v29 = {
            name = l_AppPage_0.GameDetail, 
            detail = tostring(v26), 
            extraProps = v27
        };
        local v30 = v28:getState();
        local l_FormFactor_1 = v30.FormFactor;
        local l_viewState_0 = v30.GameDetailsPeekView.viewState;
        if l_FormFactor_1 == l_FormFactor_0.COMPACT and l_UseGameDetailsPeekView_0() then
            if l_viewState_0 == l_PeekViewState_0.Full or l_viewState_0 == l_PeekViewState_0.Extended or v27 and v27.mountAsFullView then
                v21(v28, v29);
                return;
            else
                local v33 = v11(v28, v29);
                local l_newRoute_1 = v33.newRoute;
                local l_newHistory_1 = v33.newHistory;
                v28:dispatch(l_SetGameDetailsPeekViewState_0(l_PeekViewState_0.Closed));
                v28:dispatch(v10(l_newRoute_1, l_newHistory_1));
                return;
            end;
        else
            local v36 = v1.Dictionary.join(v29, {
                name = l_AppPage_0.ExperienceDetail
            });
            v28:dispatch(l_NavigateDown_0(v36));
            return;
        end;
    end;
end;