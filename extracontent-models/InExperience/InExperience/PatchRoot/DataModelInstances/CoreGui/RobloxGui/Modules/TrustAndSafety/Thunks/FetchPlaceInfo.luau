local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GetGameNameAndDescription_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription;
local v5 = require(l_RobloxGui_0.Modules.Common.httpRequest)(l_HttpRbxApiService_0);
local l_Parent_0 = script.Parent.Parent;
local v7 = require(l_Parent_0.Actions.SetPlaceInfo);
return function(v8) --[[ Line: 16 ]]
    -- upvalues: l_GetGameNameAndDescription_0 (copy), v5 (copy), v7 (copy)
    return function(v9) --[[ Line: 17 ]]
        -- upvalues: v8 (copy), l_GetGameNameAndDescription_0 (ref), v5 (ref), v7 (ref)
        if v8 == 0 then
            return;
        else
            l_GetGameNameAndDescription_0(v5, v8):andThen(function(v10) --[[ Line: 21 ]]
                -- upvalues: v9 (copy), v7 (ref)
                v9:dispatch(v7(v10.Name, v10.Description));
            end):catch(function() --[[ Line: 23 ]]
                warn("Unable to fetch place info for TrustAndSafety.");
            end);
            return;
        end;
    end;
end;