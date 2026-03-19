local l_script_FirstAncestor_0 = script:FindFirstAncestor("Http");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Thumbnail_0 = require(l_script_FirstAncestor_0.Models).Thumbnail;
local v3 = require(l_script_FirstAncestor_0.PerformFetch);
local v4 = require(l_Parent_0.ArgCheck);
local v5 = require(l_Parent_0.Promise);
local v6 = require(l_Parent_0.Result);
local v7 = require(l_Parent_0.tutils);
local v8 = math.max(0, tonumber(settings():GetFVariable("LuaAppNonFinalThumbnailMaxRetries")) or 0);
local v9 = math.max(0, tonumber(settings():GetFVariable("LuaAppThumbnailsApiRetryTimeMultiplier")) or 0);
local v35 = {
    _fetchIcons = function(v10, v11, v12, v13, v14, v15, v16, v17) --[[ Line: 20 ]] --[[ Name: _fetchIcons ]]
        -- upvalues: v6 (copy), l_Thumbnail_0 (copy), v5 (copy)
        local function _(v18) --[[ Line: 30 ]] --[[ Name: keyMapperForCurrentRequestNameAndSize ]]
            -- upvalues: v14 (copy), v15 (copy), v13 (copy)
            return v14({
                targetId = v18, 
                requestName = v15, 
                iconSize = v13
            });
        end;
        local function v24(v20) --[[ Line: 38 ]] --[[ Name: getTableOfFailedResults ]]
            -- upvalues: v14 (copy), v15 (copy), v13 (copy), v6 (ref)
            local v21 = {};
            for _, v23 in pairs(v20) do
                v21[v14({
                    targetId = v23, 
                    requestName = v15, 
                    iconSize = v13
                })] = v6.new(false, {
                    targetId = v23
                });
            end;
            return v21;
        end;
        return v16(v11, v12, v13):andThen(function(v25) --[[ Line: 49 ]]
            -- upvalues: v24 (copy), v12 (copy), l_Thumbnail_0 (ref), v13 (copy), v14 (copy), v15 (copy), v6 (ref), v10 (copy), v17 (copy), v5 (ref)
            local v26 = v24(v12);
            local v27 = {};
            local v28 = v25 and v25.responseBody and v25.responseBody.data;
            if typeof(v28) == "table" then
                for _, v30 in pairs(v28) do
                    if l_Thumbnail_0.isCompleteThumbnailData(v30) then
                        local v31 = tostring(v30.targetId);
                        local v32 = false;
                        if l_Thumbnail_0.checkStateIsFinal(v30.state) then
                            v27[v31] = l_Thumbnail_0.fromThumbnailData(v30, v13);
                            v32 = true;
                        end;
                        v26[v14({
                            targetId = v31, 
                            requestName = v15, 
                            iconSize = v13
                        })] = v6.new(v32, v30);
                    end;
                end;
            end;
            v10:dispatch(v17(v27));
            return v5.resolve(v26);
        end, function(_) --[[ Line: 69 ]]
            -- upvalues: v24 (copy), v12 (copy), v5 (ref)
            local v34 = v24(v12);
            return v5.resolve(v34);
        end);
    end
};
v35._fetch = function(v36, v37, v38, v39, v40, v41, v42, v43) --[[ Line: 75 ]] --[[ Name: _fetch ]]
    -- upvalues: v35 (copy), v8 (ref), v9 (ref), l_Thumbnail_0 (copy), v7 (copy), v5 (copy)
    return v35._fetchIcons(v36, v37, v38, v39, v40, v41, v42, v43):andThen(function(v44) --[[ Line: 95 ]]
        -- upvalues: v8 (ref), v9 (ref), l_Thumbnail_0 (ref), v7 (ref), v5 (ref), v35 (ref), v36 (copy), v37 (copy), v38 (copy), v39 (copy), v40 (copy), v41 (copy), v42 (copy), v43 (copy)
        local v45 = {};
        local l_v44_0 = v44;
        if _G.__TESTEZ_RUNNING_TEST__ then
            v8 = 1;
            v9 = 0.001;
        end;
        local function v47(v48) --[[ Line: 104 ]] --[[ Name: retry ]]
            -- upvalues: l_v44_0 (ref), l_Thumbnail_0 (ref), v45 (copy), v7 (ref), v5 (ref), v9 (ref), v35 (ref), v36 (ref), v37 (ref), v38 (ref), v39 (ref), v40 (ref), v41 (ref), v42 (ref), v43 (ref), v47 (copy)
            local v49 = {};
            for v50, v51 in pairs(l_v44_0) do
                local v52, v53 = v51:unwrap();
                if v52 and l_Thumbnail_0.checkStateIsFinal(v53.state) then
                    v45[v50] = v51;
                else
                    table.insert(v49, v53);
                end;
            end;
            if v7.fieldCount(v49) == 0 then
                return v5.resolve(v45);
            else
                return v5.new(function(v54, _) --[[ Line: 122 ]]
                    -- upvalues: v9 (ref), v48 (copy)
                    coroutine.wrap(function() --[[ Line: 123 ]]
                        -- upvalues: v9 (ref), v48 (ref), v54 (copy)
                        wait(v9 * math.pow(2, v48 - 1));
                        v54();
                    end)();
                end):andThen(function() --[[ Line: 130 ]]
                    -- upvalues: v35 (ref), v36 (ref), v37 (ref), v38 (ref), v39 (ref), v40 (ref), v41 (ref), v42 (ref), v43 (ref)
                    return v35._fetchIcons(v36, v37, v38, v39, v40, v41, v42, v43);
                end):andThen(function(v56) --[[ Line: 142 ]]
                    -- upvalues: l_v44_0 (ref), v48 (copy), v47 (ref), v5 (ref), v45 (ref)
                    l_v44_0 = v56;
                    if v48 > 1 then
                        return v47(v48 - 1);
                    else
                        return v5.resolve(v45);
                    end;
                end);
            end;
        end;
        return v47(v8);
    end);
end;
v35.Fetch = function(v57, v58, v59, v60, v61, v62) --[[ Line: 156 ]] --[[ Name: Fetch ]]
    -- upvalues: v4 (copy), v35 (copy), v3 (copy)
    v4.isType(v58, "table", "requests");
    v4.isType(v60, "string", "requestName");
    v4.isNonNegativeNumber(#v58, "requests count");
    v35.KeyMapper = v59;
    return v3.Batch(v58, v59, function(v63, v64) --[[ Line: 162 ]]
        -- upvalues: v35 (ref), v57 (copy), v59 (copy), v60 (copy), v61 (copy), v62 (copy)
        local v65 = {};
        local v66 = nil;
        for _, v68 in ipairs(v64) do
            local l_targetId_0 = v68.targetId;
            v66 = v68.iconSize;
            table.insert(v65, l_targetId_0);
        end;
        return v35._fetch(v63, v57, v65, v66, v59, v60, v61, v62);
    end);
end;
return v35;