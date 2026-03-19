local l_MenuButtons_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("Modules"):WaitForChild("Settings"):WaitForChild("Components"):WaitForChild("MenuButtons");
local l_Parent_0 = script:FindFirstAncestor("PeopleReactView").Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.PeopleService);
local v5 = require(l_Parent_0.SignalsReact);
local l_View_0 = v2.View;
local l_useSignalState_0 = v5.useSignalState;
local l_MenuButtons_1 = require(l_MenuButtons_0:WaitForChild("MenuButtons"));
return function() --[[ Line: 27 ]]
    -- upvalues: v3 (copy), v4 (copy), l_useSignalState_0 (copy), l_View_0 (copy), l_MenuButtons_1 (copy)
    local v9 = v3.useMemo(function() --[[ Line: 28 ]]
        -- upvalues: v4 (ref)
        return v4.getService("SettingsHubService");
    end, {});
    local v10 = l_useSignalState_0(v9.showMenuButtonsContainer);
    local v12 = v3.useMemo(function() --[[ Line: 34 ]]
        -- upvalues: v9 (copy)
        local v11 = v9.hubRef();
        if v11 then
            return v11:GetExperienceControlStore();
        else
            return nil;
        end;
    end, {});
    if not v12 or not v10 then
        return nil;
    else
        return v3.createElement(l_View_0, {
            LayoutOrder = -1, 
            tag = "size-full-1000"
        }, {
            MenuButtonsContainer = v3.createElement(l_MenuButtons_1, {
                onLeaveGame = v12.onLeaveGame, 
                onRespawn = v12.onRespawn, 
                onResume = v12.onResume, 
                setAddMenuKeyBindings = function() --[[ Line: 54 ]] --[[ Name: setAddMenuKeyBindings ]]

                end, 
                setRemoveMenuKeyBindings = function() --[[ Line: 55 ]] --[[ Name: setRemoveMenuKeyBindings ]]

                end, 
                getVisibility = function() --[[ Line: 56 ]] --[[ Name: getVisibility ]]
                    return true;
                end, 
                getCanRespawn = v12.getCanRespawn
            })
        });
    end;
end;