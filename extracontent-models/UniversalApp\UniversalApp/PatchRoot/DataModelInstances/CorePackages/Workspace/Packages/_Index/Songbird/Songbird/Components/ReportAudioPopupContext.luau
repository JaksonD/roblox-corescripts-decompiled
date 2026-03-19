local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local l_useState_0 = v2.useState;
local l_useCallback_0 = v2.useCallback;
local v5 = v2.createContext(nil);
local function v6() --[[ Line: 28 ]] --[[ Name: noOp ]]

end;
local v7 = {
    value = {
        assetId = nil, 
        isVisible = false, 
        setVisibility = v6, 
        setAssetId = v6
    }
};
return {
    Context = v5, 
    Provider = function(v8) --[[ Line: 41 ]]
        -- upvalues: v1 (copy), v7 (copy), l_useState_0 (copy), l_useCallback_0 (copy), v2 (copy), v5 (copy)
        local v9 = v1.Dictionary.join(v7, v8);
        local l_isVisible_0 = v9.value.isVisible;
        local v11, v12 = l_useState_0(l_isVisible_0);
        local v14 = l_useCallback_0(function(v13) --[[ Line: 47 ]]
            -- upvalues: v11 (copy), v12 (copy)
            if v11 ~= v13 then
                v12(v13);
            end;
        end, {
            v11
        });
        local v15, v16 = l_useState_0(nil);
        local v18 = l_useCallback_0(function(v17) --[[ Line: 54 ]]
            -- upvalues: v15 (copy), v16 (copy)
            if v15 ~= v17 then
                v16(v17);
            end;
        end, {
            v15
        });
        return v2.createElement(v5.Provider, {
            value = {
                isVisible = v11, 
                setVisibility = v14, 
                assetId = v15, 
                setAssetId = v18
            }
        }, v9.children);
    end, 
    use = function() --[[ Line: 70 ]] --[[ Name: use ]]
        -- upvalues: v2 (copy), v5 (copy)
        local v19 = v2.useContext(v5);
        if v19 then
            return v19;
        else
            error("attempt to use ReportAudioPopupContext with no provider. Add `ReportAudioPopupContext.Provider` to the React tree and try again");
            return;
        end;
    end
};