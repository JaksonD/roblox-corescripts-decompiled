local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.FocusNavigationUtils);
local v2 = require(l_Parent_0.InputHandlers);
local v3 = require(l_Parent_0.React);
local l_FocusNavigationEventNameEnum_0 = v1.FocusNavigationEventNameEnum;
local l_useDefaultFocusBehavior_0 = require(l_Parent_0.ReactFocusNavigation).useDefaultFocusBehavior;
local l_useAppFocusRoot_0 = v1.useAppFocusRoot;
local function _(v7, v8) --[[ Line: 17 ]] --[[ Name: mergeRefs ]]
    return function(v9) --[[ Line: 18 ]]
        -- upvalues: v7 (copy), v8 (copy)
        if type(v7) == "function" then
            v7(v9);
        elseif v7 ~= nil then
            v7.current = v9;
        end;
        if type(v8) == "function" then
            v8(v9);
            return;
        else
            if v8 ~= nil then
                v8.current = v9;
            end;
            return;
        end;
    end;
end;
return function(v11, v12) --[[ Line: 44 ]] --[[ Name: useFocusNavigationRefs ]]
    -- upvalues: l_useDefaultFocusBehavior_0 (copy), l_useAppFocusRoot_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v2 (copy), v3 (copy)
    local v13 = l_useDefaultFocusBehavior_0();
    local v14 = l_useAppFocusRoot_0({
        surfaceIdentifier = v11, 
        customEventHandlers = {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v2.onRelease(v12)
            }
        }, 
        isAutoFocusRoot = true
    });
    return (v3.useMemo(function() --[[ Line: 57 ]]
        -- upvalues: v14 (copy), v13 (copy)
        local l_v14_0 = v14;
        local l_v13_0 = v13;
        return function(v17) --[[ Line: 18 ]]
            -- upvalues: l_v14_0 (copy), l_v13_0 (copy)
            if type(l_v14_0) == "function" then
                l_v14_0(v17);
            elseif l_v14_0 ~= nil then
                l_v14_0.current = v17;
            end;
            if type(l_v13_0) == "function" then
                l_v13_0(v17);
                return;
            else
                if l_v13_0 ~= nil then
                    l_v13_0.current = v17;
                end;
                return;
            end;
        end;
    end, {
        v14, 
        v13
    }));
end;