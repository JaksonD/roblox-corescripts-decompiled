local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.FocusNavigation);
return function(...) --[[ Line: 5 ]] --[[ Name: composeFocusBehaviors ]]
    local v2 = {
        ...
    };
    return {
        onDescendantFocusChanged = function(v3) --[[ Line: 8 ]] --[[ Name: onDescendantFocusChanged ]]
            -- upvalues: v2 (copy)
            for _, v5 in v2 do
                if v5.onDescendantFocusChanged then
                    v5.onDescendantFocusChanged(v3);
                end;
            end;
        end, 
        getTargets = function() --[[ Line: 15 ]] --[[ Name: getTargets ]]
            -- upvalues: v2 (copy)
            local v6 = {};
            for _, v8 in v2 do
                for _, v10 in (v8.getTargets()) do
                    table.insert(v6, v10);
                end;
            end;
            return v6;
        end
    };
end;