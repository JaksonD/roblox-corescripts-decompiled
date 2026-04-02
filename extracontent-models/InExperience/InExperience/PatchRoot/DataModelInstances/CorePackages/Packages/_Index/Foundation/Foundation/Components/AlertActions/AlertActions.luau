local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Components.Button);
local v5 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v6 = require(l_script_FirstAncestor_0.Utility.Logger);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v8 = require(l_script_FirstAncestor_0.Components.View);
local v9 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v10 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local l_MAX_ACTION_COUNT_0 = require(script.Parent.AlertConstants).MAX_ACTION_COUNT;
local v12 = {
    testId = "--foundation-alert-actions"
};
return v3.memo(function(v13) --[[ Line: 33 ]] --[[ Name: AlertActions ]]
    -- upvalues: v10 (copy), v12 (copy), v3 (copy), l_MAX_ACTION_COUNT_0 (copy), v6 (copy), v2 (copy), v5 (copy), v4 (copy), v8 (copy), v9 (copy)
    local v14 = v10(v13, v12);
    v3.useEffect(function() --[[ Line: 35 ]]
        -- upvalues: v14 (copy), l_MAX_ACTION_COUNT_0 (ref), v6 (ref)
        if v14.actions and #v14.actions > l_MAX_ACTION_COUNT_0 then
            v6:warning((("Alert components only support up to %* actions"):format(l_MAX_ACTION_COUNT_0)));
        end;
    end, {
        v14.actions
    });
    local v19 = v3.useMemo(function() --[[ Line: 41 ]]
        -- upvalues: v14 (copy), l_MAX_ACTION_COUNT_0 (ref), v2 (ref), v5 (ref), v3 (ref), v4 (ref)
        if v14.actions and #v14.actions > 0 then
            local v15 = {};
            for v16, v17 in v14.actions do
                if l_MAX_ACTION_COUNT_0 >= v16 then
                    local v18 = v2.join(v17, {
                        LayoutOrder = v16, 
                        size = v5.Small, 
                        testId = ("%*--action-%*"):format(v14.testId, v16)
                    });
                    v15["ActionButton" .. v16] = v3.createElement(v4, v18);
                else
                    break;
                end;
            end;
            return v15;
        else
            return nil;
        end;
    end, {
        v14.actions, 
        v14.testId
    });
    if not v19 then
        return nil;
    else
        return v3.createElement(v8, v9(v14, {
            tag = v14.tag or "auto-xy row gap-small", 
            padding = v14.padding
        }), v19);
    end;
end);