local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoactNavigation);
local v3 = require(l_script_FirstAncestor_0.EnumScreens);
return function(v4, v5, v6) --[[ Line: 9 ]]
    -- upvalues: v3 (copy), v2 (copy)
    v4.navigate(v3.ChatLanding, nil, v2.StackActions.reset({
        index = 2, 
        actions = {
            v2.Actions.navigate({
                routeName = v3.ChatConversation, 
                params = {
                    conversationId = v5
                }
            }), 
            v2.Actions.navigate({
                routeName = v3.SquadLobby, 
                params = {
                    conversationId = v5, 
                    extraParams = v6
                }
            })
        }
    }));
end;