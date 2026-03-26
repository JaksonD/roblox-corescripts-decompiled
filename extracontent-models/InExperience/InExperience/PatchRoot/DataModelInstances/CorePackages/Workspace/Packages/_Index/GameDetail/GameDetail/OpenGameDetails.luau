local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameDetail");
local v1 = require(l_script_FirstAncestor_0.PeekView.SetGameDetailsPeekViewState);
local v2 = require(l_script_FirstAncestor_0.PeekView.UseGameDetailsPeekView);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.Cryo);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local l_PeekViewState_0 = require(l_Parent_0.PeekView).PeekViewState;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v9 = require(script.Parent.ExperienceDetailsPage.getExperienceDetailsPageKey);
local v10 = require(script.Parent.ExperienceDetailsPage.fetchExperienceDetailsPage);
local l_FFlagLuaAppSduiEdpEnabled_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiEdpEnabled;
local l_SduiLoadTimer_0 = require(l_Parent_0.SduiSharedUtilities).SduiLoadTimer;
local v13 = require(l_Parent_0.GameDetailTelemetry);
local l_EDPTTIManager_0 = v13.EDPTTIManager;
local l_FFlagEDPTTITrackingEnabled_0 = v13.FFlagEDPTTITrackingEnabled;
local l_EDPTTIConstants_0 = v13.EDPTTIConstants;
return function(v17, v18, v19) --[[ Line: 27 ]]
    -- upvalues: l_FFlagEDPTTITrackingEnabled_0 (copy), l_EDPTTIManager_0 (copy), l_EDPTTIConstants_0 (copy), l_FFlagLuaAppSduiEdpEnabled_0 (copy), v9 (copy), l_SduiLoadTimer_0 (copy), l_AppPage_0 (copy), v4 (copy), v10 (copy), l_FormFactor_0 (copy), v2 (copy), l_PeekViewState_0 (copy), v1 (copy), l_NavigateDown_0 (copy)
    return function(v20) --[[ Line: 28 ]]
        -- upvalues: l_FFlagEDPTTITrackingEnabled_0 (ref), l_EDPTTIManager_0 (ref), l_EDPTTIConstants_0 (ref), l_FFlagLuaAppSduiEdpEnabled_0 (ref), v9 (ref), v17 (copy), l_SduiLoadTimer_0 (ref), l_AppPage_0 (ref), v19 (ref), v4 (ref), v10 (ref), l_FormFactor_0 (ref), v2 (ref), l_PeekViewState_0 (ref), v1 (ref), v18 (copy), l_NavigateDown_0 (ref)
        local v21 = v20:getState();
        local l_FormFactor_1 = v21.FormFactor;
        local l_viewState_0 = v21.GameDetailsPeekView.viewState;
        if v21.Navigation.lockNavigationActions then
            return;
        else
            if l_FFlagEDPTTITrackingEnabled_0 then
                l_EDPTTIManager_0.startTracking(l_EDPTTIConstants_0.EDP_ENTRY_PATH.GAME_DETAIL_OPEN_GAME_DETAILS);
            end;
            if l_FFlagLuaAppSduiEdpEnabled_0 then
                local v24 = v9((tostring(v17)));
                local v25 = l_SduiLoadTimer_0.createLoadTimer(l_AppPage_0.ExperienceDetail);
                v19 = v4.Dictionary.join(v19 or {}, {
                    pageTimer = l_SduiLoadTimer_0.createLoadTimer(v24)
                });
                v10(tostring(v17), v25);
            end;
            local v26 = nil;
            if l_FormFactor_1 == l_FormFactor_0.COMPACT and v2() then
                v26 = {
                    name = l_AppPage_0.GameDetail, 
                    detail = tostring(v17), 
                    extraProps = v19
                };
                if l_viewState_0 == l_PeekViewState_0.Full or l_viewState_0 == l_PeekViewState_0.Extended or v19 and v19.mountAsFullView then
                    v26 = v4.Dictionary.join(v26, {
                        extraProps = v4.Dictionary.join(v26.extraProps or {}, {
                            mountAsFullView = true
                        })
                    });
                else
                    v20:dispatch(v1(l_PeekViewState_0.Closed));
                    v18.clearAppScreens({
                        l_AppPage_0.GameDetail
                    });
                end;
            else
                v26 = {
                    name = l_AppPage_0.ExperienceDetail, 
                    detail = tostring(v17), 
                    extraProps = v19
                };
            end;
            v20:dispatch(l_NavigateDown_0(v26));
            return;
        end;
    end;
end;