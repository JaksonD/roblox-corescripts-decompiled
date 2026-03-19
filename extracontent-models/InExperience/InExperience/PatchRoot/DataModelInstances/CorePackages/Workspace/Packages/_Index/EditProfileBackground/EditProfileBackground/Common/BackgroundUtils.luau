local v0 = require(script.Parent.Constants);
local v1 = v0.DEFAULT_BACKGROUND_ASSET_IDS[1];
local v2 = v0.DEFAULT_BACKGROUND_ASSET_IDS[2];
return {
    getDisplayBackgroundId = function(v3, v4) --[[ Line: 8 ]] --[[ Name: getDisplayBackgroundId ]]
        -- upvalues: v1 (copy), v2 (copy)
        if not v3 or v3 == -1 then
            if v4 == "dark" then
                return v1;
            else
                return v2;
            end;
        else
            return v3;
        end;
    end
};