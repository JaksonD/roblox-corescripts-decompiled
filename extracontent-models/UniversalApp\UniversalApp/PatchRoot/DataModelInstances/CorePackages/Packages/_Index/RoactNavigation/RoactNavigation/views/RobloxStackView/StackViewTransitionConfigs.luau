local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local l_Object_0 = require(l_Parent_1.LuauPolyfill).Object;
local v3 = require(l_Parent_0.StackViewInterpolator);
local v4 = require(l_Parent_0.StackPresentationStyle);
local v5 = {
    frequency = 3, 
    dampingRatio = 1
};
local v6 = {
    transitionSpec = v5, 
    screenInterpolator = v3.forHorizontal
};
local v7 = {
    transitionSpec = v5, 
    screenInterpolator = v3.forVertical
};
local v8 = {
    transitionSpec = v5, 
    screenInterpolator = v3.forFade
};
return {
    getDefaultTransitionConfig = function(_, _, v11) --[[ Line: 31 ]] --[[ Name: getDefaultTransitionConfig ]]
        -- upvalues: v4 (copy), v7 (copy), v8 (copy), v6 (copy)
        if v11 == v4.Modal then
            return v7;
        elseif v11 == v4.Overlay then
            return v8;
        else
            return v6;
        end;
    end, 
    getTransitionConfig = function(v12, v13, v14, v15) --[[ Line: 41 ]] --[[ Name: getTransitionConfig ]]
        -- upvalues: v4 (copy), v7 (copy), v8 (copy), v6 (copy), l_Object_0 (copy)
        local v16 = if v15 == v4.Modal then v7 else if v15 == v4.Overlay then v8 else v6;
        if v12 then
            return l_Object_0.assign(table.clone(v16), v12(v13, v14, v15));
        else
            return v16;
        end;
    end, 
    SlideFromRight = v6, 
    ModalSlideFromBottom = v7, 
    FadeInPlace = v8
};