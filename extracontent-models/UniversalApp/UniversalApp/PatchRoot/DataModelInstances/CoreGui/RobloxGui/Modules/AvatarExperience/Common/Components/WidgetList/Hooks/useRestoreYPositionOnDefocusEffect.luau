local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
return function(v2, v3, v4, v5) --[[ Line: 10 ]] --[[ Name: useRestoreYPositionOnDefocusEffect ]]
    -- upvalues: v1 (copy)
    local v6 = v1.useRef(v2);
    v1.useEffect(function() --[[ Line: 17 ]]
        -- upvalues: v4 (copy), v2 (copy), v6 (copy), v3 (copy), v5 (copy)
        local v7 = v4();
        if not v7 then
            return;
        else
            assert(v7, "");
            local l_current_0 = v7.current;
            if not l_current_0 then
                return;
            elseif v2 ~= v6.current then
                v6.current = v2;
                l_current_0.CanvasPosition = Vector2.new(0, 0);
                return;
            elseif v3 and l_current_0 then
                l_current_0.CanvasPosition = Vector2.new(0, 0);
                return;
            else
                if not v3 then
                    l_current_0.CanvasPosition = Vector2.new(0, v5.current or 0);
                end;
                return;
            end;
        end;
    end, {
        v2, 
        v3, 
        v4, 
        v5
    });
end;