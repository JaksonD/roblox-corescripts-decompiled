local l_Chat_0 = game:GetService("Chat");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.Actions.SetCanChat);
if require(l_Parent_0.Flags.FFlagTopBarDeprecateChatRodux) then
    return nil;
else
    local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
    local v7 = require(l_RobloxGui_0.Modules.ChatSelector);
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    while not l_LocalPlayer_0 do
        l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    end;
    return function(v9) --[[ Line: 26 ]]
        -- upvalues: l_RunService_0 (copy), l_Chat_0 (copy), l_LocalPlayer_0 (ref), v5 (copy), v7 (copy)
        coroutine.wrap(function() --[[ Line: 27 ]]
            -- upvalues: l_RunService_0 (ref), l_Chat_0 (ref), l_LocalPlayer_0 (ref), v9 (copy), v5 (ref), v7 (ref)
            local v10 = true;
            if not l_RunService_0:IsStudio() then
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 30 ]]
                    -- upvalues: l_Chat_0 (ref), l_LocalPlayer_0 (ref)
                    return l_Chat_0:CanUserChatAsync(l_LocalPlayer_0.UserId);
                end);
                v10 = l_status_0 and l_result_0;
            end;
            v9:dispatch(v5(v10));
            if not v10 then
                v7:SetVisible(false);
            end;
        end)();
    end;
end;