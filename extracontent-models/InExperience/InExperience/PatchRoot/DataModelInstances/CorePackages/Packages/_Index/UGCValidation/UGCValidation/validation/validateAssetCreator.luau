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
local v12 = require(l_Parent_0.flags.getFFlagFixPackageIDFieldName);
local v13 = require(l_Parent_0.flags.getFStringUGCValidationReferenceMeshIdWhitelistForIEC);
local function v17() --[[ Line: 35 ]] --[[ Name: getWhitelistIds ]]
    -- upvalues: v13 (copy)
    local v14 = {};
    local v15 = v13();
    if #v15 == 0 then
        return v14;
    else
        for v16 in string.gmatch(v15, "([^,%s]+)") do
            v14[v16] = true;
        end;
        return v14;
    end;
end;
local function _(v18, v19, v20, v21, v22) --[[ Line: 49 ]] --[[ Name: createCanPublishPromise ]]
    -- upvalues: v1 (copy), l_HttpService_0 (copy), v10 (copy)
    if #v19 == 0 then
        return v1.resolve();
    else
        return v1.new(function(v23, v24) --[[ Line: 53 ]]
            -- upvalues: l_HttpService_0 (ref), v19 (copy), v20 (copy), v22 (copy), v18 (copy), v10 (ref), v21 (copy)
            local v25 = l_HttpService_0:JSONEncode({
                assetIds = v19, 
                restrictedEntities = v20, 
                universeId = v22
            });
            l_HttpService_0:RequestInternal({
                Url = v18, 
                Method = "POST", 
                Body = v25, 
                Headers = {
                    [v10.ExperienceAuthHeaderKey] = v21, 
                    [v10.ContentType] = v10.ApplicationJson
                }
            }):Start(function(v26, v27) --[[ Line: 70 ]]
                -- upvalues: l_HttpService_0 (ref), v23 (copy), v24 (copy)
                if v26 and v27.StatusCode == 200 then
                    local v28 = l_HttpService_0:JSONDecode(v27.Body);
                    v23(v28);
                    return;
                else
                    v24();
                    return;
                end;
            end);
        end);
    end;
end;
return function(v30, v31) --[[ Line: 82 ]] --[[ Name: validateAssetCreator ]]
    -- upvalues: v7 (copy), v11 (copy), l_game_FastInt_1 (copy), v2 (copy), v12 (copy), l_game_FastInt_0 (copy), v1 (copy), l_HttpService_0 (copy), v10 (copy), v13 (copy), v17 (copy)
    local l_isServer_0 = v31.isServer;
    local v33 = if v31.restrictedUserIds then v31.restrictedUserIds else {};
    local l_token_0 = v31.token;
    local l_universeId_0 = v31.universeId;
    local v36 = v7 .. (l_isServer_0 and "packages-api/v1/rcc/canPublish" or "packages-api/v1/canPublish");
    local v37 = {
        User = {}, 
        Group = {}
    };
    local v38 = v11.new();
    local v39 = {};
    local v40 = {};
    local v41 = 0;
    for _, v43 in ipairs(v33) do
        v37[v43.creatorType][tonumber(v43.id)] = true;
    end;
    for v44, _ in v30 do
        if not v39[v44] then
            v41 = v41 + 1;
            v39[v44] = true;
        end;
    end;
    if l_game_FastInt_1 < v41 then
        v2.reportFailure(v2.ErrorType.validateAssetCreator_TooManyDependencies, nil, v31);
        return false, {
            "Upload of model has too many children assets (Meshes, Textures, etc.) and cannot be processed as is. You need to rearrange the model."
        };
    else
        local v46 = {};
        for v47, _ in v39 do
            if not v12() or v47 ~= 0 then
                table.insert(v46, v47);
                if #v46 >= l_game_FastInt_0 then
                    local l_v46_0 = v46;
                    table.insert(v40, if #l_v46_0 == 0 then v1.resolve() else v1.new(function(v50, v51) --[[ Line: 53 ]]
                        -- upvalues: l_HttpService_0 (ref), l_v46_0 (copy), v33 (copy), l_universeId_0 (copy), v36 (copy), v10 (ref), l_token_0 (copy)
                        local v52 = l_HttpService_0:JSONEncode({
                            assetIds = l_v46_0, 
                            restrictedEntities = v33, 
                            universeId = l_universeId_0
                        });
                        l_HttpService_0:RequestInternal({
                            Url = v36, 
                            Method = "POST", 
                            Body = v52, 
                            Headers = {
                                [v10.ExperienceAuthHeaderKey] = l_token_0, 
                                [v10.ContentType] = v10.ApplicationJson
                            }
                        }):Start(function(v53, v54) --[[ Line: 70 ]]
                            -- upvalues: l_HttpService_0 (ref), v50 (copy), v51 (copy)
                            if v53 and v54.StatusCode == 200 then
                                local v55 = l_HttpService_0:JSONDecode(v54.Body);
                                v50(v55);
                                return;
                            else
                                v51();
                                return;
                            end;
                        end);
                    end));
                    v46 = {};
                end;
            end;
        end;
        if #v46 > 0 then
            local l_v46_1 = v46;
            local l_l_v46_1_0 = l_v46_1 --[[ copy: 14 -> 30 ]];
            table.insert(v40, if #l_v46_1 == 0 then v1.resolve() else v1.new(function(v58, v59) --[[ Line: 53 ]]
                -- upvalues: l_HttpService_0 (ref), l_l_v46_1_0 (copy), v33 (copy), l_universeId_0 (copy), v36 (copy), v10 (ref), l_token_0 (copy)
                local v60 = l_HttpService_0:JSONEncode({
                    assetIds = l_l_v46_1_0, 
                    restrictedEntities = v33, 
                    universeId = l_universeId_0
                });
                l_HttpService_0:RequestInternal({
                    Url = v36, 
                    Method = "POST", 
                    Body = v60, 
                    Headers = {
                        [v10.ExperienceAuthHeaderKey] = l_token_0, 
                        [v10.ContentType] = v10.ApplicationJson
                    }
                }):Start(function(v61, v62) --[[ Line: 70 ]]
                    -- upvalues: l_HttpService_0 (ref), v58 (copy), v59 (copy)
                    if v61 and v62.StatusCode == 200 then
                        local v63 = l_HttpService_0:JSONDecode(v62.Body);
                        v58(v63);
                        return;
                    else
                        v59();
                        return;
                    end;
                end);
            end));
        end;
        local v64, v65 = v1.all(v40):await();
        if not v64 then
            v2.reportFailure(v2.ErrorType.validateAssetCreator_FailedToLoad, nil, v31);
            return false, {
                "Failed to load detailed information for model assets. Make sure all model assets exist and try again."
            };
        else
            local v66 = v13() ~= "";
            local v67 = if v66 then v17() else {};
            for _, v69 in v65 do
                local l_result_0 = v69.result;
                for v71, v72 in pairs(l_result_0) do
                    local l_v72_0 = v72;
                    if v66 then
                        l_v72_0 = v72 or v67[v71];
                    end;
                    if not l_v72_0 then
                        v2.reportFailure(v2.ErrorType.validateAssetCreator_DependencyNotOwnedByCreator, nil, v31);
                    end;
                    local v74 = v30[v71];
                    v38:updateReasons(l_v72_0, {
                        (string.format("%s.%s ( %s ) being used is not owned by the experience creator or player. You can only publish assets that you own.", v74.instance:GetFullName(), v74.fieldName, v71))
                    });
                end;
            end;
            return v38:getFinalResults();
        end;
    end;
end;