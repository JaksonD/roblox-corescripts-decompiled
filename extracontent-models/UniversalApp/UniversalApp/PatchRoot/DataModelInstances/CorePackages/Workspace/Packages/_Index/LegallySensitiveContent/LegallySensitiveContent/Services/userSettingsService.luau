local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_0.dependencies);
local l_Promise_0 = v3.Promise;
local l_UrlBuilder_0 = v3.UrlBuilder;
local l_UrlBase_0 = v3.UrlBase;
local l_Fetch_0 = v3.Fetch;
local l_fetch_0 = l_Fetch_0.fetch;
local l_Response_0 = l_Fetch_0.Response;
local v10 = require(l_Parent_0.Enums.UserSetting);
local l_FFlagLuaAppSduiUpdateUserSettingsAction_0 = require(l_Parent_1.SharedFlags).FFlagLuaAppSduiUpdateUserSettingsAction;
local v12 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "user-settings-api/v1/user-settings"
});
local function v22(v13, v14, v15) --[[ Line: 28 ]] --[[ Name: updateUserSetting ]]
    -- upvalues: v12 (copy), l_Promise_0 (copy), l_fetch_0 (copy), l_HttpService_0 (copy), l_Response_0 (copy)
    local v16 = v12();
    return l_Promise_0.new(function(v17, v18) --[[ Line: 30 ]]
        -- upvalues: l_fetch_0 (ref), v16 (copy), l_HttpService_0 (ref), v13 (copy), v14 (copy), v15 (copy), l_Response_0 (ref)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 31 ]]
            -- upvalues: l_fetch_0 (ref), v16 (ref), l_HttpService_0 (ref), v13 (ref), v14 (ref), v15 (ref), l_Response_0 (ref)
            return l_fetch_0(v16, {
                method = "POST", 
                body = l_HttpService_0:JSONEncode({
                    [v13] = v14
                }), 
                headers = {
                    ["Content-Type"] = "application/json", 
                    Accept = "application/json", 
                    ["rbx-audit-data"] = v15
                }
            }):catch(function(_) --[[ Line: 43 ]]
                -- upvalues: l_Response_0 (ref)
                return l_Response_0.error();
            end):expect();
        end);
        if not l_status_0 then
            v18("Failed to make request: " .. tostring(l_result_0));
            return;
        elseif not l_result_0.ok then
            v18((string.format("Got update user setting HTTP Response: %d - %s", l_result_0.status, l_result_0.statusText)));
            return;
        else
            v17();
            return;
        end;
    end);
end;
local function v33(v23, v24) --[[ Line: 72 ]] --[[ Name: updateUserSettings ]]
    -- upvalues: v10 (copy), l_Promise_0 (copy), v12 (copy), l_fetch_0 (copy), l_HttpService_0 (copy), l_Response_0 (copy)
    for v25, _ in v23 do
        if not v10[v25] then
            return l_Promise_0.reject((("Invalid setting name: %*"):format(v25)));
        end;
    end;
    local v27 = v12();
    return l_Promise_0.new(function(v28, v29) --[[ Line: 80 ]]
        -- upvalues: l_fetch_0 (ref), v27 (copy), l_HttpService_0 (ref), v23 (copy), v24 (copy), l_Response_0 (ref)
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 81 ]]
            -- upvalues: l_fetch_0 (ref), v27 (ref), l_HttpService_0 (ref), v23 (ref), v24 (ref), l_Response_0 (ref)
            return l_fetch_0(v27, {
                method = "POST", 
                body = l_HttpService_0:JSONEncode(v23), 
                headers = {
                    ["Content-Type"] = "application/json", 
                    Accept = "application/json", 
                    ["rbx-audit-data"] = v24
                }
            }):catch(function(_) --[[ Line: 91 ]]
                -- upvalues: l_Response_0 (ref)
                return l_Response_0.error();
            end):expect();
        end);
        if not l_status_1 or not l_result_1 then
            v29((("Failed to make request: %*"):format(l_result_1)));
            return;
        elseif not l_result_1.ok then
            v29((("Got update user setting HTTP Response: %* - %*"):format(l_result_1.status, l_result_1.statusText)));
            return;
        else
            v28(l_result_1);
            return;
        end;
    end);
end;
return {
    updateUserSetting = v22, 
    updateUserSettings = if l_FFlagLuaAppSduiUpdateUserSettingsAction_0 then v33 else nil
};