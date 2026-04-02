local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local l_Players_0 = game:GetService("Players");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v3 = require(l_Parent_0.Promise);
return function() --[[ Line: 12 ]] --[[ Name: getUsers ]]
    -- upvalues: v3 (copy), l_Players_0 (copy), l_LocalPlayer_0 (copy)
    return v3.new(function(v4, v5) --[[ Line: 13 ]]
        -- upvalues: l_Players_0 (ref), l_LocalPlayer_0 (ref)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 14 ]]
            -- upvalues: l_Players_0 (ref), l_LocalPlayer_0 (ref)
            local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
            table.sort(l_l_Players_0_Players_0, function(v7, v8) --[[ Line: 16 ]]
                return v7.Name:lower() < v8.Name:lower();
            end);
            local v9 = {};
            for _, v11 in ipairs(l_l_Players_0_Players_0) do
                if not l_LocalPlayer_0 or v11.UserId ~= l_LocalPlayer_0.UserId then
                    table.insert(v9, {
                        id = tostring(v11.UserId), 
                        label = v11.DisplayName, 
                        description = "@" .. v11.Name, 
                        meta = {
                            username = v11.Name, 
                            displayName = v11.DisplayName
                        }
                    });
                end;
            end;
            return v9;
        end);
        if l_status_0 then
            v4(l_result_0);
            return;
        else
            v5(l_result_0);
            return;
        end;
    end);
end;