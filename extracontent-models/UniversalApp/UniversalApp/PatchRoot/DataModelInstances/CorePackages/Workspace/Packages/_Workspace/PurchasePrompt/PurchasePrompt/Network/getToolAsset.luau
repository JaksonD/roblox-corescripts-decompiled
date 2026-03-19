return function(v0, v1) --[[ Line: 2 ]] --[[ Name: getToolAsset ]]
    return v0.loadAssetForEquip(v1):andThen(function(v2) --[[ Line: 5 ]]
        if v2:IsA("Tool") then
            return v2;
        else
            local l_v2_Children_0 = v2:GetChildren();
            for _, v5 in ipairs(l_v2_Children_0) do
                if v5:IsA("Tool") then
                    return v5;
                end;
            end;
            return;
        end;
    end):catch(function(_) --[[ Line: 17 ]]
        return nil;
    end);
end;