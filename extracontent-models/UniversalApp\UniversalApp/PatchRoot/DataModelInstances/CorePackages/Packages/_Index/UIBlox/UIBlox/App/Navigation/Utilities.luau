local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.Enums.InputType);
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.Cryo);
local _ = require(l_Parent_0.ShortcutBar.Types);
local v6 = {};
local _ = function(v7) --[[ Line: 10 ]]
    -- upvalues: v2 (copy), v4 (copy)
    return function(v8, _) --[[ Line: 11 ]]
        -- upvalues: v7 (copy), v2 (ref), v4 (ref)
        local l_icon_0 = v8.icon;
        if typeof(l_icon_0) == "string" or typeof(l_icon_0) == "table" and l_icon_0.Image then
            return;
        elseif typeof(l_icon_0) == "EnumItem" or #l_icon_0 > 0 and typeof(l_icon_0[1]) == "EnumItem" and v7 == v2.MouseAndKeyboard then
            return v8;
        elseif l_icon_0[v7] then
            return v4.Dictionary.join(v8, {
                icon = l_icon_0[v7]
            });
        else
            return;
        end;
    end;
end;
v6.filterItems = function(v12, v13) --[[ Line: 35 ]]
    -- upvalues: v4 (copy), v2 (copy)
    local v18 = v4.List.filter(v12, function(v14, _) --[[ Line: 37 ]]
        local l_icon_1 = v14.icon;
        local v17 = true;
        if typeof(l_icon_1) ~= "string" then
            v17 = false;
            if typeof(l_icon_1) == "table" then
                v17 = l_icon_1.Image;
            end;
        end;
        return v17;
    end);
    if not v13 then
        return v18;
    else
        assert(v13, "Assert inputType not nil at this point to silence type checker");
        return (v4.List.join(v18, v4.List.filterMap(v12, function(v19, _) --[[ Line: 11 ]]
            -- upvalues: v13 (copy), v2 (ref), v4 (ref)
            local l_icon_2 = v19.icon;
            if typeof(l_icon_2) == "string" or typeof(l_icon_2) == "table" and l_icon_2.Image then
                return;
            elseif typeof(l_icon_2) == "EnumItem" or #l_icon_2 > 0 and typeof(l_icon_2[1]) == "EnumItem" and v13 == v2.MouseAndKeyboard then
                return v19;
            elseif l_icon_2[v13] then
                return v4.Dictionary.join(v19, {
                    icon = l_icon_2[v13]
                });
            else
                return;
            end;
        end)));
    end;
end;
return v6;