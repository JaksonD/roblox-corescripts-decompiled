local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppStartup");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.AppStartupSequence);
local _ = require(l_Parent_0.AppCommonLib);
local v4 = require(l_Parent_0.React);
return function(v5) --[[ Line: 14 ]]
    -- upvalues: v4 (copy)
    local v6, v7 = v4.useState(v5.appStartupSequence.isInteractive);
    v4.useEffect(function() --[[ Line: 17 ]]
        -- upvalues: v5 (copy), v7 (copy)
        local v8 = nil;
        if v5.appStartupSequence.isInteractive then
            v7(true);
        else
            v8 = v5.appStartupSequence.changed:connect(function() --[[ Line: 23 ]]
                -- upvalues: v7 (ref), v5 (ref), v8 (ref)
                v7(v5.appStartupSequence.isInteractive);
                if v8 ~= nil and v5.appStartupSequence.isInteractive then
                    v8:disconnect();
                    v8 = nil;
                end;
            end);
        end;
        return if v8 then v8.disconnect else nil;
    end, {
        v5.appStartupSequence
    });
    return v4.createElement(v4.Fragment, nil, if v6 then v5.children else {});
end;