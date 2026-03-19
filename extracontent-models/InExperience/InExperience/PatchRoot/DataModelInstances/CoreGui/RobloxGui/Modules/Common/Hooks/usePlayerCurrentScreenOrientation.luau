local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(script.Parent.usePlayerGui);
return function() --[[ Line: 5 ]] --[[ Name: usePlayerCurrentScreenOrientation ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v3 = v2();
    local v4, v5 = v1.useState(nil);
    v1.useEffect(function() --[[ Line: 9 ]]
        -- upvalues: v3 (copy), v5 (copy)
        local v6 = nil;
        if v3 then
            v5(v3.CurrentScreenOrientation);
            v6 = v3:GetPropertyChangedSignal("CurrentScreenOrientation"):Connect(function() --[[ Line: 15 ]]
                -- upvalues: v5 (ref), v3 (ref)
                v5(v3.CurrentScreenOrientation);
            end);
        end;
        return function() --[[ Line: 20 ]]
            -- upvalues: v6 (ref)
            if v6 then
                v6:Disconnect();
            end;
        end;
    end, {
        v3
    });
    return v4;
end;