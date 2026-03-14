local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Players_0 = game:GetService("Players");
local v2 = game:DefineFastFlag("EnableOSAIllegalContentReporting", false);
local v3 = false;
if v2 then
    task.spawn(function() --[[ Line: 16 ]]
        -- upvalues: l_Players_0 (copy), l_LocalizationService_0 (copy), v3 (ref)
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        while not l_LocalPlayer_0 do
            l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
            l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        end;
        local l_status_0, l_result_0 = pcall(l_LocalizationService_0.GetCountryRegionForPlayerAsync, l_LocalizationService_0, l_LocalPlayer_0);
        if not l_status_0 then
            return;
        else
            if l_result_0 == "GB" then
                v3 = true;
            end;
            return;
        end;
    end);
end;
return function() --[[ Line: 36 ]] --[[ Name: isShowUKOSAIllegalContentReportingLink ]]
    -- upvalues: v2 (copy), v3 (ref)
    return v2 and v3;
end;