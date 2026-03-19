local l_Parent_0 = script.Parent;
local l_Responsive_0 = l_Parent_0.Parent.Responsive;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent.Parent;
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Responsive_0.ResponsiveLayoutContext);
local v5 = require(l_Responsive_0.ResponsiveLayoutConfigReader);
return function(v6, v7) --[[ Line: 27 ]]
    -- upvalues: v3 (copy), v4 (copy), v5 (copy)
    return function(v8) --[[ Line: 28 ]]
        -- upvalues: v3 (ref), v4 (ref), v6 (copy), v5 (ref), v7 (copy)
        return v3.createElement(v4.Consumer, {
            render = function(v9) --[[ Line: 30 ]] --[[ Name: render ]]
                -- upvalues: v6 (ref), v5 (ref), v7 (ref), v8 (copy)
                local v10 = {};
                for v11, v12 in pairs(v6) do
                    v10[v11] = v5.getValue({
                        config = v9.config, 
                        breakpoint = v9.breakpoint, 
                        kind = v7 or v9.kind
                    }, v11);
                    if v10[v11] == nil then
                        v10[v11] = v12;
                    end;
                end;
                return v8(v10);
            end
        });
    end;
end;