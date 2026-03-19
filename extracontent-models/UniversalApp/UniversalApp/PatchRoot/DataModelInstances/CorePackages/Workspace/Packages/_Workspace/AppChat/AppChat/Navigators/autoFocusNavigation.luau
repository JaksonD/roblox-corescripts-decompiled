local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.FocusNavigationUtils);
local v3 = require(l_Parent_0.ReactFocusNavigation);
return function(v4, _) --[[ Line: 9 ]] --[[ Name: autoFocusNavigation ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    return function(v6) --[[ Line: 10 ]]
        -- upvalues: v1 (ref), v2 (ref), v3 (ref), v4 (copy)
        local v7 = v1.useRef(nil);
        local v8 = {};
        local v9 = v2.useAutoFocus(v8, 0.1);
        local v10 = v1.useContext(v3.FocusNavigationContext);
        v1.useEffect(function() --[[ Line: 15 ]]
            -- upvalues: v8 (copy), v7 (copy), v10 (copy), v9 (copy)
            v8[1] = v7.current;
            local v11 = nil;
            if v10 and v10.focusedGuiObject:getValue() ~= nil and v9 then
                v11 = v9();
            end;
            return function() --[[ Line: 21 ]]
                -- upvalues: v11 (ref)
                if v11 then
                    v11.cancel();
                end;
            end;
        end, {
            v9
        });
        return v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Selectable = false, 
            ref = v7
        }, {
            content = v1.createElement(v4, v6)
        });
    end;
end;