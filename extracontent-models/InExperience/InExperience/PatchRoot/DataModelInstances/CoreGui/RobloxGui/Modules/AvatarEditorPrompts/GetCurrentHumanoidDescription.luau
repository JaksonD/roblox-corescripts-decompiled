local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_CorePackages_0.Packages.Promise);
return function() --[[ Line: 6 ]]
    -- upvalues: v2 (copy), l_Players_0 (copy)
    return v2.new(function(v3, v4) --[[ Line: 7 ]]
        -- upvalues: l_Players_0 (ref)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 8 ]]
            -- upvalues: l_Players_0 (ref)
            if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                return l_Players_0:GetHumanoidDescriptionFromUserIdAsync(l_Players_0.LocalPlayer.UserId);
            else
                return l_Players_0:GetHumanoidDescriptionFromUserId(l_Players_0.LocalPlayer.UserId);
            end;
        end);
        if l_status_0 then
            v3(l_result_0);
            return;
        else
            v4();
            return;
        end;
    end);
end;