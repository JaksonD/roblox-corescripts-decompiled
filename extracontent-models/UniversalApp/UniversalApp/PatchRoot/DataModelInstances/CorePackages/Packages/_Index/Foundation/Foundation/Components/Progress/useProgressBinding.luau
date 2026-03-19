local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactIs);
local v4 = require(l_script_FirstAncestor_0.Utility.Flags);
local _ = require(l_script_FirstAncestor_0.Components.Types);
return function(v6) --[[ Line: 12 ]] --[[ Name: useProgressBinding ]]
    -- upvalues: v4 (copy), v3 (copy), v2 (copy)
    if v4.FoundationProgressBindableValue then
        if v3.isBinding(v6) then
            return v6:map(function(v7) --[[ Line: 18 ]]
                return (math.clamp(v7 / 100, 0, 1));
            end), v6 == nil;
        else
            return if v6 ~= nil then math.clamp(v6 / 100, 0, 1) else nil, v6 == nil;
        end;
    else
        local v8 = nil;
        if v6 ~= nil then
            v8 = math.clamp(v6 / 100, 0, 1);
        end;
        local v9, v10 = v2.useBinding(v8);
        v2.useEffect(function() --[[ Line: 35 ]]
            -- upvalues: v8 (ref), v10 (copy)
            if v8 ~= nil then
                v10(v8);
            end;
        end, {
            v8
        });
        return v9, v6 == nil;
    end;
end;