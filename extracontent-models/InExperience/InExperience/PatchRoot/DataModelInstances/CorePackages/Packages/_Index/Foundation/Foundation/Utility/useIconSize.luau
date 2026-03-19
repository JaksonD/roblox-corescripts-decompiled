local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v2 = require(l_script_FirstAncestor_0.Enums.IconSize);
local v3 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local function _(v4) --[[ Line: 11 ]] --[[ Name: isNumber ]]
    local v5 = true;
    if typeof(v4) ~= "number" then
        v5 = false;
        if typeof(v4) == "table" then
            v5 = typeof(v4:getValue()) == "number";
        end;
    end;
    return v5;
end;
return function(v7, v8, v9) --[[ Line: 15 ]] --[[ Name: useIconSize ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v10 = v3();
    local v11 = if v8 then {
        [v2.XSmall] = if v9 then v10.Size.Size_400 else v10.Size.Size_300, 
        [v2.Small] = if v9 then v10.Size.Size_500 else v10.Size.Size_400, 
        [v2.Medium] = if v9 then v10.Size.Size_600 else v10.Size.Size_500, 
        [v2.Large] = if v9 then v10.Size.Size_700 else v10.Size.Size_600
    } else {
        [v2.XSmall] = v10.Size.Size_200, 
        [v2.Small] = v10.Size.Size_400, 
        [v2.Medium] = v10.Size.Size_900, 
        [v2.Large] = v10.Size.Size_1200, 
        [v2.XLarge] = v10.Size.Size_2400, 
        [v2.XXLarge] = 24 * v10.Size.Size_200
    };
    local v12 = true;
    if typeof(v7) ~= "number" then
        v12 = false;
        if typeof(v7) == "table" then
            v12 = typeof(v7:getValue()) == "number";
        end;
    end;
    local v13 = if v12 then v7 else v11[v7];
    if not v8 then
        v12 = true;
        if typeof(v7) ~= "number" then
            v12 = false;
            if typeof(v7) == "table" then
                v12 = typeof(v7:getValue()) == "number";
            end;
        end;
        if v12 then
            v13 = nil;
        end;
    end;
    if v13 == nil then
        error("Invalid icon size: " .. tostring(v7));
    end;
    if typeof(v13) == "table" then
        return (v13:map(function(v14) --[[ Line: 49 ]]
            return UDim2.fromOffset(v14, v14);
        end));
    else
        return (UDim2.fromOffset(v13, v13));
    end;
end;