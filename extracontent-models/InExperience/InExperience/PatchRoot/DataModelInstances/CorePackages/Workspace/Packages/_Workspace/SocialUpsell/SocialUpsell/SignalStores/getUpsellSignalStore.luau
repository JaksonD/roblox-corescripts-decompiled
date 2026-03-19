local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Signals);
local _ = require(l_script_FirstAncestor_0.Analytics.Enum.UpsellEntrySurfaceType);
local _ = require(l_script_FirstAncestor_0.Enum.SocialUpsellType);
local _ = require(l_script_FirstAncestor_0.Types);
local v7 = nil;
local function v29() --[[ Line: 37 ]] --[[ Name: createUpsellSignalStore ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v8 = {};
    local function _(v9) --[[ Line: 40 ]] --[[ Name: getOrCreateUpsellBannerDataStore ]]
        -- upvalues: v8 (copy), v3 (ref)
        local v10 = v8[v9];
        if v10 == nil then
            local v11, v12 = v3.createSignal(nil);
            v10 = {
                getBannerData = v11, 
                setBannerData = v12
            };
            v8[v9] = v10;
        end;
        return v10;
    end;
    local function v18(v14) --[[ Line: 53 ]] --[[ Name: getUpsellBannerDataGetter ]]
        -- upvalues: v8 (copy), v3 (ref)
        local v15 = v8[v14];
        if v15 == nil then
            local v16, v17 = v3.createSignal(nil);
            v15 = {
                getBannerData = v16, 
                setBannerData = v17
            };
            v8[v14] = v15;
        end;
        return v15.getBannerData;
    end;
    local function v28(v19, v20, v21) --[[ Line: 57 ]] --[[ Name: setUpsellBannerData ]]
        -- upvalues: v8 (copy), v3 (ref), v2 (ref)
        local v22 = v8[v19];
        if v22 == nil then
            local v23, v24 = v3.createSignal(nil);
            v22 = {
                getBannerData = v23, 
                setBannerData = v24
            };
            v8[v19] = v22;
        end;
        v22.setBannerData(function(v25) --[[ Line: 62 ]]
            -- upvalues: v21 (copy), v2 (ref), v20 (copy)
            local v26 = if v21 ~= nil then {
                isVisible = true
            } else v2.None;
            local v27 = v2.Dictionary.join(v25 or {}, {
                [v20] = v26
            });
            if next(v27) == nil then
                return nil;
            else
                return v27;
            end;
        end);
    end;
    return {
        getUpsellBannerDataGetter = v18, 
        setUpsellBannerData = v28
    };
end;
return function() --[[ Line: 75 ]]
    -- upvalues: v7 (ref), v3 (copy), v29 (copy)
    if v7 == nil then
        v7 = v3.createComputed(v29)(false);
    end;
    return v7;
end;