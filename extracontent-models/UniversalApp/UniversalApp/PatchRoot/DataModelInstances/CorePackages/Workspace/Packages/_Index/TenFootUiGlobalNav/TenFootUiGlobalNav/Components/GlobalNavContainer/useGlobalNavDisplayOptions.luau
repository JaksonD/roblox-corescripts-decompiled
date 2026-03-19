local l_Parent_0 = script:FindFirstAncestor("TenFootUiGlobalNav").Parent;
local v1 = require(l_Parent_0.React);
local l_GlobalNavDisplayOption_0 = require(l_Parent_0.TenFootUiCommon).TenFootUiRNTypes.GlobalNavDisplayOption;
return function(v3, v4) --[[ Line: 9 ]] --[[ Name: useGlobalNavDisplayOptions ]]
    -- upvalues: v1 (copy), l_GlobalNavDisplayOption_0 (copy)
    local v5, v6 = v1.useState(l_GlobalNavDisplayOption_0.ShowAll);
    v1.useEffect(function() --[[ Line: 13 ]]
        -- upvalues: v4 (copy), v3 (copy), v6 (copy), l_GlobalNavDisplayOption_0 (ref)
        local v7 = v4(v3);
        if v7 and v7.globalNavDisplayOption then
            v6(v7.globalNavDisplayOption);
            return;
        else
            v6(l_GlobalNavDisplayOption_0.ShowAll);
            return;
        end;
    end, {
        v3, 
        v4
    });
    return v5;
end;