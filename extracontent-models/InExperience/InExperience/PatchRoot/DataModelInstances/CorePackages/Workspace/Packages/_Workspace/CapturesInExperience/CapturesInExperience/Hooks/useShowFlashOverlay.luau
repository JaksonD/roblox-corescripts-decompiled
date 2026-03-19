local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.RoactUtils);
local v4 = require(l_Parent_0.Constants);
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local function v6() --[[ Line: 19 ]]
    -- upvalues: l_AppStorageService_0 (copy), v4 (copy)
    pcall(function() --[[ Line: 20 ]]
        -- upvalues: l_AppStorageService_0 (ref), v4 (ref)
        l_AppStorageService_0:SetItem(v4.LastFlashOccurrenceTsLocalStorageKey, (tostring(DateTime.now().UnixTimestampMillis)));
        l_AppStorageService_0:Flush();
    end);
end;
return function(v7) --[[ Line: 29 ]]
    -- upvalues: l_AppStorageService_0 (copy), l_useSelector_0 (copy), v4 (copy), v6 (copy)
    local v8 = v7 or l_AppStorageService_0;
    if not l_useSelector_0(function(v9) --[[ Line: 32 ]]
        -- upvalues: v4 (ref)
        return v9[v4.RoduxKey].IsOverlayFlashActive;
    end) then
        return false, v6;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 40 ]]
            -- upvalues: v8 (copy), v4 (ref)
            return v8:GetItem(v4.LastFlashOccurrenceTsLocalStorageKey);
        end);
        if not l_status_0 then
            return false, v6;
        else
            local v12 = tonumber(l_result_0);
            if v12 == nil then
                return false, v6;
            else
                assert(v12 ~= nil, "lastFlashOccurrenceTs cannot be nil");
                if DateTime.now().UnixTimestampMillis - v12 < 500 then
                    return false, v6;
                else
                    return true, v6;
                end;
            end;
        end;
    end;
end;