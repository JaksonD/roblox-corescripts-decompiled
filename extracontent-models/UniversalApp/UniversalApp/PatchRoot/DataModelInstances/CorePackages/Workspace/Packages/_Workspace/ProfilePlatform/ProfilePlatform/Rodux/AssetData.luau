local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.Networking.NetworkingAsset);
return v2.createReducer({}, {
    [v4.GetAssetDetails.Succeeded.name] = function(v5, v6) --[[ Line: 27 ]]
        -- upvalues: v3 (copy)
        local l_responseBody_0 = v6.responseBody;
        local v8 = tostring(l_responseBody_0.assetId);
        return v3.Dictionary.join(v5, {
            [v8] = {
                assetId = l_responseBody_0.assetId, 
                displayName = l_responseBody_0.displayName, 
                assetType = l_responseBody_0.assetType
            }
        });
    end
});