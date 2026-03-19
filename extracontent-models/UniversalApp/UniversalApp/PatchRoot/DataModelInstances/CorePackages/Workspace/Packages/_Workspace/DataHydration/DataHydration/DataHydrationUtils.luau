local l_Players_0 = game:GetService("Players");
return {
    areAllKeysPresent = function(v1, v2) --[[ Line: 12 ]] --[[ Name: areAllKeysPresent ]]
        if v1 == nil or type(v1) ~= "table" then
            return #v2 == 0;
        else
            for _, v4 in v2 do
                if v1[v4] == nil then
                    return false;
                end;
            end;
            return true;
        end;
    end, 
    getLocalPlayerUserId = function() --[[ Line: 3 ]] --[[ Name: getLocalPlayerUserId ]]
        -- upvalues: l_Players_0 (copy)
        local v5 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or nil;
        if v5 == nil or v5 <= 0 then
            return nil;
        else
            return v5;
        end;
    end
};