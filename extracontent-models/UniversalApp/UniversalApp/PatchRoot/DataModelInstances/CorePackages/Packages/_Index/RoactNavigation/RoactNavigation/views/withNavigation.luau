local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v4 = require(l_Parent_2.React);
local v5 = require(l_Parent_0.NavigationContext);
local v6 = require(l_Parent_1.utils.invariant);
local function _(v7) --[[ Line: 11 ]] --[[ Name: isComponent ]]
    local v8 = type(v7);
    local v9 = true;
    if v8 ~= "function" then
        v9 = v8 == "table";
    end;
    return v9;
end;
return function(v11, v12) --[[ Line: 35 ]]
    -- upvalues: l_Object_0 (copy), v4 (copy), v5 (copy), v6 (copy)
    local v13 = type(v11);
    local v14 = true;
    if v13 ~= "function" then
        v14 = v13 == "table";
    end;
    assert(v14, "withNavigation must be called with a Roact component (stateful or functional)");
    local v15 = l_Object_0.assign({
        forwardRef = true
    }, v12);
    return function(v16) --[[ Line: 39 ]]
        -- upvalues: v4 (ref), v5 (ref), v6 (ref), v11 (copy), l_Object_0 (ref), v15 (copy)
        local l_navigation_0 = v16.navigation;
        return v4.createElement(v5.Consumer, {
            render = function(v18) --[[ Line: 42 ]] --[[ Name: render ]]
                -- upvalues: l_navigation_0 (copy), v6 (ref), v4 (ref), v11 (ref), l_Object_0 (ref), v16 (copy), v15 (ref)
                local v19 = l_navigation_0 or v18;
                v6(v19, "withNavigation and withNavigationFocus can only be used on a view hierarchy of a navigator. The wrapped component is unable to get access to navigation from props or context.");
                return v4.createElement(v11, l_Object_0.assign(table.clone(v16), {
                    navigation = v19, 
                    ref = if v15.forwardRef then v16.onRef else l_Object_0.None
                }));
            end
        });
    end;
end;