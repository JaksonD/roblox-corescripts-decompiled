local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PaymentsProtocol).PaymentsProtocol.default;
local v3 = require(l_Modules_0.LuaApp.Actions.SetNativeRobuxProducts);
local v4 = nil;
pcall(function() --[[ Line: 9 ]]
    -- upvalues: v4 (ref)
    v4 = game:GetService("PlatformService");
end);
local v5 = require(l_Modules_0.LuaApp.Flags.GetFFlagNativeProductFallbackToPlatformService);
local v6 = {};
local function _(v7) --[[ Line: 20 ]] --[[ Name: parseRobuxValue ]]
    return (tonumber((string.gsub(v7.Name, "%D+", ""))));
end;
v6.Fetch = function() --[[ Line: 25 ]] --[[ Name: Fetch ]]
    -- upvalues: l_default_0 (copy), v3 (copy), v5 (copy), v4 (ref)
    return function(v9) --[[ Line: 26 ]]
        -- upvalues: l_default_0 (ref), v3 (ref), v5 (ref), v4 (ref)
        l_default_0:isAvailable():andThen(function(v10) --[[ Line: 27 ]]
            -- upvalues: l_default_0 (ref), v9 (copy), v3 (ref), v5 (ref), v4 (ref)
            local function v13(v11, v12) --[[ Line: 28 ]]
                return v11.robuxAmount < v12.robuxAmount;
            end;
            if v10 then
                l_default_0:listNativeProducts():andThen(function(v14) --[[ Line: 36 ]]
                    -- upvalues: v13 (copy), v9 (ref), v3 (ref)
                    table.sort(v14.products, v13);
                    v9:dispatch(v3(v14.products));
                end);
                return;
            elseif v5() then
                local v15 = nil;
                local v16 = nil;
                local v17 = nil;
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 44 ]]
                    -- upvalues: v15 (ref), v4 (ref)
                    v15 = v4:BeginGetCatalogInfo();
                end);
                v16 = l_status_0;
                v17 = l_result_0;
                if v16 then
                    l_status_0 = {};
                    for _, v21 in v15 do
                        table.insert(l_status_0, {
                            productId = v21.Name, 
                            price = tonumber(v21.Price) or 0, 
                            nativeProductId = v21.ProductId, 
                            robuxAmount = tonumber((string.gsub(v21.Name, "%D+", ""))) or 0, 
                            displayPrice = v21.DisplayPrice
                        });
                    end;
                    table.sort(l_status_0, v13);
                    v9:dispatch(v3(l_status_0));
                else
                    v9:dispatch(v3(nil));
                end;
                return;
            else
                v9:dispatch(v3(nil));
                return;
            end;
        end);
    end;
end;
return v6;