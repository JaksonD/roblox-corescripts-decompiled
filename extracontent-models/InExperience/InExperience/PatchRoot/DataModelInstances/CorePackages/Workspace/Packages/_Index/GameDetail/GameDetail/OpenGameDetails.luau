local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameDetail");
local v1 = require(l_script_FirstAncestor_0.PeekView.SetGameDetailsPeekViewState);
local v2 = require(l_script_FirstAncestor_0.PeekView.UseGameDetailsPeekView);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.Cryo);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local l_PeekViewState_0 = require(l_Parent_0.PeekView).PeekViewState;
local v8 = require(l_Parent_0.NavigationRodux);
local l_NavigateDown_0 = v8.Thunks.NavigateDown;
local l_Selectors_0 = v8.Selectors;
local v11 = require(script.Parent.ExperienceDetailsPage.getExperienceDetailsPageKey);
local v12 = require(script.Parent.ExperienceDetailsPage.fetchExperienceDetailsPage);
local l_FFlagUseNavigationSelectors_0 = require(l_Parent_0.SharedFlags).FFlagUseNavigationSelectors;
local l_FFlagLuaAppSduiEdpEnabled_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiEdpEnabled;
local l_SduiLoadTimer_0 = require(l_Parent_0.SduiSharedUtilities).SduiLoadTimer;
local v16 = require(l_Parent_0.GameDetailTelemetry);
local l_EDPTTIManager_0 = v16.EDPTTIManager;
local l_FFlagEDPTTITrackingEnabled_0 = v16.FFlagEDPTTITrackingEnabled;
local l_EDPTTIConstants_0 = v16.EDPTTIConstants;
return function(v20, v21, v22) --[[ Line: 30 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), l_FFlagEDPTTITrackingEnabled_0 (copy), l_EDPTTIManager_0 (copy), l_EDPTTIConstants_0 (copy), l_FFlagLuaAppSduiEdpEnabled_0 (copy), v11 (copy), l_SduiLoadTimer_0 (copy), l_AppPage_0 (copy), v4 (copy), v12 (copy), l_FormFactor_0 (copy), v2 (copy), l_PeekViewState_0 (copy), v1 (copy), l_NavigateDown_0 (copy)
    return function(v23) --[[ Line: 31 ]]
        -- upvalues: l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref), l_FFlagEDPTTITrackingEnabled_0 (ref), l_EDPTTIManager_0 (ref), l_EDPTTIConstants_0 (ref), l_FFlagLuaAppSduiEdpEnabled_0 (ref), v11 (ref), v20 (copy), l_SduiLoadTimer_0 (ref), l_AppPage_0 (ref), v22 (ref), v4 (ref), v12 (ref), l_FormFactor_0 (ref), v2 (ref), l_PeekViewState_0 (ref), v1 (ref), v21 (copy), l_NavigateDown_0 (ref)
        local v24 = v23:getState();
        local l_FormFactor_1 = v24.FormFactor;
        local l_viewState_0 = v24.GameDetailsPeekView.viewState;
        if l_FFlagUseNavigationSelectors_0 then
            if l_Selectors_0.selectNavigationLocked(v24) then
                return;
            end;
        elseif v24.Navigation.lockNavigationActions then
            return;
        end;
        if l_FFlagEDPTTITrackingEnabled_0 then
            l_EDPTTIManager_0.startTracking(l_EDPTTIConstants_0.EDP_ENTRY_PATH.GAME_DETAIL_OPEN_GAME_DETAILS);
        end;
        if l_FFlagLuaAppSduiEdpEnabled_0 then
            local v27 = v11((tostring(v20)));
            local v28 = l_SduiLoadTimer_0.createLoadTimer(l_AppPage_0.ExperienceDetail);
            v22 = v4.Dictionary.join(v22 or {}, {
                pageTimer = l_SduiLoadTimer_0.createLoadTimer(v27)
            });
            v12(tostring(v20), v28);
        end;
        local v29 = nil;
        if l_FormFactor_1 == l_FormFactor_0.COMPACT and v2() then
            v29 = {
                name = l_AppPage_0.GameDetail, 
                detail = tostring(v20), 
                extraProps = v22
            };
            if l_viewState_0 == l_PeekViewState_0.Full or l_viewState_0 == l_PeekViewState_0.Extended or v22 and v22.mountAsFullView then
                v29 = v4.Dictionary.join(v29, {
                    extraProps = v4.Dictionary.join(v29.extraProps or {}, {
                        mountAsFullView = true
                    })
                });
            else
                v23:dispatch(v1(l_PeekViewState_0.Closed));
                v21.clearAppScreens({
                    l_AppPage_0.GameDetail
                });
            end;
        else
            v29 = {
                name = l_AppPage_0.ExperienceDetail, 
                detail = tostring(v20), 
                extraProps = v22
            };
        end;
        v23:dispatch(l_NavigateDown_0(v29));
    end;
end;