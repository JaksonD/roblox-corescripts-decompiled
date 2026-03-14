local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Promise);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetHydratedWidgetData);
local v8 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXAnimatedLooksThumbnails);
return function(v9, v10, v11) --[[ Line: 20 ]]
    -- upvalues: l_PerformFetch_0 (copy), v6 (copy), v8 (copy), v3 (copy), v7 (copy), l_Logging_0 (copy), v2 (copy)
    return l_PerformFetch_0.Single("hydrateWidgetKey." .. v11, function(v12) --[[ Line: 21 ]]
        -- upvalues: v6 (ref), v9 (copy), v10 (copy), v8 (ref), v3 (ref), v7 (ref), l_Logging_0 (ref), v2 (ref)
        return v6.HydrateWidgetContent(v9, v10):andThen(function(v13) --[[ Line: 22 ]]
            -- upvalues: v10 (ref), v8 (ref), v3 (ref), v12 (copy), v7 (ref)
            local v14 = if v13 then v13.responseBody else nil;
            local v15 = if v14 then v14.hydratedContent else nil;
            if v15 == nil then
                return;
            else
                assert(v15, "");
                local v16 = {};
                for _, v18 in v15 do
                    local l_type_0 = v18.type;
                    local v20 = tostring(v18.id);
                    if not v16[l_type_0] then
                        v16[l_type_0] = {};
                    end;
                    v16[l_type_0][v20] = v18;
                end;
                for _, v22 in v10 do
                    local l_type_1 = v22.type;
                    local v24 = tostring(v22.id);
                    if not v16[l_type_1] then
                        v16[l_type_1] = {};
                    end;
                    if not v16[l_type_1][v24] then
                        v16[l_type_1][v24] = {
                            id = v22.id, 
                            type = l_type_1, 
                            failedToHydrate = true
                        };
                    elseif v8() then
                        v16[l_type_1][v24] = v3.Dictionary.join(v22, v16[l_type_1][v24]);
                    end;
                end;
                v12:dispatch(v7(v16));
                return;
            end;
        end, function(v25) --[[ Line: 58 ]]
            -- upvalues: l_Logging_0 (ref), v2 (ref)
            l_Logging_0.warn("WebApi failure in FetchHydratedWidgetContent: " .. tostring(v25));
            return v2.reject(v25);
        end);
    end);
end;