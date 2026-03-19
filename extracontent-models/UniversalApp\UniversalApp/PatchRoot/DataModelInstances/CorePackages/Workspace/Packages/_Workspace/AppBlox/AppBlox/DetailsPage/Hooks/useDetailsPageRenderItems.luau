local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.React);
local _ = require(script.Parent.Parent.Types);
return function(v3, v4, v5, v6) --[[ Line: 9 ]] --[[ Name: useDetailsPageRenderItems ]]
    -- upvalues: v1 (copy)
    local v12 = v1.useMemo(function() --[[ Line: 15 ]]
        -- upvalues: v3 (copy)
        local v7 = {};
        for v8, v9 in v3 do
            table.insert(v7, {
                index = v9.portraitLayoutOrder + 1, 
                renderComponent = v9.renderComponent, 
                showCornerGradient = v9.showCornerGradient, 
                useSelectionBumper = v9.useSelectionBumper, 
                key = v8
            });
        end;
        table.sort(v7, function(v10, v11) --[[ Line: 27 ]]
            if not v11.index then
                return true;
            elseif not v10.index then
                return false;
            else
                return v10.index <= v11.index;
            end;
        end);
        return v7;
    end, {
        v3
    });
    return (v1.useMemo(function() --[[ Line: 40 ]]
        -- upvalues: v12 (copy), v1 (ref), v5 (copy), v6 (copy), v4 (copy)
        local v13 = table.clone(v12);
        table.insert(v13, 1, {
            index = 1, 
            key = "Header", 
            showCornerGradient = true, 
            renderComponent = function() --[[ Line: 47 ]] --[[ Name: renderComponent ]]
                -- upvalues: v1 (ref), v5 (ref), v6 (ref), v4 (ref)
                return v1.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v5.Y - v6.Y * 2), 
                    BackgroundTransparency = 1
                }, {
                    Layout = v1.createElement("UIListLayout", {
                        VerticalAlignment = Enum.VerticalAlignment.Bottom
                    }), 
                    HeaderContainer = v4
                });
            end
        });
        return v13;
    end, {
        v12, 
        v4, 
        v5.Y, 
        v6.Y
    }));
end;