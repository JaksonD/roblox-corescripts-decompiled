local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_HttpService_0 = game:GetService("HttpService");
local l_OpenCloudService_0 = game:GetService("OpenCloudService");
local l_RunService_0 = game:GetService("RunService");
InvalidArgumentError = function(v4) --[[ Line: 19 ]] --[[ Name: InvalidArgumentError ]]
    -- upvalues: l_HttpService_0 (copy)
    return {
        StatusCode = 400, 
        Body = l_HttpService_0:JSONEncode({
            code = "INVALID_ARGUMENT", 
            message = v4
        })
    };
end;
verifyTable = function(v5, v6) --[[ Line: 37 ]] --[[ Name: verifyTable ]]
    if v5 == nil then
        return nil;
    elseif typeof(v5) ~= "table" then
        return InvalidArgumentError((("Argument not a table: %*."):format(v6)));
    else
        return nil;
    end;
end;
verifyNumber = function(v7, v8) --[[ Line: 49 ]] --[[ Name: verifyNumber ]]
    if v7 == nil then
        return nil;
    elseif typeof(v7) ~= "number" then
        return InvalidArgumentError((("Argument not a number: %*."):format(v8)));
    else
        return nil;
    end;
end;
verifyString = function(v9, v10) --[[ Line: 61 ]] --[[ Name: verifyString ]]
    if v9 == nil then
        return nil;
    elseif typeof(v9) ~= "string" then
        return InvalidArgumentError((("Argument not a string: %*."):format(v10)));
    else
        return nil;
    end;
end;
verifyEnum = function(v11, v12) --[[ Line: 73 ]] --[[ Name: verifyEnum ]]
    if v11 == nil then
        return nil;
    elseif typeof(v11) ~= "number" and typeof(v11) ~= "string" then
        return InvalidArgumentError((("Argument not an enum: %*."):format(v12)));
    else
        return nil;
    end;
end;
getApisUrl = function() --[[ Line: 85 ]] --[[ Name: getApisUrl ]]
    -- upvalues: l_ContentProvider_0 (copy)
    local v13 = l_ContentProvider_0.BaseUrl:lower();
    v13 = string.gsub(v13, "http:", "https:");
    return string.gsub(v13, "www", "apis");
end;
getUrlPrefix = function(v14) --[[ Line: 91 ]] --[[ Name: getUrlPrefix ]]
    -- upvalues: l_RunService_0 (copy)
    if v14 ~= nil and v14["x-api-key"] ~= nil then
        return "";
    elseif l_RunService_0:IsStudio() then
        return "user";
    else
        return "rcc";
    end;
end;
verifyGetUniverseRequest = function(v15, v16) --[[ Line: 101 ]] --[[ Name: verifyGetUniverseRequest ]]
    if v15 == nil then
        return nil;
    else
        local v17 = verifyTable(v15, v16);
        if v17 ~= nil then
            return v17;
        elseif v15.path == nil then
            return InvalidArgumentError((("Required argument was not provided: %*.path."):format(v16)));
        else
            v17 = verifyString(v15.path, (("%*.path"):format(v16)));
            if v17 ~= nil then
                return v17;
            else
                return nil;
            end;
        end;
    end;
end;
getUniverseUrl = function(v18, v19) --[[ Line: 122 ]] --[[ Name: getUniverseUrl ]]
    if v18.path == nil then
        return InvalidArgumentError("URL parameter provided was nil: getUniverseRequest.path.");
    elseif string.match(v18.path, "^universes/([^/]+)$") == nil then
        return InvalidArgumentError("URL parameter was not formatted correctly: getUniverseRequest.path.");
    else
        return (string.format("%s%s/cloud/v2/%s", getApisUrl(), getUrlPrefix(v19), (tostring(v18.path))));
    end;
end;
getUniverse = function(v20, v21) --[[ Line: 135 ]] --[[ Name: getUniverse ]]
    -- upvalues: l_OpenCloudService_0 (copy)
    if v20 == nil then
        return InvalidArgumentError("Request provided was nil.");
    else
        local v22 = verifyGetUniverseRequest(v20, "getUniverseRequest");
        if v22 ~= nil then
            return v22;
        else
            local v23 = getUniverseUrl(v20, v21);
            if typeof(v23) ~= "string" then
                return v23;
            else
                return l_OpenCloudService_0:HttpRequestAsync({
                    Url = v23, 
                    Request_Type = "GET", 
                    Headers = v21
                });
            end;
        end;
    end;
