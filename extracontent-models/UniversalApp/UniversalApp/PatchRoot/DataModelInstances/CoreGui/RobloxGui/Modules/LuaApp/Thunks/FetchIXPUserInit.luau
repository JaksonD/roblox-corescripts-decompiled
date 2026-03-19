local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v4 = require(l_Modules_0.LuaApp.ArgCheck);
local v5 = require(l_Modules_0.LuaApp.Promise);
local v6 = {};
local function _(v7, v8) --[[ Line: 11 ]]
    return "IXPFetchUserInit" .. tostring(v7) .. tostring(v8);
end;
v6.Fetch = function(v10, v11, v12) --[[ Line: 15 ]] --[[ Name: Fetch ]]
    -- upvalues: l_PerformFetch_0 (copy), v5 (copy), v4 (copy), v6 (copy), l_RetrievalStatus_0 (copy)
    return l_PerformFetch_0.Single("IXPFetchUserInit" .. tostring(v11) .. tostring(v10), function(v13) --[[ Line: 16 ]]
        -- upvalues: v10 (copy), v5 (ref), v4 (ref), v11 (copy), v6 (ref), v12 (copy), l_PerformFetch_0 (ref), l_RetrievalStatus_0 (ref)
        if not v10 then
            return v5.reject();
        else
            v4.isInTypes(v11, {
                "number", 
                "string"
            }, "userId");
            if typeof(v11) == "string" then
                v4.isNonEmptyString(v11, "userId");
            end;
            v4.assert(v6.IsValidUserIdForIxp(v11), string.format("expects %s to be a number or string representing a positive number!", v11));
            local v14 = tonumber(v11) or 0;
            v10:InitializeUserLayers(v14);
            if v10:GetUserLayerLoadingStatus() ~= Enum.IXPLoadingStatus.Pending then
                return v5.resolve();
            else
                local v15 = nil;
                local v16 = false;
                return v5.new(function(v17, v18) --[[ Line: 41 ]]
                    -- upvalues: v12 (ref), v16 (ref), l_PerformFetch_0 (ref), v13 (copy), v11 (ref), v10 (ref), l_RetrievalStatus_0 (ref), v15 (ref)
                    if v12 then
                        delay(v12, function() --[[ Line: 43 ]]
                            -- upvalues: v16 (ref), l_PerformFetch_0 (ref), v13 (ref), v11 (ref), v10 (ref), l_RetrievalStatus_0 (ref), v15 (ref), v18 (copy)
                            if v16 then
                                return;
                            else
                                local l_GetStatus_0 = l_PerformFetch_0.GetStatus;
                                local v20 = v13:getState();
                                local l_v11_0 = v11;
                                local l_v10_0 = v10;
                                l_GetStatus_0 = l_GetStatus_0(v20, "IXPFetchUserInit" .. tostring(l_v11_0) .. tostring(l_v10_0));
                                if l_GetStatus_0 ~= l_RetrievalStatus_0.Done and l_GetStatus_0 ~= l_RetrievalStatus_0.Failed then
                                    if v15 then
                                        v15:disconnect();
                                        v15 = nil;
                                    end;
                                    v18();
                                end;
                                return;
                            end;
                        end);
                    end;
                    v15 = v10.OnUserLayerLoadingStatusChanged:Connect(function(_) --[[ Line: 59 ]]
                        -- upvalues: v10 (ref), v16 (ref), v15 (ref), v17 (copy)
                        if v10:GetUserLayerLoadingStatus() ~= Enum.IXPLoadingStatus.Pending then
                            v16 = true;
                            if v15 then
                                v15:disconnect();
                                v15 = nil;
                            end;
                            v17();
                        end;
                    end);
                end);
            end;
        end;
    end);
end;
v6.GetFetchingStatus = function(v24, v25, v26) --[[ Line: 74 ]] --[[ Name: GetFetchingStatus ]]
    -- upvalues: l_PerformFetch_0 (copy)
    return l_PerformFetch_0.GetStatus(v24, "IXPFetchUserInit" .. tostring(v25) .. tostring(v26));
end;
v6.IsValidUserIdForIxp = function(v27) --[[ Line: 78 ]] --[[ Name: IsValidUserIdForIxp ]]
    local v28 = false;
    if v27 ~= nil then
        v28 = false;
        if v27 ~= "" then
            v28 = false;
            if v27 ~= "-1" then
                v28 = false;
                if v27 ~= "0" then
                    v28 = false;
                    if v27 ~= -1 then
                        v28 = v27 ~= 0;
                    end;
                end;
            end;
        end;
    end;
    return v28;
end;
return v6;