return function(v0) --[[ Line: 1 ]] --[[ Name: AvatarPolicies ]]
    return {
        getAvatarHeaderIcon = function() --[[ Line: 3 ]] --[[ Name: getAvatarHeaderIcon ]]
            -- upvalues: v0 (copy)
            return v0.AvatarHeaderIcon or "LuaApp/icons/ic-back";
        end, 
        getAvatarEditorShowBuyRobuxOnTopBar = function() --[[ Line: 6 ]] --[[ Name: getAvatarEditorShowBuyRobuxOnTopBar ]]
            -- upvalues: v0 (copy)
            return v0.AvatarEditorShowBuyRobuxOnTopBar or false;
        end, 
        getCustomOutfitNames = function() --[[ Line: 9 ]] --[[ Name: getCustomOutfitNames ]]
            -- upvalues: v0 (copy)
            if v0.CustomCostumeNames ~= nil then
                return v0.CustomCostumeNames;
            else
                return true;
            end;
        end
    };
end;