end;
l_OpenCloudService_0:RegisterOpenCloud("v2", "GetUniverse", getUniverse);
verifyTranslateTextRequest = function(v24, v25) --[[ Line: 155 ]] --[[ Name: verifyTranslateTextRequest ]]
    if v24 == nil then
        return nil;
    else
        local v26 = verifyTable(v24, v25);
        if v26 ~= nil then
            return v26;
        elseif v24.path == nil then
            return InvalidArgumentError((("Required argument was not provided: %*.path."):format(v25)));
        else
            v26 = verifyString(v24.path, (("%*.path"):format(v25)));
            if v26 ~= nil then
                return v26;
            elseif v24.text == nil then
                return InvalidArgumentError((("Required argument was not provided: %*.text."):format(v25)));
            else
                v26 = verifyString(v24.text, (("%*.text"):format(v25)));
                if v26 ~= nil then
                    return v26;
                else
                    v26 = verifyString(v24.sourceLanguageCode, (("%*.sourceLanguageCode"):format(v25)));
                    if v26 ~= nil then
                        return v26;
                    else
                        for v27, v28 in v24.targetLanguageCodes do
                            v26 = verifyString(v28, (("%*.targetLanguageCodes[%*]"):format(v25, v27)));
                            if v26 ~= nil then
                                return v26;
                            end;
                        end;
                        return nil;
                    end;
                end;
            end;
        end;
    end;
end;
translateTextUrl = function(v29) --[[ Line: 196 ]] --[[ Name: translateTextUrl ]]
    if v29.path == nil then
        return InvalidArgumentError("URL parameter provided was nil: translateTextRequest.path.");
    elseif string.match(v29.path, "^universes/([^/]+)$") == nil then
        return InvalidArgumentError("URL parameter was not formatted correctly: translateTextRequest.path.");
    else
        return (string.format("%s%s/cloud/v2/%s:translateText", getApisUrl(), getUrlPrefix(), (tostring(v29.path))));
    end;
end;
translateText = function(v30) --[[ Line: 209 ]] --[[ Name: translateText ]]
    -- upvalues: l_HttpService_0 (copy), l_OpenCloudService_0 (copy)
    if v30 == nil then
        return InvalidArgumentError("Request provided was nil.");
    else
        local v31 = verifyTranslateTextRequest(v30, "translateTextRequest");
        if v31 ~= nil then
            return v31;
        else
            local v32 = translateTextUrl(v30);
            if typeof(v32) ~= "string" then
                return v32;
            else
                local v33 = l_HttpService_0:JSONEncode(v30);
                return l_OpenCloudService_0:HttpRequestAsync({
                    Url = v32, 
                    Request_Type = "POST", 
                    Body = v33
                });
            end;
        end;
    end;
end;
l_OpenCloudService_0:RegisterOpenCloud("v2", "TranslateText", translateText);
verifyGenerateSpeechRequest = function(v34, v35) --[[ Line: 231 ]] --[[ Name: verifyGenerateSpeechRequest ]]
    if v34 == nil then
        return nil;
    else
        local v36 = verifyTable(v34, v35);
        if v36 ~= nil then
            return v36;
        elseif v34.path == nil then
            return InvalidArgumentError((("Required argument was not provided: %*.path."):format(v35)));
        else
            v36 = verifyString(v34.path, (("%*.path"):format(v35)));
            if v36 ~= nil then
                return v36;
            elseif v34.text == nil then
                return InvalidArgumentError((("Required argument was not provided: %*.text."):format(v35)));
            else
                v36 = verifyString(v34.text, (("%*.text"):format(v35)));
                if v36 ~= nil then
                    return v36;
                else
                    v36 = verifyGeneratedSpeechStyle(v34.speechStyle, (("%*.speechStyle"):format(v35)));
                    if v36 ~= nil then
                        return v36;
                    else
                        return nil;
                    end;
                end;
            end;
        end;
    end;
