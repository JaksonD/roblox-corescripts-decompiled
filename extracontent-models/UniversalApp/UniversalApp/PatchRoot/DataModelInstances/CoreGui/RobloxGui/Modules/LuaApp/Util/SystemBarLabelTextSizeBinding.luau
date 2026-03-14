local l_TextService_0 = game:GetService("TextService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_FFlagAppNavLabelScaling_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAppNavLabelScaling;
local v4 = game:DefineFastFlag("BuilderSansNavbarFlagSize", false);
local v5 = game:DefineFastInt("BuilderSansNavBarMinSize", 10.08);
local v6 = game:DefineFastInt("BuilderSansNavBarMaxSize", 13.86);
local v7 = if v4 then v5 else 10.08;
local v8 = if v4 then v6 else 12.6;
local v9 = {};
v9.__index = v9;
v9.new = function() --[[ Line: 45 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v8 (copy), v9 (copy)
    local v10, v11 = v2.createBinding(v8);
    return (setmetatable({
        _textSize = v10, 
        _setTextSize = v11
    }, v9));
end;
v9.getBinding = function(v12) --[[ Line: 57 ]] --[[ Name: getBinding ]]
    return v12._textSize;
end;
v9.getMinTextSize = function(v13, v14, v15, v16) --[[ Line: 61 ]] --[[ Name: getMinTextSize ]]
    -- upvalues: v7 (copy), l_TextService_0 (copy)
    local v17 = v13._textSize:getValue();
    local v18 = Vector2.new(2147483647, v16.Y);
    local v19 = Vector2.new(2147483647, v16.Y);
    while v7 < v17 and v19.X > v16.X do
        v19 = l_TextService_0:GetTextSize(v14, v17, v15, v18);
        if v19.X > v16.X then
            v17 = v17 - 1;
        end;
    end;
    if v17 < v13._textSize:getValue() then
        v13._setTextSize(v17);
    end;
    return v17;
end;
if l_FFlagAppNavLabelScaling_0 then
    v9.setTextToMaxSize = function(v20, v21, v22, v23, v24) --[[ Line: 82 ]] --[[ Name: setTextToMaxSize ]]
        -- upvalues: v7 (copy), l_TextService_0 (copy)
        local l_v24_0 = v24;
        local v26 = Vector2.new(2147483647, v23.Y);
        local v27 = Vector2.new(2147483647, v23.Y);
        while v7 < l_v24_0 and v27.X > v23.X do
            v27 = l_TextService_0:GetTextSize(v21, l_v24_0, v22, v26);
            if v27.X > v23.X then
                l_v24_0 = l_v24_0 - 1;
            end;
        end;
        v20._setTextSize(l_v24_0);
    end;
end;
v9.default = v9.new();
return v9;