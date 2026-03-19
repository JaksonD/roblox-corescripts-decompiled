local v0 = require(script.dependencies);
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.t);
local l_GetTokenGenerators_0 = v0.GetTokenGenerators;
local l_Validators_0 = v0.SchemaPackage.Validators;
local l_GetFoundationTokens_0 = v0.GetFoundationTokens;
local v6 = require(script.Types);
local v7 = require(script.Parent.Constants);
local function _(v8, v9) --[[ Line: 18 ]] --[[ Name: getPlatformScale ]]
    -- upvalues: v7 (copy)
    if v9 == nil then
        v9 = 1;
    end;
    v9 = math.clamp(v9, 0, 1e999);
    local v10 = 1;
    if v8 == v7.DeviceType.Console then
        v10 = 1.5;
    end;
    return v10 * v9;
end;
return {
    getTokens = function(v12, v13, v14) --[[ Line: 34 ]] --[[ Name: getTokens ]]
        -- upvalues: l_GetTokenGenerators_0 (copy), v7 (copy)
        local v15 = l_GetTokenGenerators_0(v13) or l_GetTokenGenerators_0(v7.DefaultThemeName);
        local l_v14_0 = v14;
        if l_v14_0 == nil then
            l_v14_0 = 1;
        end;
        l_v14_0 = math.clamp(l_v14_0, 0, 1e999);
        local v17 = 1;
        if v12 == v7.DeviceType.Console then
            v17 = 1.5;
        end;
        local v18 = v17 * l_v14_0;
        return {
            Global = require(v15.Global)(v18), 
            Semantic = require(v15.Semantic)(v18), 
            Component = require(v15.Component)(v18)
        };
    end, 
    validateTokens = v2.strictInterface({
        Global = v2.strictInterface(l_Validators_0.Global), 
        Semantic = v2.strictInterface(l_Validators_0.Semantic), 
        Component = v2.strictInterface(l_Validators_0.Component)
    }), 
    Types = v6, 
    getFoundationTokens = function(v19, v20, v21) --[[ Line: 50 ]] --[[ Name: getFoundationTokens ]]
        -- upvalues: l_GetFoundationTokens_0 (copy), v7 (copy)
        local v22 = l_GetFoundationTokens_0(v20) or l_GetFoundationTokens_0(v7.DefaultThemeName);
        local l_v21_0 = v21;
        if l_v21_0 == nil then
            l_v21_0 = 1;
        end;
        l_v21_0 = math.clamp(l_v21_0, 0, 1e999);
        local v24 = 1;
        if v19 == v7.DeviceType.Console then
            v24 = 1.5;
        end;
        return v22(v24 * l_v21_0);
    end, 
    getFoundationTokensDefaultScale = function(v25) --[[ Line: 56 ]] --[[ Name: getFoundationTokensDefaultScale ]]
        -- upvalues: l_GetFoundationTokens_0 (copy), v7 (copy)
        return (l_GetFoundationTokens_0(v25) or l_GetFoundationTokens_0(v7.DefaultThemeName))(1);
    end, 
    Mappers = require(script.mappers)
};