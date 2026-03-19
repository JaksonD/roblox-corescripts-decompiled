local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Service.Types);
return function(v4) --[[ Line: 7 ]]
    -- upvalues: v2 (copy)
    if v4 and v4.windowSize then
        local l_windowSize_0 = v4.windowSize;
        local v6, v7 = v2.useState(l_windowSize_0:get());
        v2.useEffect(function() --[[ Line: 13 ]]
            -- upvalues: l_windowSize_0 (copy), v7 (copy), v6 (copy)
            local v8 = l_windowSize_0:connect(function() --[[ Line: 14 ]]
                -- upvalues: v7 (ref), l_windowSize_0 (ref)
                v7(l_windowSize_0:get());
            end);
            if v6 ~= l_windowSize_0:get() then
                v7(l_windowSize_0:get());
            end;
            return function() --[[ Line: 22 ]]
                -- upvalues: v8 (copy)
                v8:disconnect();
            end;
        end, {
            v4.id
        });
        return v6;
    else
        warn("windowSize object not found");
        return UDim2.new();
    end;
end;