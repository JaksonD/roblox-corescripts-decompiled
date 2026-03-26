local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_dependencyArray_0 = v2.Hooks.dependencyArray;
local l_memo_0 = v1.memo;
local l_useEffect_0 = v1.useEffect;
local l_useRef_0 = v1.useRef;
local l_usePrevious_0 = v2.Hooks.usePrevious;
ExternalNavigationHandler = function(v9) --[[ Line: 26 ]] --[[ Name: ExternalNavigationHandler ]]
    -- upvalues: l_useRef_0 (copy), l_useEffect_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_usePrevious_0 (copy)
    local function _() --[[ Line: 27 ]]
        -- upvalues: v9 (copy)
        local v10 = false;
        if v9.requestId ~= v9.completedRequestId then
            v10 = v9.screen;
        end;
        return v10;
    end;
    local v12 = l_useRef_0({});
    local function v16() --[[ Line: 33 ]]
        -- upvalues: v9 (copy), v12 (copy)
        local l_screen_0 = v9.screen;
        local v14 = v9.navigationByScreen[l_screen_0];
        if v14 then
            v14(v9.params);
        else
            assert(v12.current, "Queue for ExternalNavigationHandler can't be nil");
            local v15 = v12.current[l_screen_0] or {};
            table.insert(v15, v9.params);
            v12.current[l_screen_0] = v15;
        end;
        v9.completeExternalNavigation(v9.requestId);
    end;
    l_useEffect_0(function() --[[ Line: 51 ]]
        -- upvalues: v9 (copy), v16 (copy)
        local v17 = false;
        if v9.requestId ~= v9.completedRequestId then
            v17 = v9.screen;
        end;
        if v17 then
            v16();
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v9.requestId, 
        v9.completedRequestId, 
        v9.screen
    } else l_dependencyArray_0(v9.requestId, v9.completedRequestId, v9.screen));
    local v18 = l_usePrevious_0(v9.navigationByScreen);
    l_useEffect_0(function() --[[ Line: 59 ]]
        -- upvalues: v12 (copy), v18 (copy), v9 (copy)
        assert(v12.current, "Queue for ExternalNavigationHandler can't be nil");
        if v18 == nil then
            return;
        else
            for v19, v20 in pairs(v12.current) do
                assert(v18, "");
                local v21 = v18[v19];
                local v22 = v9.navigationByScreen[v19];
                if v21 ~= v22 and v22 then
                    for _, v24 in ipairs(v20) do
                        v22(v24);
                    end;
                    v12.current[v19] = nil;
                end;
            end;
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v9.navigationByScreen
    } else l_dependencyArray_0(v9.navigationByScreen));
    return nil;
end;
return l_memo_0(ExternalNavigationHandler);