end;
verifyGeneratedSpeechStyle = function(v37, v38) --[[ Line: 265 ]] --[[ Name: verifyGeneratedSpeechStyle ]]
    if v37 == nil then
        return nil;
    else
        local v39 = verifyTable(v37, v38);
        if v39 ~= nil then
            return v39;
        else
            v39 = verifyString(v37.voiceId, (("%*.voiceId"):format(v38)));
            if v39 ~= nil then
                return v39;
            else
                v39 = verifyNumber(v37.pitch, (("%*.pitch"):format(v38)));
                if v39 ~= nil then
                    return v39;
                else
                    v39 = verifyNumber(v37.speed, (("%*.speed"):format(v38)));
                    if v39 ~= nil then
                        return v39;
                    else
                        return nil;
                    end;
                end;
            end;
        end;
    end;
end;
generateSpeechUrl = function(v40) --[[ Line: 293 ]] --[[ Name: generateSpeechUrl ]]
    if v40.path == nil then
        return InvalidArgumentError("URL parameter provided was nil: generateSpeechRequest.path.");
    elseif string.match(v40.path, "^universes/([^/]+)$") == nil then
        return InvalidArgumentError("URL parameter was not formatted correctly: generateSpeechRequest.path.");
    else
        return (string.format("%s%s/cloud/v2/%s:generateSpeech", getApisUrl(), getUrlPrefix(), (tostring(v40.path))));
    end;
end;
generateSpeech = function(v41) --[[ Line: 306 ]] --[[ Name: generateSpeech ]]
    -- upvalues: l_HttpService_0 (copy), l_OpenCloudService_0 (copy)
    if v41 == nil then
        return InvalidArgumentError("Request provided was nil.");
    else
        local v42 = verifyGenerateSpeechRequest(v41, "generateSpeechRequest");
        if v42 ~= nil then
            return v42;
        else
            local v43 = generateSpeechUrl(v41);
            if typeof(v43) ~= "string" then
                return v43;
            else
                local v44 = l_HttpService_0:JSONEncode(v41);
                return l_OpenCloudService_0:HttpRequestAsync({
                    Url = v43, 
                    Request_Type = "POST", 
                    Body = v44
                });
            end;
        end;
    end;
end;
l_OpenCloudService_0:RegisterOpenCloud("v2", "GenerateSpeech", generateSpeech);
verifyGenerateTextRequest = function(v45, v46) --[[ Line: 328 ]] --[[ Name: verifyGenerateTextRequest ]]
    if v45 == nil then
        return nil;
    else
        local v47 = verifyTable(v45, v46);
        if v47 ~= nil then
            return v47;
        elseif v45.path == nil then
            return InvalidArgumentError((("Required argument was not provided: %*.path."):format(v46)));
        else
            v47 = verifyString(v45.path, (("%*.path"):format(v46)));
            if v47 ~= nil then
                return v47;
            else
                v47 = verifyString(v45.userPrompt, (("%*.userPrompt"):format(v46)));
                if v47 ~= nil then
                    return v47;
                else
                    v47 = verifyString(v45.systemPrompt, (("%*.systemPrompt"):format(v46)));
                    if v47 ~= nil then
                        return v47;
                    else
                        v47 = verifyNumber(v45.temperature, (("%*.temperature"):format(v46)));
                        if v47 ~= nil then
                            return v47;
                        else
                            v47 = verifyNumber(v45.topP, (("%*.topP"):format(v46)));
                            if v47 ~= nil then
                                return v47;
                            else
                                v47 = verifyNumber(v45.maxTokens, (("%*.maxTokens"):format(v46)));
                                if v47 ~= nil then
                                    return v47;
                                else
                                    v47 = verifyNumber(v45.seed, (("%*.seed"):format(v46)));
                                    if v47 ~= nil then
                                        return v47;
                                    else
                                        v47 = verifyString(v45.contextToken, (("%*.contextToken"):format(v46)));
                                        if v47 ~= nil then
                                            return v47;
                                        else
                                            v47 = verifyString(v45.model, (("%*.model"):format(v46)));
                                            if v47 ~= nil then
                                                return v47;
                                            else
                                                return nil;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
