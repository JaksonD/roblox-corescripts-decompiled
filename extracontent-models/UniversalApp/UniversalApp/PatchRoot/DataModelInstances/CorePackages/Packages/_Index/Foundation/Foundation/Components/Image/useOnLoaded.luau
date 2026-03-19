local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactIs);
local l_ContentProvider_0 = require(l_script_FirstAncestor_0.Utility.Wrappers).Services.ContentProvider;
local _ = require(l_script_FirstAncestor_0.Components.Types);
local function _(v6) --[[ Line: 21 ]] --[[ Name: isFinalAssetFetchStatus ]]
    local v7 = true;
    if v6 ~= Enum.AssetFetchStatus.Success then
        v7 = true;
        if v6 ~= Enum.AssetFetchStatus.Failure then
            v7 = v6 == Enum.AssetFetchStatus.TimedOut;
        end;
    end;
    return v7;
end;
local function v15(v9, v10) --[[ Line: 27 ]] --[[ Name: attachOnLoaded ]]
    -- upvalues: l_ContentProvider_0 (copy)
    if v9 == nil then
        return;
    else
        local l_l_ContentProvider_0_AssetFetchStatus_0 = l_ContentProvider_0:GetAssetFetchStatus(v9);
        local v12 = true;
        if l_l_ContentProvider_0_AssetFetchStatus_0 ~= Enum.AssetFetchStatus.Success then
            v12 = true;
            if l_l_ContentProvider_0_AssetFetchStatus_0 ~= Enum.AssetFetchStatus.Failure then
                v12 = l_l_ContentProvider_0_AssetFetchStatus_0 == Enum.AssetFetchStatus.TimedOut;
            end;
        end;
        if v12 then
            v10(l_l_ContentProvider_0_AssetFetchStatus_0);
            return;
        else
            return l_ContentProvider_0:GetAssetFetchStatusChangedSignal(v9):Connect(function(v13) --[[ Line: 41 ]]
                -- upvalues: v10 (copy)
                local v14 = true;
                if v13 ~= Enum.AssetFetchStatus.Success then
                    v14 = true;
                    if v13 ~= Enum.AssetFetchStatus.Failure then
                        v14 = v13 == Enum.AssetFetchStatus.TimedOut;
                    end;
                end;
                if v14 then
                    v10(v13);
                end;
            end);
        end;
    end;
end;
return function(v16, v17) --[[ Line: 48 ]] --[[ Name: useOnLoaded ]]
    -- upvalues: v2 (copy), v3 (copy), v15 (copy)
    v2.useEffect(function() --[[ Line: 49 ]]
        -- upvalues: v17 (copy), v3 (ref), v16 (copy), v15 (ref), v2 (ref)
        if not v17 then
            return;
        else
            local v18 = nil;
            local function _() --[[ Line: 55 ]] --[[ Name: disconnectConnection ]]
                -- upvalues: v18 (ref)
                if v18 then
                    v18:Disconnect();
                    v18 = nil;
                end;
            end;
            local function v21(v20) --[[ Line: 62 ]] --[[ Name: handleFinalStatus ]]
                -- upvalues: v18 (ref), v17 (ref)
                if v18 then
                    v18:Disconnect();
                    v18 = nil;
                end;
                v17(v20);
            end;
            if v3.isBinding(v16) then
                local l_v16_0 = v16;
                v18 = v15(l_v16_0:getValue(), v21);
                local v24 = v2.__subscribeToBinding(l_v16_0, function(v23) --[[ Line: 71 ]]
                    -- upvalues: v18 (ref), v15 (ref), v21 (copy)
                    if v18 then
                        v18:Disconnect();
                        v18 = nil;
                    end;
                    v18 = v15(v23, v21);
                end);
                return function() --[[ Line: 76 ]]
                    -- upvalues: v24 (copy), v18 (ref)
                    v24();
                    if v18 then
                        v18:Disconnect();
                        v18 = nil;
                    end;
                end;
            else
                v18 = v15(v16, v21);
                return function() --[[ Line: 84 ]]
                    -- upvalues: v18 (ref)
                    if v18 then
                        v18:Disconnect();
                        v18 = nil;
                    end;
                end;
            end;
        end;
    end, {
        v16, 
        v17
    });
end;