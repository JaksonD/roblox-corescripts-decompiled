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
return function(v13, v14, v15) --[[ Line: 22 ]]
    -- upvalues: l_FFlagLuaAppSduiEdpEnabled_0 (copy), v9 (copy), l_SduiLoadTimer_0 (copy), l_AppPage_0 (copy), v4 (copy), v10 (copy), l_FormFactor_0 (copy), v2 (copy), l_PeekViewState_0 (copy), v1 (copy), l_NavigateDown_0 (copy)
    return function(v16) --[[ Line: 23 ]]
        -- upvalues: l_FFlagLuaAppSduiEdpEnabled_0 (ref), v9 (ref), v13 (copy), l_SduiLoadTimer_0 (ref), l_AppPage_0 (ref), v15 (ref), v4 (ref), v10 (ref), l_FormFactor_0 (ref), v2 (ref), l_PeekViewState_0 (ref), v1 (ref), v14 (copy), l_NavigateDown_0 (ref)
        local v17 = v16:getState();
        local l_FormFactor_1 = v17.FormFactor;
        local l_viewState_0 = v17.GameDetailsPeekView.viewState;
        if v17.Navigation.lockNavigationActions then
            return;
        else
            if l_FFlagLuaAppSduiEdpEnabled_0 then
                local v20 = v9((tostring(v13)));
                local v21 = l_SduiLoadTimer_0.createLoadTimer(l_AppPage_0.ExperienceDetail);
                v15 = v4.Dictionary.join(v15 or {}, {
                    pageTimer = l_SduiLoadTimer_0.createLoadTimer(v20)
                });
                v10(tostring(v13), v21);
            end;
            local v22 = nil;
            if l_FormFactor_1 == l_FormFactor_0.COMPACT and v2() then
                v22 = {
                    name = l_AppPage_0.GameDetail, 
                    detail = tostring(v13), 
                    extraProps = v15
                };
                if l_viewState_0 == l_PeekViewState_0.Full or l_viewState_0 == l_PeekViewState_0.Extended or v15 and v15.mountAsFullView then
                    v22 = v4.Dictionary.join(v22, {
                        extraProps = v4.Dictionary.join(v22.extraProps or {}, {
                            mountAsFullView = true
                        })
                    });
                else
                    v16:dispatch(v1(l_PeekViewState_0.Closed));
                    v14.clearAppScreens({
                        l_AppPage_0.GameDetail
                    });
                end;
            else
                v22 = {
                    name = l_AppPage_0.ExperienceDetail, 
                    detail = tostring(v13), 
                    extraProps = v15
                };
            end;
            v16:dispatch(l_NavigateDown_0(v22));
            return;
        end;
    end;
end;