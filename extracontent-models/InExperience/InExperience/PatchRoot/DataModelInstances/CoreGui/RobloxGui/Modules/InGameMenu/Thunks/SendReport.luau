local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Actions.OpenReportSentDialog);
return function(v4, v5, v6) --[[ Line: 7 ]]
    -- upvalues: l_Players_0 (copy), v3 (copy), l_RunService_0 (copy)
    return function(v7) --[[ Line: 8 ]]
        -- upvalues: v6 (copy), l_Players_0 (ref), v4 (copy), v5 (copy), v3 (ref), l_RunService_0 (ref)
        if v6 ~= nil then
            local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v6);
            if l_l_Players_0_PlayerByUserId_0 then
                coroutine.wrap(function() --[[ Line: 12 ]]
                    -- upvalues: l_Players_0 (ref), l_l_Players_0_PlayerByUserId_0 (copy), v4 (ref), v5 (ref), v7 (copy), v3 (ref)
                    l_Players_0:ReportAbuse(l_l_Players_0_PlayerByUserId_0, v4, v5);
                    v7:dispatch(v3());
                end)();
                return;
            end;
        else
            local v9 = v7:getState();
            local l_name_0 = v9.gameInfo.name;
            local l_description_0 = v9.gameInfo.description;
            if l_name_0 ~= "" then
                local v12 = string.format("User Report: \n    %s \nPlace Title: \n    %s \nPlaceId: \n    %s \nPlace Description: \n    %s \n", v5, l_name_0, tostring(game.PlaceId), l_description_0);
                coroutine.wrap(function() --[[ Line: 31 ]]
                    -- upvalues: l_RunService_0 (ref), l_Players_0 (ref), v4 (ref), v12 (copy), v7 (copy), v3 (ref)
                    if not l_RunService_0:IsStudio() then
                        l_Players_0:ReportAbuse(nil, v4, v12);
                    end;
                    v7:dispatch(v3());
                end)();
            end;
        end;
    end;
end;