local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Groups");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Signals);
local v4 = require(l_Parent_0.HttpStore);
local v5 = require(l_Parent_0.Http);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_FFlagLuaAppUseAppHttpStore_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUseAppHttpStore;
local v8 = require(l_Parent_0.InternalHttpStore);
local l_GROUPS_URL_0 = v5.Url.GROUPS_URL;
local v10 = {};
local function _(v11) --[[ Line: 46 ]] --[[ Name: createApiResponse ]]
    -- upvalues: v3 (copy), l_HttpService_0 (copy)
    return v3.createComputed(function(v12) --[[ Line: 47 ]]
        -- upvalues: v11 (copy), l_HttpService_0 (ref)
        local v13 = v11(v12);
        if v13.status == "Success" then
            local l_status_0, l_result_0 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v13.response.Body);
            return {
                status = l_status_0 and "Success" or "Failed", 
                data = if l_status_0 then l_result_0 else nil, 
                error = not l_status_0 and "JSON parse error" or nil, 
                statusCode = v13.response.StatusCode
            };
        elseif v13.status == "Failed" then
            local l_response_0 = v13.response;
            return {
                status = "Failed", 
                data = nil, 
                error = if l_response_0 then l_response_0.ErrorMessage else "Request failed", 
                statusCode = if l_response_0 then l_response_0.StatusCode else nil
            };
        else
            return {
                status = "Loading", 
                data = nil, 
                error = nil, 
                statusCode = nil
            };
        end;
    end);
end;
v10.GetUserGroupsWithRoles = function(v18) --[[ Line: 84 ]] --[[ Name: GetUserGroupsWithRoles ]]
    -- upvalues: l_GROUPS_URL_0 (copy), v8 (copy), l_FFlagLuaAppUseAppHttpStore_0 (copy), v4 (copy), v3 (copy), l_HttpService_0 (copy)
    local v19 = "GetUserGroupsWithRoles_" .. v18;
    local v20 = string.format("%sv1/users/%s/groups/roles?includeLocked=true", l_GROUPS_URL_0, v18);
    local v21 = v8.GetHttpStore();
    if l_FFlagLuaAppUseAppHttpStore_0 then
        v21 = v4.Instance.get();
    end;
    local v22, v23 = v21.fetch(v19, {
        Url = v20, 
        Method = "GET"
    });
    return v3.createComputed(function(v24) --[[ Line: 47 ]]
        -- upvalues: v22 (copy), l_HttpService_0 (ref)
        local v25 = v22(v24);
        if v25.status == "Success" then
            local l_status_1, l_result_1 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v25.response.Body);
            return {
                status = l_status_1 and "Success" or "Failed", 
                data = if l_status_1 then l_result_1 else nil, 
                error = not l_status_1 and "JSON parse error" or nil, 
                statusCode = v25.response.StatusCode
            };
        elseif v25.status == "Failed" then
            local l_response_1 = v25.response;
            return {
                status = "Failed", 
                data = nil, 
                error = if l_response_1 then l_response_1.ErrorMessage else "Request failed", 
                statusCode = if l_response_1 then l_response_1.StatusCode else nil
            };
        else
            return {
                status = "Loading", 
                data = nil, 
                error = nil, 
                statusCode = nil
            };
        end;
    end), v23;
end;
v10.GetPrimaryGroupRole = function(v29) --[[ Line: 109 ]] --[[ Name: GetPrimaryGroupRole ]]
    -- upvalues: l_GROUPS_URL_0 (copy), v8 (copy), l_FFlagLuaAppUseAppHttpStore_0 (copy), v4 (copy), v3 (copy), l_HttpService_0 (copy)
    local v30 = "GetPrimaryGroupRole_" .. v29;
    local v31 = string.format("%sv1/users/%s/groups/primary/role", l_GROUPS_URL_0, v29);
    local v32 = v8.GetHttpStore();
    if l_FFlagLuaAppUseAppHttpStore_0 then
        v32 = v4.Instance.get();
    end;
    local v33, v34 = v32.fetch(v30, {
        Url = v31, 
        Method = "GET"
    });
    return v3.createComputed(function(v35) --[[ Line: 47 ]]
        -- upvalues: v33 (copy), l_HttpService_0 (ref)
        local v36 = v33(v35);
        if v36.status == "Success" then
            local l_status_2, l_result_2 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v36.response.Body);
            return {
                status = l_status_2 and "Success" or "Failed", 
                data = if l_status_2 then l_result_2 else nil, 
                error = not l_status_2 and "JSON parse error" or nil, 
                statusCode = v36.response.StatusCode
            };
        elseif v36.status == "Failed" then
            local l_response_2 = v36.response;
            return {
                status = "Failed", 
                data = nil, 
                error = if l_response_2 then l_response_2.ErrorMessage else "Request failed", 
                statusCode = if l_response_2 then l_response_2.StatusCode else nil
            };
        else
            return {
                status = "Loading", 
                data = nil, 
                error = nil, 
                statusCode = nil
            };
        end;
    end), v34;
