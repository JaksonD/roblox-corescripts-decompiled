local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Promise);
game:DefineFastInt("UGCValidationCanPublishRequestPageSize", 50);
game:DefineFastInt("UGCValidationMaxAssetSizeAllowed", 500);
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.util.APIUtil);
local _ = require(l_Parent_0.util.Types);
local l_HttpService_0 = game:GetService("HttpService");
local v6 = v3.getBaseDomain();
local v7 = string.format("https://apis.%s", v6);
local l_game_FastInt_0 = game:GetFastInt("UGCValidationCanPublishRequestPageSize");
local l_game_FastInt_1 = game:GetFastInt("UGCValidationMaxAssetSizeAllowed");
local v10 = require(l_Parent_0.Constants);
local v11 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v12 = require(l_Parent_0.flags.getFStringUGCValidationReferenceMeshIdWhitelistForIEC);
local function v16() --[[ Line: 34 ]] --[[ Name: getWhitelistIds ]]
    -- upvalues: v12 (copy)
    local v13 = {};
    local v14 = v12();
    if #v14 == 0 then
        return v13;
    else
        for v15 in string.gmatch(v14, "([^,%s]+)") do
            v13[v15] = true;
        end;
        return v13;
    end;
end;
local function _(v17, v18, v19, v20, v21) --[[ Line: 48 ]] --[[ Name: createCanPublishPromise ]]
    -- upvalues: v1 (copy), l_HttpService_0 (copy), v10 (copy)
    if #v18 == 0 then
        return v1.resolve();
    else
        return v1.new(function(v22, v23) --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), v18 (copy), v19 (copy), v21 (copy), v17 (copy), v10 (ref), v20 (copy)
            local v24 = l_HttpService_0:JSONEncode({
                assetIds = v18, 
                restrictedEntities = v19, 
                universeId = v21
            });
            l_HttpService_0:RequestInternal({
                Url = v17, 
                Method = "POST", 
                Body = v24, 
                Headers = {
                    [v10.ExperienceAuthHeaderKey] = v20, 
                    [v10.ContentType] = v10.ApplicationJson
                }
            }):Start(function(v25, v26) --[[ Line: 69 ]]
                -- upvalues: l_HttpService_0 (ref), v22 (copy), v23 (copy)
                if v25 and v26.StatusCode == 200 then
                    local v27 = l_HttpService_0:JSONDecode(v26.Body);
                    v22(v27);
                    return;
                else
                    v23();
                    return;
                end;
            end);
        end);
    end;
