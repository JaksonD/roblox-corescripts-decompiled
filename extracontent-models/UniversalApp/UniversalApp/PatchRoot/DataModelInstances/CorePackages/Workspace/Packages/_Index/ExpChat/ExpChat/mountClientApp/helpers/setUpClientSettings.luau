local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_Actions_0 = script:FindFirstAncestor("ExpChat").Actions;
local v2 = require(l_Actions_0.ClientSettingsLoaded);
local v3 = require(l_Actions_0.ClientSettingsChanged);
return function(v4) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), l_UserGameSettings_0 (copy), v3 (copy)
    v4:dispatch(v2({
        preferredTransparency = l_UserGameSettings_0.PreferredTransparency
    }));
    l_UserGameSettings_0:GetPropertyChangedSignal("PreferredTransparency"):Connect(function() --[[ Line: 14 ]]
        -- upvalues: v4 (copy), v3 (ref), l_UserGameSettings_0 (ref)
        v4:dispatch(v3("preferredTransparency", l_UserGameSettings_0.PreferredTransparency));
    end);
end;