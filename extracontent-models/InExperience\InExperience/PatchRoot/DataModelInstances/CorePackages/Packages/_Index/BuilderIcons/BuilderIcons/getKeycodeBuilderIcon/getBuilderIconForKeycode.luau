local l_UserInputService_0 = require(script.Parent.Parent.Services).UserInputService;
local v1 = require(script.Parent.KeycodeMappings);
local v2 = require(script.Parent.Platform);
local v3 = {
    ps4 = v2.PS4, 
    ps5 = v2.PS5, 
    xbox = v2.Xbox
};
local function v7() --[[ Line: 11 ]] --[[ Name: getPlatform ]]
    -- upvalues: l_UserInputService_0 (copy), v3 (copy), v2 (copy)
    local l_l_UserInputService_0_ImageForKeyCode_0 = l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonStart);
    for v5, v6 in v3 do
        if l_l_UserInputService_0_ImageForKeyCode_0:find(v5) then
            return v6;
        end;
    end;
    if l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.ButtonA) == "ButtonCross" then
        return v2.PS5;
    else
        return v2.Xbox;
    end;
end;
return function(v8) --[[ Line: 24 ]] --[[ Name: getBuilderIconForKeycode ]]
    -- upvalues: v7 (copy), v1 (copy), v2 (copy)
    local v9 = v7();
    local l_Name_0 = v8.Name;
    local v11 = v1[v9][l_Name_0];
    if v11 then
        return v11;
    else
        assert(v1[v2.Default][l_Name_0], (("%* has no associated BuilderIcon"):format(l_Name_0)));
        return v1[v2.Default][l_Name_0];
    end;
end;