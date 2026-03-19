local l_CorePackages_0 = game:GetService("CorePackages");
local l_InsertService_0 = game:GetService("InsertService");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Promise);
local _ = function() --[[ Line: 8 ]] --[[ Name: getLicenses ]]
    -- upvalues: v3 (copy), l_InsertService_0 (copy)
    return v3.new(function(v4, v5) --[[ Line: 9 ]]
        -- upvalues: l_InsertService_0 (ref)
        task.spawn(function() --[[ Line: 10 ]]
            -- upvalues: l_InsertService_0 (ref), v4 (copy), v5 (copy)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 13 ]]
                -- upvalues: l_InsertService_0 (ref)
                local v6 = {};
                local l_CoreScripts_0 = l_InsertService_0:LoadLocalAsset("rbxasset://models/Licenses/Licenses.rbxm"):FindFirstChild("CoreScripts");
                for _, v9 in pairs(l_CoreScripts_0:GetChildren()) do
                    local v10, v11 = v9.Name:match("^(%d*)-(.*)");
                    local v12 = v9.Value:match("(.-)\n*$");
                    v6[v10 + 1] = {
                        key = v11, 
                        value = v12:split("\n")
                    };
                end;
                return v6;
            end);
            if l_status_0 then
                v4(l_result_0);
                return;
            else
                v5(l_result_0);
                return;
            end;
        end);
    end);
end;
return function() --[[ Line: 48 ]] --[[ Name: useLicenseData ]]
    -- upvalues: v2 (copy), v3 (copy), l_InsertService_0 (copy)
    local v16, v17 = v2.useState({
        licenseList = {}, 
        initialLicense = nil, 
        initialLicenseKey = nil
    });
    v2.useLayoutEffect(function() --[[ Line: 55 ]]
        -- upvalues: v3 (ref), l_InsertService_0 (ref), v17 (copy)
        v3.new(function(v18, v19) --[[ Line: 9 ]]
            -- upvalues: l_InsertService_0 (ref)
            task.spawn(function() --[[ Line: 10 ]]
                -- upvalues: l_InsertService_0 (ref), v18 (copy), v19 (copy)
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 13 ]]
                    -- upvalues: l_InsertService_0 (ref)
                    local v20 = {};
                    local l_CoreScripts_1 = l_InsertService_0:LoadLocalAsset("rbxasset://models/Licenses/Licenses.rbxm"):FindFirstChild("CoreScripts");
                    for _, v23 in pairs(l_CoreScripts_1:GetChildren()) do
                        local v24, v25 = v23.Name:match("^(%d*)-(.*)");
                        local v26 = v23.Value:match("(.-)\n*$");
                        v20[v24 + 1] = {
                            key = v25, 
                            value = v26:split("\n")
                        };
                    end;
                    return v20;
                end);
                if l_status_1 then
                    v18(l_result_1);
                    return;
                else
                    v19(l_result_1);
                    return;
                end;
            end);
        end):andThen(function(v29) --[[ Line: 57 ]]
            -- upvalues: v17 (ref)
            v17({
                licenseList = v29, 
                initialLicense = v29[1], 
                initialLicenseKey = if v29[1] then v29[1].key else nil
            });
        end):catch(function(v30) --[[ Line: 64 ]]
            warn("Failed to retrieve license data: ", v30);
        end);
    end, {});
    return v16;
end;