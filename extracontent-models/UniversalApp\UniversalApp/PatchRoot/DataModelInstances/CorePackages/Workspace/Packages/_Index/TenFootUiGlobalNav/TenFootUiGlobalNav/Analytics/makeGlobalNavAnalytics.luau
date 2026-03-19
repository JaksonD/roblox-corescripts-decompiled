return function(v0, v1) --[[ Line: 1 ]] --[[ Name: makeGlobalNavAnalytics ]]
    local l_EventStream_0 = v0.EventStream;
    return {
        ButtonActivated = function(v3, v4) --[[ Line: 6 ]] --[[ Name: ButtonActivated ]]
            -- upvalues: v1 (copy), l_EventStream_0 (copy)
            v1(l_EventStream_0, "TenFootUiGlobalNav", v3, v4);
        end
    };
end;