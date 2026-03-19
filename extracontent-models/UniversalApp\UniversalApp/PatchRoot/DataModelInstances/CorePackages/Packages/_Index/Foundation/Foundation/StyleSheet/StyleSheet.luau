local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_1 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_1.React);
local _ = require(l_Parent_0.Rules.Types);
local v5 = require(l_Parent_0.createStyleSheetRules);
local v6 = require(l_script_FirstAncestor_0.Utility.useGeneratedRules);
local _ = require(l_script_FirstAncestor_0.Enums.Device);
local _ = require(l_script_FirstAncestor_0.Enums.Theme);
return v3.memo(function(v9) --[[ Line: 27 ]] --[[ Name: StyleSheet ]]
    -- upvalues: v3 (copy), v6 (copy), v5 (copy)
    local v10, v11 = v3.useState(nil);
    local v12 = v3.useRef({});
    v3.useLayoutEffect(function() --[[ Line: 31 ]]
        -- upvalues: v9 (copy), v10 (copy)
        if v9.setStyleSheetRef and v9.setStyleSheetRef.current then
            v9.setStyleSheetRef.current(v10);
        end;
    end, {
        v10
    });
    local v13 = v6(v9.theme, v9.device);
    v3.useLayoutEffect(function() --[[ Line: 41 ]]
        -- upvalues: v10 (copy), v9 (copy)
        if v10 then
            v10:SetDerives(v9.derives or {});
        end;
    end, {
        v10, 
        v9.derives
    });
    local v14 = v3.useMemo(function() --[[ Line: 48 ]]
        -- upvalues: v10 (copy), v5 (ref), v13 (copy), v9 (copy), v12 (copy)
        if v10 then
            return v5(v13, v9.tags, v10, v12.current, v9.scale);
        else
            return nil;
        end;
    end, {
        v10, 
        v13, 
        v9.tags, 
        v9.scale
    });
    return v3.createElement(v3.Fragment, nil, {
        FoundationStyleSheet = v3.createElement("StyleSheet", {
            ref = v11
        }, v14), 
        FoundationStyleLink = v3.createElement("StyleLink", {
            StyleSheet = v10
        })
    });
end);