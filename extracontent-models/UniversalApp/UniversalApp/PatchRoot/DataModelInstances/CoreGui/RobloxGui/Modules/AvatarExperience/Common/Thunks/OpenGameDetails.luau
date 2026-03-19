local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.AppPage);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v5 = require(l_Modules_0.LuaApp.Actions.Games.SetGameDetailsPeekViewState);
local v6 = require(l_Modules_0.LuaApp.Thunks.OpenGameDetails);
local v7 = require(l_Modules_0.LuaApp.Flags.UseGameDetailsPeekView);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v9 = require(l_Modules_0.AvatarExperience.Common.Actions.SetItemDetailsExpanded);
local function v13(v10, v11, v12) --[[ Line: 17 ]] --[[ Name: openBriefGameDetailsPeekView ]]
    -- upvalues: v5 (copy), l_PeekViewState_0 (copy), v9 (copy), v8 (copy)
    v10:dispatch(v5(l_PeekViewState_0.Closed));
    v10:dispatch(v9(true));
    v8.closeFiltersAndItemDetails(v11);
    v8.closeAllDialogs(v11);
    v11.navigate(v12.name, v12);
end;
return function(v14, v15, v16) --[[ Line: 27 ]]
    -- upvalues: v2 (copy), l_FormFactor_0 (copy), v7 (copy), l_PeekViewState_0 (copy), v6 (copy), v13 (copy)
    return function(v17) --[[ Line: 28 ]]
        -- upvalues: v2 (ref), v14 (copy), v16 (copy), l_FormFactor_0 (ref), v7 (ref), l_PeekViewState_0 (ref), v6 (ref), v13 (ref), v15 (copy)
        local v18 = {
            name = v2.GameDetail, 
            detail = tostring(v14), 
            extraProps = v16
        };
        local v19 = v17:getState();
        local l_FormFactor_1 = v19.FormFactor;
        local l_viewState_0 = v19.GameDetailsPeekView.viewState;
        if l_FormFactor_1 == l_FormFactor_0.COMPACT and v7() then
            if l_viewState_0 == l_PeekViewState_0.Full or l_viewState_0 == l_PeekViewState_0.Extended or v16 and v16.mountAsFullView then
                v17:dispatch(v6(v14, v16));
                return;
            else
                v13(v17, v15, v18);
                return;
            end;
        else
            v17:dispatch(v6(v14, v16));
            return;
        end;
    end;
end;