generateTextUrl = function(v48) --[[ Line: 389 ]] --[[ Name: generateTextUrl ]]
    if v48.path == nil then
        return InvalidArgumentError("URL parameter provided was nil: generateTextRequest.path.");
    elseif string.match(v48.path, "^universes/([^/]+)$") == nil then
        return InvalidArgumentError("URL parameter was not formatted correctly: generateTextRequest.path.");
    else
        return (string.format("%s%s/cloud/v2/%s:generateText", getApisUrl(), getUrlPrefix(), (tostring(v48.path))));
    end;
end;
generateText = function(v49) --[[ Line: 402 ]] --[[ Name: generateText ]]
    -- upvalues: l_HttpService_0 (copy), l_OpenCloudService_0 (copy)
    if v49 == nil then
        return InvalidArgumentError("Request provided was nil.");
    else
        local v50 = verifyGenerateTextRequest(v49, "generateTextRequest");
        if v50 ~= nil then
            return v50;
        else
            local v51 = generateTextUrl(v49);
            if typeof(v51) ~= "string" then
                return v51;
            else
                local v52 = l_HttpService_0:JSONEncode(v49);
                return l_OpenCloudService_0:HttpRequestAsync({
                    Url = v51, 
                    Request_Type = "POST", 
                    Body = v52
                });
            end;
        end;
    end;
end;
l_OpenCloudService_0:RegisterOpenCloud("v2", "GenerateText", generateText);
verifyGetPlaceRequest = function(v53, v54) --[[ Line: 424 ]] --[[ Name: verifyGetPlaceRequest ]]
    if v53 == nil then
        return nil;
    else
        local v55 = verifyTable(v53, v54);
        if v55 ~= nil then
            return v55;
        elseif v53.path == nil then
            return InvalidArgumentError((("Required argument was not provided: %*.path."):format(v54)));
        else
            v55 = verifyString(v53.path, (("%*.path"):format(v54)));
            if v55 ~= nil then
                return v55;
            else
                return nil;
            end;
        end;
    end;
end;
getPlaceUrl = function(v56, v57) --[[ Line: 445 ]] --[[ Name: getPlaceUrl ]]
    if v56.path == nil then
        return InvalidArgumentError("URL parameter provided was nil: getPlaceRequest.path.");
    elseif string.match(v56.path, "^universes/([^/]+)/places/([^/]+)$") == nil then
        return InvalidArgumentError("URL parameter was not formatted correctly: getPlaceRequest.path.");
    else
        return (string.format("%s%s/cloud/v2/%s", getApisUrl(), getUrlPrefix(v57), (tostring(v56.path))));
    end;
end;
getPlace = function(v58, v59) --[[ Line: 458 ]] --[[ Name: getPlace ]]
    -- upvalues: l_OpenCloudService_0 (copy)
    if v58 == nil then
        return InvalidArgumentError("Request provided was nil.");
    else
        local v60 = verifyGetPlaceRequest(v58, "getPlaceRequest");
        if v60 ~= nil then
            return v60;
        else
            local v61 = getPlaceUrl(v58, v59);
            if typeof(v61) ~= "string" then
                return v61;
            else
                return l_OpenCloudService_0:HttpRequestAsync({
                    Url = v61, 
                    Request_Type = "GET", 
                    Headers = v59
                });
            end;
        end;
    end;
end;
l_OpenCloudService_0:RegisterOpenCloud("v2", "GetPlace", getPlace);
verifyGetGroupRequest = function(v62, v63) --[[ Line: 478 ]] --[[ Name: verifyGetGroupRequest ]]
    if v62 == nil then
        return nil;
    else
        local v64 = verifyTable(v62, v63);
        if v64 ~= nil then
            return v64;
        elseif v62.path == nil then
            return InvalidArgumentError((("Required argument was not provided: %*.path."):format(v63)));
        else
            v64 = verifyString(v62.path, (("%*.path"):format(v63)));
            if v64 ~= nil then
                return v64;
            else
                return nil;
            end;
        end;
    end;
