local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.React);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Players_0 = game:GetService("Players");
local l_ChromeShared_0 = script.Parent.Parent.ChromeShared;
local v6 = require(l_ChromeShared_0.Utility.GetStyleTokens);
local v7 = require(l_RobloxGui_0.Modules.VoiceChat.Hooks.useVoiceState);
local v8 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v9 = v6();
local v10 = Color3.new(0.918, 0.2, 0.137);
local v11 = UDim2.new(0, v9.Size.Size_100, 0, v9.Size.Size_100);
return function(v12) --[[ Line: 17 ]]
    -- upvalues: v7 (copy), l_Players_0 (copy), v8 (copy), v2 (copy), v11 (copy), v10 (copy)
    local v13 = v7(l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0);
    local v14 = true;
    if v13 ~= v8.VOICE_STATE.INACTIVE then
        v14 = v13 == v8.VOICE_STATE.TALKING;
    end;
    return v2.createElement("Frame", {
        Name = "RedVoiceDot", 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = v12.position, 
        Size = v11, 
        BackgroundColor3 = v10, 
        Visible = v14
    }, {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        })
    });
end;