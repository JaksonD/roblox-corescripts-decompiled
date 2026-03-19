local l_Parent_0 = script:FindFirstAncestor("Groups").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_TextInput_0 = v2.TextInput;
local l_IconName_0 = v2.Enums.IconName;
return function(v5) --[[ Line: 24 ]] --[[ Name: SearchBar ]]
    -- upvalues: v1 (copy), l_TextInput_0 (copy), l_IconName_0 (copy)
    local v6, v7 = v1.useState("");
    local v8 = v1.useRef(nil);
    local v9 = v1.useCallback(function() --[[ Line: 28 ]]
        -- upvalues: v8 (copy)
        if v8.current then
            task.cancel(v8.current);
            v8.current = nil;
        end;
    end, {});
    local v11 = v1.useCallback(function(v10) --[[ Line: 35 ]]
        -- upvalues: v7 (copy), v9 (copy), v8 (copy), v5 (copy)
        v7(v10);
        v9();
        v8.current = task.delay(0.4, function() --[[ Line: 39 ]]
            -- upvalues: v5 (ref), v10 (copy)
            if v5.onTextChanged then
                v5.onTextChanged(v10);
            end;
        end);
    end, {
        v5.onTextChanged, 
        v9
    });
    v1.useEffect(function() --[[ Line: 46 ]]
        -- upvalues: v9 (copy)
        return v9;
    end, {});
    local v12 = v1.useCallback(function() --[[ Line: 50 ]]
        -- upvalues: v9 (copy), v7 (copy), v5 (copy)
        v9();
        v7("");
        if v5.onTextChanged then
            v5.onTextChanged("");
        end;
    end, {
        v5.onTextChanged, 
        v9
    });
    return v1.createElement(l_TextInput_0, {
        label = "", 
        text = v6, 
        width = UDim.new(1, 0), 
        placeholder = v5.placeholderText or "", 
        leadingIcon = "icons/common/search", 
        onChanged = v11, 
        iconTrailing = if v6 ~= "" then {
            name = l_IconName_0.CircleX, 
            onActivated = v12
        } else nil
    });
end;