local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v3 = require(l_Parent_1.Dash);
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_0.Flags.FFlagCapturesUpdateUsePlayShutterSoundTesting);
return function() --[[ Line: 17 ]]
    -- upvalues: v5 (copy), v3 (copy), v4 (copy), l_RobloxGui_0 (copy)
    if not v5 and (_G.__TEST_SUITE_PACKAGE__ or _G.__TESTEZ_RUNNING_TEST__) then
        return v3.noop;
    else
        local v6 = v4.useRef(nil);
        v4.useEffect(function() --[[ Line: 27 ]]
            -- upvalues: v5 (ref), l_RobloxGui_0 (ref), v6 (copy)
            local l_Sound_0 = Instance.new("Sound");
            l_Sound_0.Name = v5 and "ShutterSound" or "ShutterSound";
            l_Sound_0.Parent = l_RobloxGui_0;
            l_Sound_0.Volume = v5 and 1 or 1;
            if not v5 then
                l_Sound_0.SoundId = "rbxassetid://10066921516";
            end;
            v6.current = l_Sound_0;
            if v5 and not _G.__TEST_SUITE_PACKAGE__ and not _G.__TESTEZ_RUNNING_TEST__ then
                l_Sound_0.SoundId = "rbxassetid://10066921516";
            end;
            return function() --[[ Line: 44 ]]
                -- upvalues: v6 (ref), l_Sound_0 (copy)
                v6.current = nil;
                l_Sound_0:Destroy();
            end;
        end, {});
        return (v4.useCallback(function() --[[ Line: 50 ]]
            -- upvalues: v6 (copy)
            if v6.current then
                v6.current:Play();
            end;
        end, {}));
    end;
end;