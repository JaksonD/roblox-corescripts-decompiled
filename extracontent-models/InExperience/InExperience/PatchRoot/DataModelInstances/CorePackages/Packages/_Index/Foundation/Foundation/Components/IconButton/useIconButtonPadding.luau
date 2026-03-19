local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Enums.IconSize);
local v4 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
return function(v5, v6) --[[ Line: 11 ]] --[[ Name: useIconButtonPadding ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy)
    local v7 = v4();
    local v8 = v2.useMemo(function() --[[ Line: 14 ]]
        -- upvalues: v6 (copy), v3 (ref), v7 (copy)
        if v6 then
            return {
                [v3.XSmall] = v7.Size.Size_150, 
                [v3.Small] = v7.Size.Size_200, 
                [v3.Medium] = v7.Size.Size_250, 
                [v3.Large] = v7.Size.Size_350
            };
        else
            return {
                [v3.XSmall] = v7.Size.Size_50, 
                [v3.Small] = v7.Size.Size_50, 
                [v3.Medium] = v7.Size.Size_100, 
                [v3.Large] = v7.Size.Size_150, 
                [v3.XLarge] = v7.Size.Size_200, 
                [v3.XXLarge] = v7.Size.Size_250
            };
        end;
    end, {
        v7, 
        v6
    })[v5];
    if v8 == nil then
        error("Invalid icon button size: " .. v5);
    end;
    return v8;
end;