end;
getGroupUrl = function(v65, v66) --[[ Line: 499 ]] --[[ Name: getGroupUrl ]]
    if v65.path == nil then
        return InvalidArgumentError("URL parameter provided was nil: getGroupRequest.path.");
    elseif string.match(v65.path, "^groups/([^/]+)$") == nil then
        return InvalidArgumentError("URL parameter was not formatted correctly: getGroupRequest.path.");
    else
        return (string.format("%s%s/cloud/v2/%s", getApisUrl(), getUrlPrefix(v66), (tostring(v65.path))));
    end;
end;
getGroup = function(v67, v68) --[[ Line: 512 ]] --[[ Name: getGroup ]]
    -- upvalues: l_OpenCloudService_0 (copy)
    if v67 == nil then
        return InvalidArgumentError("Request provided was nil.");
    else
        local v69 = verifyGetGroupRequest(v67, "getGroupRequest");
        if v69 ~= nil then
            return v69;
        else
            local v70 = getGroupUrl(v67, v68);
            if typeof(v70) ~= "string" then
                return v70;
            else
                return l_OpenCloudService_0:HttpRequestAsync({
                    Url = v70, 
                    Request_Type = "GET", 
                    Headers = v68
                });
            end;
        end;
    end;
end;
l_OpenCloudService_0:RegisterOpenCloud("v2", "GetGroup", getGroup);
verifyListInventoryItemsRequest = function(v71, v72) --[[ Line: 532 ]] --[[ Name: verifyListInventoryItemsRequest ]]
    if v71 == nil then
        return nil;
    else
        local v73 = verifyTable(v71, v72);
        if v73 ~= nil then
            return v73;
        elseif v71.parent == nil then
            return InvalidArgumentError((("Required argument was not provided: %*.parent."):format(v72)));
        else
            v73 = verifyString(v71.parent, (("%*.parent"):format(v72)));
            if v73 ~= nil then
                return v73;
            else
                v73 = verifyNumber(v71.maxPageSize, (("%*.maxPageSize"):format(v72)));
                if v73 ~= nil then
                    return v73;
                else
                    v73 = verifyString(v71.pageToken, (("%*.pageToken"):format(v72)));
                    if v73 ~= nil then
                        return v73;
                    else
                        v73 = verifyString(v71.filter, (("%*.filter"):format(v72)));
                        if v73 ~= nil then
                            return v73;
                        else
                            return nil;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
listInventoryItemsUrl = function(v74, v75) --[[ Line: 568 ]] --[[ Name: listInventoryItemsUrl ]]
    if v74.parent == nil then
        return InvalidArgumentError("URL parameter provided was nil: listInventoryItemsRequest.parent.");
    elseif string.match(v74.parent, "^users/([^/]+)$") == nil then
        return InvalidArgumentError("URL parameter was not formatted correctly: listInventoryItemsRequest.parent.");
    else
        local v76 = string.format("%s%s/cloud/v2/%s/inventory-items", getApisUrl(), getUrlPrefix(v75), (tostring(v74.parent)));
        if v74.maxPageSize == nil and v74.pageToken == nil and v74.filter == nil then
            return v76;
        else
            local v77 = {};
            if v74.maxPageSize ~= nil then
                table.insert(v77, string.format("maxPageSize=%s", (tostring(v74.maxPageSize))));
            end;
            if v74.pageToken ~= nil then
                table.insert(v77, string.format("pageToken=%s", (tostring(v74.pageToken))));
            end;
            if v74.filter ~= nil then
                table.insert(v77, string.format("filter=%s", (tostring(v74.filter))));
            end;
            return (string.format("%s?%s", v76, table.concat(v77, "&")));
        end;
    end;
end;
listInventoryItems = function(v78, v79) --[[ Line: 598 ]] --[[ Name: listInventoryItems ]]
    -- upvalues: l_OpenCloudService_0 (copy)
    if v78 == nil then
        return InvalidArgumentError("Request provided was nil.");
    else
        local v80 = verifyListInventoryItemsRequest(v78, "listInventoryItemsRequest");
        if v80 ~= nil then
            return v80;
        else
            local v81 = listInventoryItemsUrl(v78, v79);
            if typeof(v81) ~= "string" then
                return v81;
            else
                return l_OpenCloudService_0:HttpRequestAsync({
                    Url = v81, 
                    Request_Type = "GET", 
                    Headers = v79
                });
            end;
        end;
    end;
