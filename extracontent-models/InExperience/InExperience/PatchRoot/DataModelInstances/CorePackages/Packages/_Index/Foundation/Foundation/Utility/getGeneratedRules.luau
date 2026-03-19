local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.Device);
local v2 = require(l_script_FirstAncestor_0.Enums.StyleTagFormat);
local v3 = require(l_script_FirstAncestor_0.Enums.Theme);
local v4 = {
    [v2.Static] = {
        Common = function() --[[ Line: 13 ]] --[[ Name: Common ]]
            -- upvalues: l_script_FirstAncestor_0 (copy)
            return require(l_script_FirstAncestor_0.Generated.StyleRules.CommonStatic);
        end, 
        Dark = function() --[[ Line: 16 ]] --[[ Name: Dark ]]
            -- upvalues: l_script_FirstAncestor_0 (copy)
            return require(l_script_FirstAncestor_0.Generated.StyleRules.DarkStatic);
        end, 
        Light = function() --[[ Line: 19 ]] --[[ Name: Light ]]
            -- upvalues: l_script_FirstAncestor_0 (copy)
            return require(l_script_FirstAncestor_0.Generated.StyleRules.LightStatic);
        end, 
        Console = function() --[[ Line: 22 ]] --[[ Name: Console ]]
            -- upvalues: l_script_FirstAncestor_0 (copy)
            return require(l_script_FirstAncestor_0.Generated.StyleRules.ConsoleStatic);
        end, 
        Desktop = function() --[[ Line: 25 ]] --[[ Name: Desktop ]]
            -- upvalues: l_script_FirstAncestor_0 (copy)
            return require(l_script_FirstAncestor_0.Generated.StyleRules.DesktopStatic);
        end
    }, 
    [v2.Attribute] = {
        Console = function() --[[ Line: 30 ]] --[[ Name: Console ]]
            -- upvalues: l_script_FirstAncestor_0 (copy)
            return require(l_script_FirstAncestor_0.Generated.StyleRules.ConsoleAttribute);
        end, 
        Desktop = function() --[[ Line: 33 ]] --[[ Name: Desktop ]]
            -- upvalues: l_script_FirstAncestor_0 (copy)
            return require(l_script_FirstAncestor_0.Generated.StyleRules.DesktopAttribute);
        end
    }
};
return function(v5, v6) --[[ Line: 39 ]] --[[ Name: getGeneratedRules ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy), v1 (copy)
    local l_Attribute_0 = v2.Attribute;
    local v8 = nil;
    local v9 = nil;
    local v10 = v4[v2.Static].Common();
    if v5 == v3.Dark then
        v8 = v4[v2.Static].Dark();
    elseif v5 == v3.Light then
        v8 = v4[v2.Static].Light();
    end;
    v9 = if v6 == v1.Console then v4[l_Attribute_0].Console() else v4[l_Attribute_0].Desktop();
    if not v8 or not v9 or not v10 then
        return {};
    else
        local v11 = table.clone(v9);
        for v12, v13 in v10 do
            v11[v12] = v13;
        end;
        for v14, v15 in v8 do
            v11[v14] = v15;
        end;
        return v11;
    end;
end;