local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Actions.NavigateIntoChat);
local l_NavigateToRoute_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateToRoute;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v5 = require(l_script_FirstAncestor_0.EnumScreens);
local v6 = {
    {
        name = l_AppPage_0.Chat
    }
};
return function(v7, v8) --[[ Line: 19 ]]
    -- upvalues: l_NavigateToRoute_0 (copy), v6 (copy), v2 (copy), v5 (copy)
    return function(v9) --[[ Line: 20 ]]
        -- upvalues: l_NavigateToRoute_0 (ref), v6 (ref), v8 (copy), v2 (ref), v5 (ref), v7 (copy)
        v9:dispatch(l_NavigateToRoute_0(v6, v8));
        v9:dispatch(v2({
            screen = v5.SquadLobby, 
            params = v7
        }));
    end;
end;