local l_Parent_0 = script:FindFirstAncestor("RobloxAppNavigationCore").Parent;
local v1 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.Navigation);
local v3 = require(script.Parent.createLazyStackRouter);
local v4 = require(script.Parent.LuaAppNavigationActions);
return function(v5, v6) --[[ Line: 10 ]]
    -- upvalues: v1 (copy), v4 (copy), v3 (copy)
    local v9 = v1.Dictionary.join(v6 or {}, {
        getCustomActionCreators = function(_, _) --[[ Line: 12 ]] --[[ Name: getCustomActionCreators ]]
            -- upvalues: v4 (ref)
            return {
                clearAppScreens = v4.clearAppScreens
            };
        end
    });
    local v10 = v3(v5, v9);
    local l_getStateForAction_0 = v10.getStateForAction;
    v10.getStateForAction = function(v12, v13) --[[ Line: 21 ]] --[[ Name: getStateForAction ]]
        -- upvalues: v4 (ref), v1 (ref), l_getStateForAction_0 (copy)
        if v12.type == v4.ClearAppScreensAction then
            local v14 = v1.List.toSet(v12.routeNames);
            local v16 = v1.List.filter(v13.routes, function(v15) --[[ Line: 24 ]]
                -- upvalues: v14 (copy)
                return not v14[v15.routeName];
            end);
            return (v1.Dictionary.join(v13, {
                routes = v16, 
                index = #v16
            }));
        else
            return l_getStateForAction_0(v12, v13);
        end;
    end;
    return v10;
end;