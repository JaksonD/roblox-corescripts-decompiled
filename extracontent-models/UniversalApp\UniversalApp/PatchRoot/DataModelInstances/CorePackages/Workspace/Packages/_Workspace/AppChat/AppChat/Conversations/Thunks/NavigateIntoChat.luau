local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Actions.NavigateIntoChat);
local l_NavigateToRoute_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateToRoute;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v5 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableStandaloneAppChat);
local v6 = require(l_script_FirstAncestor_0.EnumScreens);
local v7 = {
    {
        name = l_AppPage_0.Chat
    }
};
return function(v8, v9) --[[ Line: 21 ]]
    -- upvalues: l_NavigateToRoute_0 (copy), v7 (copy), v2 (copy), v5 (copy), v6 (copy)
    return function(v10) --[[ Line: 22 ]]
        -- upvalues: l_NavigateToRoute_0 (ref), v7 (ref), v9 (copy), v2 (ref), v5 (ref), v6 (ref), v8 (copy)
        v10:dispatch(l_NavigateToRoute_0(v7, v9));
        v10:dispatch(v2({
            screen = if v5() then v6.ChatConversation else v6.RoactChat, 
            params = v8
        }));
    end;
end;