local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameDetail");
local v1 = require(l_script_FirstAncestor_0.PeekView.SetGameDetailsPeekViewState);
local v2 = require(l_script_FirstAncestor_0.PeekView.UseGameDetailsPeekView);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.Cryo);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local l_PeekViewState_0 = require(l_Parent_0.PeekView).PeekViewState;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
return function(v9, v10, v11) --[[ Line: 12 ]]
    -- upvalues: l_FormFactor_0 (copy), v2 (copy), l_AppPage_0 (copy), l_PeekViewState_0 (copy), v4 (copy), v1 (copy), l_NavigateDown_0 (copy)
    return function(v12) --[[ Line: 13 ]]
        -- upvalues: l_FormFactor_0 (ref), v2 (ref), l_AppPage_0 (ref), v9 (copy), v11 (copy), l_PeekViewState_0 (ref), v4 (ref), v1 (ref), v10 (copy), l_NavigateDown_0 (ref)
        local v13 = v12:getState();
        local l_FormFactor_1 = v13.FormFactor;
        local l_viewState_0 = v13.GameDetailsPeekView.viewState;
        if v13.Navigation.lockNavigationActions then
            return;
        else
            local v16 = nil;
            if l_FormFactor_1 == l_FormFactor_0.COMPACT and v2() then
                v16 = {
                    name = l_AppPage_0.GameDetail, 
                    detail = tostring(v9), 
                    extraProps = v11
                };
                if l_viewState_0 == l_PeekViewState_0.Full or l_viewState_0 == l_PeekViewState_0.Extended or v11 and v11.mountAsFullView then
                    v16 = v4.Dictionary.join(v16, {
                        extraProps = v4.Dictionary.join(v16.extraProps or {}, {
                            mountAsFullView = true
                        })
                    });
                else
                    v12:dispatch(v1(l_PeekViewState_0.Closed));
                    v10.clearAppScreens({
                        l_AppPage_0.GameDetail
                    });
                end;
            else
                v16 = {
                    name = l_AppPage_0.ExperienceDetail, 
                    detail = tostring(v9), 
                    extraProps = v11
                };
            end;
            v12:dispatch(l_NavigateDown_0(v16));
            return;
        end;
    end;
end;