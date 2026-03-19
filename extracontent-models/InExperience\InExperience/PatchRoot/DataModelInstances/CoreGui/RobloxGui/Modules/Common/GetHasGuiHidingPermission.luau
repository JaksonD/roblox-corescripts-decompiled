local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Promise);
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local v4 = require(l_RobloxGui_0.Modules.Flags.GetFIntCanHideGuiGroupId);
return function(_, v6, _) --[[ Line: 11 ]]
    -- upvalues: v2 (copy), v4 (copy)
    return v2.new(function(v8, v9) --[[ Line: 12 ]]
        -- upvalues: v6 (copy), v4 (ref)
        if not game:GetEngineFeature("GuiHidingApiSupport") then
            v8(false);
            return;
        elseif not v6 then
            v9("Invalid local player");
            return;
        else
            local v10 = false;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 24 ]]
                -- upvalues: v4 (ref), v10 (ref), v6 (ref)
                local v11 = v4();
                if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                    v10 = v6:IsInGroupAsync(v11);
                    return;
                else
                    v10 = v6:IsInGroup(v11);
                    return;
                end;
            end);
            if l_status_0 then
                v8(v10);
            else
                v9(l_result_0);
            end;
            return;
        end;
    end);
end;