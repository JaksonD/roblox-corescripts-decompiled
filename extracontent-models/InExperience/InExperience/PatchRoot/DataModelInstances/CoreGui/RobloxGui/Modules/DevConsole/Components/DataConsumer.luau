local l_CorePackages_0 = game:GetService("CorePackages");
local l_Components_0 = script.Parent.Parent.Components;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(script.Parent.Parent.Immutable);
local v4 = require(l_Components_0.DataContext);
return function(v5, ...) --[[ Line: 8 ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy)
    if not v5 then
        error("Expected component to be passed to connection, got nil.");
    end;
    local v6 = {};
    for v7 = 1, select("#", ...) do
        v6[v7] = select(v7, ...);
    end;
    local v8 = string.format("Consumer(%s)_DependsOn_%s", tostring(v5), v6[1]);
    local v9 = v2.Component:extend(v8);
    v9.init = function(v10) --[[ Line: 21 ]] --[[ Name: init ]]
        -- upvalues: v6 (copy)
        local v11 = {};
        for _, v13 in pairs(v6) do
            local v14 = v10.props.DevConsoleData[v13];
            if not v14 then
                local v15 = string.format("%s %s", tostring(v13), "could not be found. Make sure DataProvider is above this consumer");
                error(v15);
                return;
            else
                v11[v13] = v14;
            end;
        end;
        v10:setState(v11);
    end;
    v9.render = function(v16) --[[ Line: 40 ]] --[[ Name: render ]]
        -- upvalues: v3 (ref), v2 (ref), v5 (copy)
        local v17 = v3.JoinDictionaries(v16.props.componentProps, v16.state);
        return v2.createElement(v5, v17);
    end;
    return function(v18) --[[ Line: 45 ]] --[[ Name: DataConsumerWrapper ]]
        -- upvalues: v2 (ref), v4 (ref), v9 (copy)
        return v2.createElement(v4.Consumer, {
            render = function(v19) --[[ Line: 47 ]] --[[ Name: render ]]
                -- upvalues: v2 (ref), v9 (ref), v18 (copy)
                return v2.createElement(v9, {
                    componentProps = v18, 
                    DevConsoleData = v19
                });
            end
        });
    end;
end;