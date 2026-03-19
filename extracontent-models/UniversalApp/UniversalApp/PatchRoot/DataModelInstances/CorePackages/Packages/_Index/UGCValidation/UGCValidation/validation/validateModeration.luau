local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.Constants);
local v3 = require(l_Parent_0.util.getAssetCreationDetails);
local v4 = require(l_Parent_0.util.ParseContentIds);
local _ = require(l_Parent_0.util.Types);
local function v15(v6, v7, v8) --[[ Line: 11 ]] --[[ Name: validateUser ]]
    if not v6 or #v6 == 0 then
        return true;
    else
        local v9 = {};
        for _, v11 in ipairs(v6) do
            v9[tonumber(v11.id)] = true;
        end;
        for _, v13 in ipairs(v7) do
            if not v9[tonumber(v13.creatorTargetId)] then
                local v14 = v8[tostring(v13.assetId)];
                assert(v14);
                return false, {
                    string.format("Failed to validate current user owns %s.%s ( %s ). Make sure you own the assets being validated and try again.", v14.instance:GetFullName(), v14.fieldName, (tostring(v13.assetId)))
                };
            end;
        end;
        return true;
    end;
end;
return function(v16, v17, v18) --[[ Line: 45 ]] --[[ Name: validateModeration ]]
    -- upvalues: v4 (copy), v1 (copy), v3 (copy), v15 (copy), v2 (copy)
    if v18.isServer or v18.allowUnreviewedAssets then
        return true;
    else
        local v19 = {};
        local v20 = {};
        local v21, v22 = v4.parseWithErrorCheck(v20, v19, v16, nil, nil, v18);
        if not v21 then
            v1.reportFailure(v1.ErrorType.validateModeration_FailedToParse, nil, v18);
            return false, v22;
        else
            local v23 = {};
            local v24, v25 = v3(v20);
            if not v24 or #v25 ~= #v20 then
                v1.reportFailure(v1.ErrorType.validateModeration_CouldNotFetchModerationDetails, nil, v18);
                return false, {
                    string.format("Failed to fetch moderation results for %s. Make sure all assets are owned by the current user.", v16:GetFullName())
                };
            else
                local v26, v27 = v15(v17, v25, v19);
                if not v26 then
                    v1.reportFailure(v1.ErrorType.validateModeration_ValidateUser, nil, v18);
                    return v26, v27;
                else
                    for _, v29 in pairs(v25) do
                        if v29.status == v2.ASSET_STATUS.UNKNOWN or v29.status == v2.ASSET_STATUS.REVIEW_PENDING or v29.status == v2.ASSET_STATUS.MODERATED then
                            table.insert(v23, v29.assetId);
                        end;
                    end;
                    if #v23 > 0 then
                        local v30 = {};
                        for v31, v32 in pairs(v23) do
                            local v33 = v19[v32];
                            if v33 then
                                v30[v31] = string.format("%s.%s ( %s )", v33.instance:GetFullName(), v33.fieldName, v32);
                            else
                                v30[v31] = v32;
                            end;
                        end;
                        v1.reportFailure(v1.ErrorType.validateModeration_AssetsHaveNotPassedModeration, nil, v18);
                        return false, {
                            "Asset(s) failed to pass moderation:", 
                            unpack(v30)
                        };
                    else
                        return true;
                    end;
                end;
            end;
        end;
    end;
end;