local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Object_0 = require(l_Parent_1.LuauPolyfill).Object;
local v3 = require(l_Parent_0.Events);
local v4 = require(l_Parent_0.routers.getNavigationActionCreators);
local v5 = require(l_Parent_0.getChildNavigation);
local v6 = require(l_Parent_0.getChildrenNavigationCache);
return function(v7, v8, v9, v10, v11, v12) --[[ Line: 13 ]]
    -- upvalues: v6 (copy), v5 (copy), v3 (copy), l_Object_0 (copy), v4 (copy)
    local v13 = v7.getActionCreators(v8, nil);
    local v14 = {
        actions = v13, 
        router = v7, 
        state = v8, 
        dispatch = v9, 
        getScreenProps = v11, 
        _dangerouslyGetParent = function() --[[ Line: 24 ]] --[[ Name: _dangerouslyGetParent ]]
            return nil;
        end, 
        isFirstRouteInParent = function() --[[ Line: 27 ]] --[[ Name: isFirstRouteInParent ]]
            return true;
        end, 
        _childrenNavigation = v6(v12())
    };
    v14.getChildNavigation = function(v15) --[[ Line: 33 ]] --[[ Name: getChildNavigation ]]
        -- upvalues: v5 (ref), v14 (copy), v12 (copy)
        return v5(v14, v15, v12);
    end;
    v14.isFocused = function(v16) --[[ Line: 37 ]] --[[ Name: isFocused ]]
        -- upvalues: v12 (copy)
        local l_state_0 = v12().state;
        local l_routes_0 = l_state_0.routes;
        local l_index_0 = l_state_0.index;
        local v20 = true;
        if v16 ~= nil then
            v20 = l_routes_0[l_index_0].key == v16;
        end;
        return v20;
    end;
    v14.addListener = function(v21, v22) --[[ Line: 45 ]] --[[ Name: addListener ]]
        -- upvalues: v3 (ref), v10 (copy)
        if v21 ~= v3.Action then
            return {
                remove = function() --[[ Line: 47 ]] --[[ Name: remove ]]

                end
            };
        else
            v10[v22] = true;
            return {
                remove = function() --[[ Line: 51 ]] --[[ Name: remove ]]
                    -- upvalues: v10 (ref), v22 (copy)
                    v10[v22] = nil;
                end
            };
        end;
    end;
    local v23 = l_Object_0.assign(v4(v14.state), v13);
    for v24, _ in v23 do
        v14[v24] = function(...) --[[ Line: 61 ]]
            -- upvalues: v14 (copy), v23 (copy), v24 (copy)
            v14.dispatch(v23[v24](...));
        end;
    end;
    return v14;
end;