end;
v10.GetGroupPolicies = function(v40) --[[ Line: 134 ]] --[[ Name: GetGroupPolicies ]]
    -- upvalues: l_GROUPS_URL_0 (copy), l_HttpService_0 (copy), v8 (copy), l_FFlagLuaAppUseAppHttpStore_0 (copy), v4 (copy), v3 (copy)
    local v41 = table.clone(v40);
    table.sort(v41);
    local v42 = "GetGroupPolicies_" .. table.concat(v41, "_");
    local v43 = string.format("%sv1/groups/policies", l_GROUPS_URL_0);
    local v44 = l_HttpService_0:JSONEncode({
        groupIds = v40
    });
    local v45 = v8.GetHttpStore();
    if l_FFlagLuaAppUseAppHttpStore_0 then
        v45 = v4.Instance.get();
    end;
    local v46, v47 = v45.fetch(v42, {
        Url = v43, 
        Method = "POST", 
        Body = v44, 
        Headers = {
            ["Content-Type"] = "application/json"
        }
    });
    return v3.createComputed(function(v48) --[[ Line: 47 ]]
        -- upvalues: v46 (copy), l_HttpService_0 (ref)
        local v49 = v46(v48);
        if v49.status == "Success" then
            local l_status_3, l_result_3 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v49.response.Body);
            return {
                status = l_status_3 and "Success" or "Failed", 
                data = if l_status_3 then l_result_3 else nil, 
                error = not l_status_3 and "JSON parse error" or nil, 
                statusCode = v49.response.StatusCode
            };
        elseif v49.status == "Failed" then
            local l_response_3 = v49.response;
            return {
                status = "Failed", 
                data = nil, 
                error = if l_response_3 then l_response_3.ErrorMessage else "Request failed", 
                statusCode = if l_response_3 then l_response_3.StatusCode else nil
            };
        else
            return {
                status = "Loading", 
                data = nil, 
                error = nil, 
                statusCode = nil
            };
        end;
    end), v47;
end;
v10.GetGroupsMetadata = function() --[[ Line: 166 ]] --[[ Name: GetGroupsMetadata ]]
    -- upvalues: l_GROUPS_URL_0 (copy), v8 (copy), l_FFlagLuaAppUseAppHttpStore_0 (copy), v4 (copy), v3 (copy), l_HttpService_0 (copy)
    local v53 = string.format("%sv1/groups/metadata", l_GROUPS_URL_0);
    local v54 = v8.GetHttpStore();
    if l_FFlagLuaAppUseAppHttpStore_0 then
        v54 = v4.Instance.get();
    end;
    local v55, v56 = v54.fetch("GetGroupsMetadata", {
        Url = v53, 
        Method = "GET"
    });
    return v3.createComputed(function(v57) --[[ Line: 47 ]]
        -- upvalues: v55 (copy), l_HttpService_0 (ref)
        local v58 = v55(v57);
        if v58.status == "Success" then
            local l_status_4, l_result_4 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v58.response.Body);
            return {
                status = l_status_4 and "Success" or "Failed", 
                data = if l_status_4 then l_result_4 else nil, 
                error = not l_status_4 and "JSON parse error" or nil, 
                statusCode = v58.response.StatusCode
            };
        elseif v58.status == "Failed" then
            local l_response_4 = v58.response;
            return {
                status = "Failed", 
                data = nil, 
                error = if l_response_4 then l_response_4.ErrorMessage else "Request failed", 
                statusCode = if l_response_4 then l_response_4.StatusCode else nil
            };
        else
            return {
                status = "Loading", 
                data = nil, 
                error = nil, 
                statusCode = nil
            };
        end;
    end), v56;
end;
return v10;