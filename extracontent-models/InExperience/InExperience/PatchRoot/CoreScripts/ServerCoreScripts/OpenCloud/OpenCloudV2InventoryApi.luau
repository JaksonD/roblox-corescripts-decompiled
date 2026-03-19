local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_HttpService_0 = game:GetService("HttpService");
local l_OpenCloudService_0 = game:GetService("OpenCloudService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
returnInvalidArgumentError = function(v5) --[[ Line: 23 ]] --[[ Name: returnInvalidArgumentError ]]
    -- upvalues: l_HttpService_0 (copy)
    return {
        StatusCode = 400, 
        Body = l_HttpService_0:JSONEncode({
            code = "INVALID_ARGUMENT", 
            message = v5
        })
    };
end;
verifyPlayerOnServer = function(v6) --[[ Line: 33 ]] --[[ Name: verifyPlayerOnServer ]]
    -- upvalues: l_Players_0 (copy)
    local v7 = verifyPlayer(v6);
    if v7 ~= nil then
        return v7;
    else
        local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
        for _, v10 in ipairs(l_l_Players_0_Players_0) do
            if v10.UserId == v6.UserId then
                return nil;
            end;
        end;
        return returnInvalidArgumentError("Player not found on server.");
    end;
end;
verifyPlayer = function(v11) --[[ Line: 49 ]] --[[ Name: verifyPlayer ]]
    if typeof(v11) ~= "Instance" or v11.ClassName ~= "Player" then
        return returnInvalidArgumentError("user argument not a Player instance.");
    else
        return nil;
    end;
end;
verifyString = function(v12) --[[ Line: 56 ]] --[[ Name: verifyString ]]
    if typeof(v12) ~= "string" then
        return returnInvalidArgumentError("Argument not a string.");
    else
        return nil;
    end;
end;
verifyNumber = function(v13) --[[ Line: 63 ]] --[[ Name: verifyNumber ]]
    if typeof(v13) ~= "number" then
        return returnInvalidArgumentError("Argument not a number.");
    else
        return nil;
    end;
end;
getUrlPrefix = function() --[[ Line: 70 ]] --[[ Name: getUrlPrefix ]]
    -- upvalues: l_RunService_0 (copy)
    if l_RunService_0:IsStudio() then
        return "user";
    else
        return "rcc";
    end;
end;
createListInventoryItemsUrl = function(v14, v15, v16, v17) --[[ Line: 77 ]] --[[ Name: createListInventoryItemsUrl ]]
    -- upvalues: l_ContentProvider_0 (copy)
    local v18 = l_ContentProvider_0.BaseUrl:lower();
    v18 = string.gsub(v18, "http:", "https:");
    local v19 = string.gsub(v18, "www", "apis");
    local v20 = string.format("%s%s/cloud/v2/users/%d/inventory-items", v19, getUrlPrefix(), v14);
    if v15 == nil and v16 == nil and v17 == nil then
        return v20;
    else
        local v21 = {};
        if v15 ~= nil then
            table.insert(v21, string.format("maxPageSize=%d", v15));
        end;
        if v16 ~= nil then
            table.insert(v21, string.format("pageToken=%s", v16));
        end;
        if v17 ~= nil then
            table.insert(v21, string.format("filter=%s", v17));
        end;
        return (string.format("%s?%s", v20, table.concat(v21, "&")));
    end;
end;
listInventoryItems = function(v22) --[[ Line: 102 ]] --[[ Name: listInventoryItems ]]
    -- upvalues: l_OpenCloudService_0 (copy)
    if v22.user == nil then
        return returnInvalidArgumentError("user argument was not provided.");
    else
        local v23 = verifyPlayerOnServer(v22.user);
        if v23 ~= nil then
            return v23;
        else
            if v22.maxPageSize ~= nil then
                v23 = verifyNumber(v22.maxPageSize);
                if v23 ~= nil then
                    return v23;
                end;
            end;
            if v22.pageToken ~= nil then
                v23 = verifyString(v22.pageToken);
                if v23 ~= nil then
                    return v23;
                end;
            end;
            if v22.filter ~= nil then
                v23 = verifyString(v22.filter);
                if v23 ~= nil then
                    return v23;
                end;
            end;
            return l_OpenCloudService_0:HttpRequestAsync({
                Url = createListInventoryItemsUrl(v22.user.UserId, v22.maxPageSize, v22.pageToken, v22.filter), 
                Request_Type = "GET"
            });
        end;
    end;
end;
l_OpenCloudService_0:RegisterOpenCloud("v2", "listInventoryItems", listInventoryItems);
l_OpenCloudService_0:RegistrationComplete();