end;
l_OpenCloudService_0:RegisterOpenCloud("v2", "ListInventoryItems", listInventoryItems);
verifyListGroupMembershipsRequest = function(v82, v83) --[[ Line: 618 ]] --[[ Name: verifyListGroupMembershipsRequest ]]
    if v82 == nil then
        return nil;
    else
        local v84 = verifyTable(v82, v83);
        if v84 ~= nil then
            return v84;
        elseif v82.parent == nil then
            return InvalidArgumentError((("Required argument was not provided: %*.parent."):format(v83)));
        else
            v84 = verifyString(v82.parent, (("%*.parent"):format(v83)));
            if v84 ~= nil then
                return v84;
            else
                v84 = verifyNumber(v82.maxPageSize, (("%*.maxPageSize"):format(v83)));
                if v84 ~= nil then
                    return v84;
                else
                    v84 = verifyString(v82.pageToken, (("%*.pageToken"):format(v83)));
                    if v84 ~= nil then
                        return v84;
                    else
                        v84 = verifyString(v82.filter, (("%*.filter"):format(v83)));
                        if v84 ~= nil then
                            return v84;
                        else
                            return nil;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
listGroupMembershipsUrl = function(v85, v86) --[[ Line: 654 ]] --[[ Name: listGroupMembershipsUrl ]]
    if v85.parent == nil then
        return InvalidArgumentError("URL parameter provided was nil: listGroupMembershipsRequest.parent.");
    elseif string.match(v85.parent, "^groups/([^/]+)$") == nil then
        return InvalidArgumentError("URL parameter was not formatted correctly: listGroupMembershipsRequest.parent.");
    else
        local v87 = string.format("%s%s/cloud/v2/%s/memberships", getApisUrl(), getUrlPrefix(v86), (tostring(v85.parent)));
        if v85.maxPageSize == nil and v85.pageToken == nil and v85.filter == nil then
            return v87;
        else
            local v88 = {};
            if v85.maxPageSize ~= nil then
                table.insert(v88, string.format("maxPageSize=%s", (tostring(v85.maxPageSize))));
            end;
            if v85.pageToken ~= nil then
                table.insert(v88, string.format("pageToken=%s", (tostring(v85.pageToken))));
            end;
            if v85.filter ~= nil then
                table.insert(v88, string.format("filter=%s", (tostring(v85.filter))));
            end;
            return (string.format("%s?%s", v87, table.concat(v88, "&")));
        end;
    end;
end;
listGroupMemberships = function(v89, v90) --[[ Line: 684 ]] --[[ Name: listGroupMemberships ]]
    -- upvalues: l_OpenCloudService_0 (copy)
    if v89 == nil then
        return InvalidArgumentError("Request provided was nil.");
    else
        local v91 = verifyListGroupMembershipsRequest(v89, "listGroupMembershipsRequest");
        if v91 ~= nil then
            return v91;
        else
            local v92 = listGroupMembershipsUrl(v89, v90);
            if typeof(v92) ~= "string" then
                return v92;
            else
                return l_OpenCloudService_0:HttpRequestAsync({
                    Url = v92, 
                    Request_Type = "GET", 
                    Headers = v90
                });
            end;
        end;
    end;
end;
l_OpenCloudService_0:RegisterOpenCloud("v2", "ListGroupMemberships", listGroupMemberships);
verifyGetOperationRequest = function(v93, v94) --[[ Line: 704 ]] --[[ Name: verifyGetOperationRequest ]]
    if v93 == nil then
        return nil;
    else
        local v95 = verifyTable(v93, v94);
        if v95 ~= nil then
            return v95;
        elseif v93.path == nil then
            return InvalidArgumentError((("Required argument was not provided: %*.path."):format(v94)));
        else
            v95 = verifyString(v93.path, (("%*.path"):format(v94)));
            if v95 ~= nil then
                return v95;
            else
                return nil;
            end;
        end;
    end;
end;
getOperationUrl = function(v96, v97) --[[ Line: 725 ]] --[[ Name: getOperationUrl ]]
    if v96.path == nil then
        return InvalidArgumentError("URL parameter provided was nil: getOperationRequest.path.");
    elseif string.match(v96.path, "^users/([^/]+)/operations/([^/]+)$") == nil then
        return InvalidArgumentError("URL parameter was not formatted correctly: getOperationRequest.path.");
    else
        return (string.format("%s%s/cloud/v2/%s", getApisUrl(), getUrlPrefix(v97), (tostring(v96.path))));
    end;
