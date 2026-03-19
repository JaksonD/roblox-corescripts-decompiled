local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.FocusNavigationUtils);
local v3 = require(l_Parent_0.InputHandlers);
local l_useFocusRoot_0 = v2.useFocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v2.FocusNavigableSurfaceIdentifierEnum;
local l_FocusNavigationEventNameEnum_0 = v2.FocusNavigationEventNameEnum;
local l_useDefaultFocusBehavior_0 = require(l_Parent_0.ReactFocusNavigation).useDefaultFocusBehavior;
local function _(v8, v9) --[[ Line: 13 ]] --[[ Name: mergeRefs ]]
    return function(v10) --[[ Line: 14 ]]
        -- upvalues: v8 (copy), v9 (copy)
        if type(v8) == "function" then
            v8(v10);
        elseif v8 ~= nil then
            v8.current = v10;
        end;
        if type(v9) == "function" then
            v9(v10);
            return;
        else
            if v9 ~= nil then
                v9.current = v10;
            end;
            return;
        end;
    end;
end;
return function(v12, v13) --[[ Line: 31 ]] --[[ Name: useFocusNavigationRefs ]]
    -- upvalues: l_useDefaultFocusBehavior_0 (copy), l_useFocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v3 (copy), v1 (copy)
    local v14, v15 = l_useDefaultFocusBehavior_0();
    local v16 = l_useFocusRoot_0({
        surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, 
        customEventHandlers = {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v3.onRelease(v12)
            }
        }, 
        isAutoFocusRoot = true
    });
    local v20 = v1.useMemo(function() --[[ Line: 44 ]]
        -- upvalues: v16 (copy), v15 (copy)
        local l_v16_0 = v16;
        local l_v15_0 = v15;
        return function(v19) --[[ Line: 14 ]]
            -- upvalues: l_v16_0 (copy), l_v15_0 (copy)
            if type(l_v16_0) == "function" then
                l_v16_0(v19);
            elseif l_v16_0 ~= nil then
                l_v16_0.current = v19;
            end;
            if type(l_v15_0) == "function" then
                l_v15_0(v19);
                return;
            else
                if l_v15_0 ~= nil then
                    l_v15_0.current = v19;
                end;
                return;
            end;
        end;
    end, {
        v16, 
        v15
    });
    local v21 = v1.useRef(nil);
    local v25 = v1.useMemo(function() --[[ Line: 50 ]]
        -- upvalues: v21 (copy), v14 (copy)
        local l_v21_0 = v21;
        local l_v14_0 = v14;
        return function(v24) --[[ Line: 14 ]]
            -- upvalues: l_v21_0 (copy), l_v14_0 (copy)
            if type(l_v21_0) == "function" then
                l_v21_0(v24);
            elseif l_v21_0 ~= nil then
                l_v21_0.current = v24;
            end;
            if type(l_v14_0) == "function" then
                l_v14_0(v24);
                return;
            else
                if l_v14_0 ~= nil then
                    l_v14_0.current = v24;
                end;
                return;
            end;
        end;
    end, {
        v14
    });
    local v26 = v1.useRef(false);
    v1.useEffect(function() --[[ Line: 56 ]]
        -- upvalues: v21 (copy), v26 (copy), v13 (copy)
        local l_current_0 = v21.current;
        if l_current_0 and not v26.current then
            v26.current = true;
            if v13 then
                v13(l_current_0);
            end;
        end;
    end, {
        v21.current, 
        v13
    });
    return v20, v25;
end;