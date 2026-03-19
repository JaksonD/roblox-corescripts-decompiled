local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UserLib);
local v4 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_useLazyFmod_0 = require(l_Parent_0.MediaPlayback).useLazyFmod;
local v8 = require(l_script_FirstAncestor_0.Components.Videos.VideoTile);
local v9 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local v10 = require(l_script_FirstAncestor_0.Common.Enums);
local v11 = require(l_script_FirstAncestor_0.Common.Constants);
local v12 = require(l_script_FirstAncestor_0.Networking.NetworkingAsset);
local l_Constants_0 = v3.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v3.Utils.getRbxthumbWithTypeSizeAndOptions;
return function(v15) --[[ Line: 27 ]]
    -- upvalues: v9 (copy), v10 (copy), l_useDispatch_0 (copy), l_useLazyFmod_0 (copy), l_useSelector_0 (copy), v11 (copy), v2 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy), v12 (copy), v8 (copy)
    local v16 = v9(v10.Components.Videos);
    local v17 = l_useDispatch_0();
    l_useLazyFmod_0();
    local v18 = {};
    if v16 and v16.assetIds and #v16.assetIds > 0 then
        v18 = v16.assetIds;
    end;
    local v20 = l_useSelector_0(function(v19) --[[ Line: 45 ]]
        -- upvalues: v11 (ref)
        return v19[v11.RODUX_KEY].AssetData or {};
    end);
    local v25 = v2.useMemo(function() --[[ Line: 49 ]]
        -- upvalues: v18 (ref), v20 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), l_Constants_0 (ref)
        local v21 = {};
        for _, v23 in v18 do
            local v24 = v20[tostring(v23)];
            if v24 then
                table.insert(v21, {
                    videoId = "rbxassetid://" .. tostring(v23), 
                    title = v24.displayName or "", 
                    thumbnailImage = l_getRbxthumbWithTypeSizeAndOptions_0(tostring(v23), l_Constants_0.RbxthumbTypes.Asset, 150)
                });
            end;
        end;
        return v21;
    end, {
        v18, 
        v20
    });
    v2.useEffect(function() --[[ Line: 69 ]]
        -- upvalues: v18 (ref), v20 (copy), v17 (copy), v12 (ref)
        for _, v27 in v18 do
            if not v20[tostring(v27)] then
                v17(v12.GetAssetDetails.API((tostring(v27)))):catch(function() --[[ Line: 72 ]]

                end);
            end;
        end;
    end, {
        v18, 
        v20
    });
    if #v25 == 0 then
        return v2.None;
    else
        return v2.createElement(v8, {
            layoutOrder = v15.layoutOrder, 
            videos = v25
        });
    end;
end;