end;
return function(v29, v30) --[[ Line: 81 ]] --[[ Name: validateAssetCreator ]]
    -- upvalues: v7 (copy), v11 (copy), l_game_FastInt_1 (copy), v2 (copy), l_game_FastInt_0 (copy), v1 (copy), l_HttpService_0 (copy), v10 (copy), v12 (copy), v16 (copy)
    local l_isServer_0 = v30.isServer;
    local v32 = if v30.restrictedUserIds then v30.restrictedUserIds else {};
    local l_token_0 = v30.token;
    local l_universeId_0 = v30.universeId;
    local v35 = v7 .. (l_isServer_0 and "packages-api/v1/rcc/canPublish" or "packages-api/v1/canPublish");
    local v36 = {
        User = {}, 
        Group = {}
    };
    local v37 = v11.new();
    local v38 = {};
    local v39 = {};
    local v40 = 0;
    for _, v42 in ipairs(v32) do
        v36[v42.creatorType][tonumber(v42.id)] = true;
    end;
    for v43, _ in v29 do
        if not v38[v43] then
            v40 = v40 + 1;
            v38[v43] = true;
        end;
    end;
    if l_game_FastInt_1 < v40 then
        v2.reportFailure(v2.ErrorType.validateAssetCreator_TooManyDependencies, nil, v30);
        return false, {
            "Upload of model has too many children assets (Meshes, Textures, etc.) and cannot be processed as is. You need to rearrange the model."
        };
    else
        local v45 = {};
        for v46, _ in v38 do
            table.insert(v45, v46);
            if #v45 >= l_game_FastInt_0 then
                local l_v45_0 = v45;
                table.insert(v39, if #l_v45_0 == 0 then v1.resolve() else v1.new(function(v49, v50) --[[ Line: 52 ]]
                    -- upvalues: l_HttpService_0 (ref), l_v45_0 (copy), v32 (copy), l_universeId_0 (copy), v35 (copy), v10 (ref), l_token_0 (copy)
                    local v51 = l_HttpService_0:JSONEncode({
                        assetIds = l_v45_0, 
                        restrictedEntities = v32, 
                        universeId = l_universeId_0
                    });
                    l_HttpService_0:RequestInternal({
                        Url = v35, 
                        Method = "POST", 
                        Body = v51, 
                        Headers = {
                            [v10.ExperienceAuthHeaderKey] = l_token_0, 
                            [v10.ContentType] = v10.ApplicationJson
                        }
                    }):Start(function(v52, v53) --[[ Line: 69 ]]
                        -- upvalues: l_HttpService_0 (ref), v49 (copy), v50 (copy)
                        if v52 and v53.StatusCode == 200 then
                            local v54 = l_HttpService_0:JSONDecode(v53.Body);
                            v49(v54);
                            return;
                        else
                            v50();
                            return;
                        end;
                    end);
                end));
                v45 = {};
            end;
        end;
        if #v45 > 0 then
            local l_v45_1 = v45;
            local l_l_v45_1_0 = l_v45_1 --[[ copy: 14 -> 30 ]];
            table.insert(v39, if #l_v45_1 == 0 then v1.resolve() else v1.new(function(v57, v58) --[[ Line: 52 ]]
                -- upvalues: l_HttpService_0 (ref), l_l_v45_1_0 (copy), v32 (copy), l_universeId_0 (copy), v35 (copy), v10 (ref), l_token_0 (copy)
                local v59 = l_HttpService_0:JSONEncode({
                    assetIds = l_l_v45_1_0, 
                    restrictedEntities = v32, 
                    universeId = l_universeId_0
                });
                l_HttpService_0:RequestInternal({
                    Url = v35, 
                    Method = "POST", 
                    Body = v59, 
                    Headers = {
                        [v10.ExperienceAuthHeaderKey] = l_token_0, 
                        [v10.ContentType] = v10.ApplicationJson
                    }
                }):Start(function(v60, v61) --[[ Line: 69 ]]
                    -- upvalues: l_HttpService_0 (ref), v57 (copy), v58 (copy)
                    if v60 and v61.StatusCode == 200 then
                        local v62 = l_HttpService_0:JSONDecode(v61.Body);
                        v57(v62);
                        return;
                    else
                        v58();
                        return;
                    end;
                end);
            end));
        end;
        local v63, v64 = v1.all(v39):await();
        if not v63 then
            v2.reportFailure(v2.ErrorType.validateAssetCreator_FailedToLoad, nil, v30);
            return false, {
                "Failed to load detailed information for model assets. Make sure all model assets exist and try again."
            };
        else
            local v65 = v12() ~= "";
            local v66 = if v65 then v16() else {};
            for _, v68 in v64 do
                local l_result_0 = v68.result;
                for v70, v71 in pairs(l_result_0) do
                    local l_v71_0 = v71;
                    if v65 then
                        l_v71_0 = v71 or v66[v70];
                    end;
                    if not l_v71_0 then
                        v2.reportFailure(v2.ErrorType.validateAssetCreator_DependencyNotOwnedByCreator, nil, v30);
                    end;
                    local v73 = v29[v70];
                    v37:updateReasons(l_v71_0, {
                        (string.format("%s.%s ( %s ) being used is not owned by the experience creator or player. You can only publish assets that you own.", v73.instance:GetFullName(), v73.fieldName, v70))
                    });
                end;
            end;
            return v37:getFinalResults();
        end;
    end;
end;