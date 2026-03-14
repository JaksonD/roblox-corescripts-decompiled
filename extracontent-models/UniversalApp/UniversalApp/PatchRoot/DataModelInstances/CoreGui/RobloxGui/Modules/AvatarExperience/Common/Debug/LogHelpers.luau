return {
    obfuscateUserId = function(v0) --[[ Line: 6 ]] --[[ Name: obfuscateUserId ]]
        if v0 == nil then
            return "<User ID: nil>";
        elseif v0 == 0 then
            return "<User ID: 0>";
        else
            return "<User ID: ####>";
        end;
    end, 
    obfuscatePlayer = function(v1) --[[ Line: 16 ]] --[[ Name: obfuscatePlayer ]]
        if v1 == nil then
            return "<Player: nil>";
        else
            local v2 = true;
            if v1.UserId ~= 0 then
                v2 = v1.UserId == nil;
            end;
            local v3 = v2 and " [NO USER ID]" or "";
            return string.format("<Player: ####%s>", v3);
        end;
    end
};