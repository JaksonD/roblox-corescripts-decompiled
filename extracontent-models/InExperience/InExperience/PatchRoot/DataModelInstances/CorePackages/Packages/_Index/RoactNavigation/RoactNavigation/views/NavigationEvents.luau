local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(script.Parent.withNavigation);
local v4 = require(l_Parent_0.Events);
local v5 = {
    [v4.WillFocus] = "onWillFocus", 
    [v4.DidFocus] = "onDidFocus", 
    [v4.WillBlur] = "onWillBlur", 
    [v4.DidBlur] = "onDidBlur"
};
local v6 = v2.Component:extend("NavigationEvents");
v6.didMount = function(v7) --[[ Line: 51 ]] --[[ Name: didMount ]]
    v7:subscribeAll();
end;
v6.didUpdate = function(v8, v9) --[[ Line: 58 ]] --[[ Name: didUpdate ]]
    if v8.props.navigation ~= v9.navigation then
        v8:removeAll();
        v8:subscribeAll();
    end;
end;
v6.willUnmount = function(v10) --[[ Line: 66 ]] --[[ Name: willUnmount ]]
    v10:removeAll();
end;
v6.getPropListener = function(v11, v12) --[[ Line: 70 ]] --[[ Name: getPropListener ]]
    -- upvalues: v5 (copy)
    return v11.props[v5[v12]];
end;
v6.subscribeAll = function(v13) --[[ Line: 74 ]] --[[ Name: subscribeAll ]]
    -- upvalues: v5 (copy)
    local l_navigation_0 = v13.props.navigation;
    v13.subscriptions = {};
    for v15 in v5 do
        v13.subscriptions[v15] = l_navigation_0.addListener(v15, function(...) --[[ Line: 80 ]]
            -- upvalues: v13 (copy), v15 (copy)
            local v16 = v13:getPropListener(v15);
            if v16 then
                v16(...);
            end;
        end);
    end;
end;
v6.removeAll = function(v17) --[[ Line: 90 ]] --[[ Name: removeAll ]]
    -- upvalues: v5 (copy)
    for v18 in v5 do
        local v19 = v17.subscriptions[v18];
        if v19 then
            v19.remove();
            v17.subscriptions[v18] = nil;
        end;
    end;
end;
v6.render = function(_) --[[ Line: 100 ]] --[[ Name: render ]]
    return nil;
end;
return v3(v6);