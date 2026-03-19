local l_Parent_0 = script:FindFirstAncestor("InputUi").Parent;
local v1 = require(l_Parent_0.React);
local l_Players_0 = game:GetService("Players");
local v3 = nil;
pcall(function() --[[ Line: 6 ]]
    -- upvalues: v3 (ref)
    v3 = game:GetService("ThirdPartyUserService");
end);
local v4 = require(script.Parent.GamepadDisconnectedModalView);
local function _() --[[ Line: 11 ]] --[[ Name: getPlatformOrRobloxUsername ]]
    -- upvalues: v3 (ref), l_Players_0 (copy)
    local v5 = "";
    if v3 then
        v5 = v3:GetUserPlatformName();
    end;
    if v5 == "" or v5 == nil then
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if l_LocalPlayer_0 then
            v5 = l_LocalPlayer_0.DisplayName or l_LocalPlayer_0.Name;
        end;
    end;
    return v5 or "";
end;
return function(_) --[[ Line: 25 ]]
    -- upvalues: v3 (ref), l_Players_0 (copy), v1 (copy), v4 (copy)
    local v9 = "";
    if v3 then
        v9 = v3:GetUserPlatformName();
    end;
    if v9 == "" or v9 == nil then
        local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
        if l_LocalPlayer_1 then
            v9 = l_LocalPlayer_1.DisplayName or l_LocalPlayer_1.Name;
        end;
    end;
    local v11 = v9 or "";
    return v1.createElement(v4, {
        username = v11
    });
end;