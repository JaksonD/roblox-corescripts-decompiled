local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Players_0 = game:GetService("Players");
local v2 = game:DefineFastFlag("EnableGenericIllegalContentReporting3", false);
local v3 = game:DefineFastString("CountriesWithGenericIllegalContentReporting2", "AT,BE,BG,CY,CZ,DE,DK,EE,ES,FI,FR,GR,HR,HU,IE,IT,LT,LU,LV,MT,NL,PL,PT,RO,SE,SI,SK,GB,AU");
local v4 = false;
if v2 then
    task.spawn(function() --[[ Line: 18 ]]
        -- upvalues: l_Players_0 (copy), l_LocalizationService_0 (copy), v3 (copy), v4 (ref)
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        while not l_LocalPlayer_0 do
            l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
            l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        end;
        local l_status_0, l_result_0 = pcall(l_LocalizationService_0.GetCountryRegionForPlayerAsync, l_LocalizationService_0, l_LocalPlayer_0);
        if not l_status_0 then
            return;
        else
            local v8 = v3:split(",");
            for _, v10 in ipairs(v8) do
                if l_result_0 == v10 then
                    v4 = true;
                    return;
                end;
            end;
            return;
        end;
    end);
end;
return function() --[[ Line: 42 ]] --[[ Name: isShowGenericIllegalContentReportingLink ]]
    -- upvalues: v2 (copy), v4 (ref)
    return v2 and v4;
end;