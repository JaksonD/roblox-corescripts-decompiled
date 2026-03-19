return function(v0) --[[ Line: 1 ]]
    return function(v1) --[[ Line: 2 ]]
        -- upvalues: v0 (copy)
        local l_category_0 = v1:getState().AvatarExperience.AvatarEditor.Categories.category;
        local l_subcategory_0 = v1:getState().AvatarExperience.AvatarEditor.Categories.subcategory;
        v0.clickShopForMore(l_category_0, l_subcategory_0);
    end;
end;