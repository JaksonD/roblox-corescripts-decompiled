local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_CapturesCommonNetworking_0 = require(l_Parent_0.Networking).CapturesCommonNetworking;
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactUtils);
local v5 = require(l_Parent_0.Enums.AssetType);
local v6 = require(l_Parent_0.Enums.ThumbnailState);
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v3.useEffect;
local l_useState_0 = v3.useState;
local v10 = game:DefineFastInt("ContentPostsThumbnailsInitialDelayTimeMs", 100);
local v11 = game:DefineFastInt("ContentPostsThumbnailsMaxRetries", 10);
local function v18(v12, v13, v14) --[[ Line: 20 ]] --[[ Name: makeThumbnailRequest ]]
    -- upvalues: l_CapturesCommonNetworking_0 (copy), v5 (copy), v6 (copy)
    return v12(l_CapturesCommonNetworking_0.GetThumbnailByAssetId.API({
        assetId = v13, 
        assetType = v5.Screenshot, 
        size = v14
    })):andThen(function(v15) --[[ Line: 26 ]]
        -- upvalues: v6 (ref)
        local v16 = v15.responseBody.data[1];
        if v16.imageUrl and v16.imageUrl ~= "" and v16.state == v6.Completed then
            return v16.imageUrl;
        else
            return nil;
        end;
    end):catch(function(_) --[[ Line: 38 ]]
        return nil;
    end):await();
end;
return function(v19, v20, v21) --[[ Line: 44 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useState_0 (copy), l_useEffect_0 (copy), v10 (copy), v11 (copy), v18 (copy)
    local v22 = l_useDispatch_0();
    local v23, v24 = l_useState_0("");
    local v25, v26 = l_useState_0(false);
    local v27 = tostring(v20) .. "x" .. tostring(v21);
    l_useEffect_0(function() --[[ Line: 52 ]]
        -- upvalues: v10 (ref), v11 (ref), v26 (copy), v24 (copy), v19 (copy), v18 (ref), v22 (copy), v27 (copy)
        local v28 = false;
        local l_v10_0 = v10;
        local l_v11_0 = v11;
        v26(false);
        v24("");
        if not v19 then
            return;
        else
            task.spawn(function() --[[ Line: 64 ]]
                -- upvalues: v28 (ref), l_v11_0 (ref), v18 (ref), v22 (ref), v19 (ref), v27 (ref), v24 (ref), v26 (ref), l_v10_0 (ref)
                while not v28 and l_v11_0 > 0 do
                    local v31, v32 = v18(v22, v19, v27);
                    if not v28 then
                        if v31 and v32 then
                            v24(v32);
                            v26(true);
                            return;
                        else
                            task.wait(l_v10_0 / 1000);
                            l_v10_0 = l_v10_0 * 2;
                            l_v11_0 = l_v11_0 - 1;
                        end;
                    else
                        break;
                    end;
                end;
            end);
            return function() --[[ Line: 84 ]]
                -- upvalues: v28 (ref)
                v28 = true;
            end;
        end;
    end, {
        v19, 
        v27
    });
    return v23, v25;
end;