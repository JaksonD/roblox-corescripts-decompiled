local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v4 = require(l_Parent_0.getScreenForRouteName);
local v5 = require(l_Parent_0.validateScreenOptions);
local v6 = require(l_Parent_1.utils.invariant);
local function v11(v7, v8, v9) --[[ Line: 13 ]] --[[ Name: applyConfig ]]
    -- upvalues: l_Object_0 (copy)
    v8 = v8 or {};
    local v10 = type(v7);
    if v10 == "function" then
        return l_Object_0.assign({}, v8, v7(l_Object_0.assign(table.clone(v9), {
            navigationOptions = v8
        })));
    elseif v10 == "table" then
        return l_Object_0.assign(table.clone(v8), v7);
    else
        return v8;
    end;
end;
return function(v12, v13) --[[ Line: 32 ]]
    -- upvalues: v6 (copy), v4 (copy), v11 (copy), v5 (copy)
    return function(v14, v15) --[[ Line: 33 ]]
        -- upvalues: v6 (ref), v4 (ref), v12 (copy), v11 (ref), v13 (copy), v5 (ref)
        v15 = v15 or {};
        local l_state_0 = v14.state;
        v6(type(l_state_0.routeName) == "string", "Cannot get config because the route does not have a routeName.");
        local v17 = v4(v12, l_state_0.routeName);
        local v18 = v12[l_state_0.routeName];
        local v19 = nil;
        if v18 ~= v17 then
            v19 = v18.navigationOptions;
        end;
        local v20 = if type(v17) == "table" then v17.navigationOptions else {};
        local v21 = {
            navigation = v14, 
            screenProps = v15
        };
        local v22 = v11(v13, {}, v21);
        v22 = v11(v20, v22, v21);
        v22 = v11(v19, v22, v21);
        v5(v22, l_state_0);
        return v22;
    end;
end;