end;
getOperation = function(v98, v99) --[[ Line: 738 ]] --[[ Name: getOperation ]]
    -- upvalues: l_OpenCloudService_0 (copy)
    if v98 == nil then
        return InvalidArgumentError("Request provided was nil.");
    else
        local v100 = verifyGetOperationRequest(v98, "getOperationRequest");
        if v100 ~= nil then
            return v100;
        else
            local v101 = getOperationUrl(v98, v99);
            if typeof(v101) ~= "string" then
                return v101;
            else
                return l_OpenCloudService_0:HttpRequestAsync({
                    Url = v101, 
                    Request_Type = "GET", 
                    Headers = v99
                });
            end;
        end;
    end;
end;
l_OpenCloudService_0:RegisterOpenCloud("v2", "GetOperation", getOperation);
verifyGenerateUserThumbnailRequest = function(v102, v103) --[[ Line: 758 ]] --[[ Name: verifyGenerateUserThumbnailRequest ]]
    if v102 == nil then
        return nil;
    else
        local v104 = verifyTable(v102, v103);
        if v104 ~= nil then
            return v104;
        elseif v102.path == nil then
            return InvalidArgumentError((("Required argument was not provided: %*.path."):format(v103)));
        else
            v104 = verifyString(v102.path, (("%*.path"):format(v103)));
            if v104 ~= nil then
                return v104;
            else
                v104 = verifyNumber(v102.size, (("%*.size"):format(v103)));
                if v104 ~= nil then
                    return v104;
                else
                    v104 = verifyEnum(v102.format, (("%*.format"):format(v103)));
                    if v104 ~= nil then
                        return v104;
                    else
                        v104 = verifyEnum(v102.shape, (("%*.shape"):format(v103)));
                        if v104 ~= nil then
                            return v104;
                        else
                            return nil;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
generateUserThumbnailUrl = function(v105, v106) --[[ Line: 794 ]] --[[ Name: generateUserThumbnailUrl ]]
    if v105.path == nil then
        return InvalidArgumentError("URL parameter provided was nil: generateUserThumbnailRequest.path.");
    elseif string.match(v105.path, "^users/([^/]+)$") == nil then
        return InvalidArgumentError("URL parameter was not formatted correctly: generateUserThumbnailRequest.path.");
    else
        local v107 = string.format("%s%s/cloud/v2/%s:generateThumbnail", getApisUrl(), getUrlPrefix(v106), (tostring(v105.path)));
        if v105.size == nil and v105.format == nil and v105.shape == nil then
            return v107;
        else
            local v108 = {};
            if v105.size ~= nil then
                table.insert(v108, string.format("size=%s", (tostring(v105.size))));
            end;
            if v105.format ~= nil then
                table.insert(v108, string.format("format=%s", (tostring(v105.format))));
            end;
            if v105.shape ~= nil then
                table.insert(v108, string.format("shape=%s", (tostring(v105.shape))));
            end;
            return (string.format("%s?%s", v107, table.concat(v108, "&")));
        end;
    end;
end;
generateUserThumbnail = function(v109, v110) --[[ Line: 824 ]] --[[ Name: generateUserThumbnail ]]
    -- upvalues: l_OpenCloudService_0 (copy)
    if v109 == nil then
        return InvalidArgumentError("Request provided was nil.");
    else
        local v111 = verifyGenerateUserThumbnailRequest(v109, "generateUserThumbnailRequest");
        if v111 ~= nil then
            return v111;
        else
            local v112 = generateUserThumbnailUrl(v109, v110);
            if typeof(v112) ~= "string" then
                return v112;
            else
                return l_OpenCloudService_0:HttpRequestAsync({
                    Url = v112, 
                    Request_Type = "GET", 
                    Headers = v110
                });
            end;
        end;
    end;
end;
l_OpenCloudService_0:RegisterOpenCloud("v2", "GenerateUserThumbnail", generateUserThumbnail);
l_OpenCloudService_0:RegistrationComplete();