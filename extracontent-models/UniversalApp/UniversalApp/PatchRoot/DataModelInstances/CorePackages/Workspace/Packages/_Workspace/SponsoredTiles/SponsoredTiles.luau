local l_Parent_0 = script.Parent;
return {
    WhyThisAdModal = if require(l_Parent_0.SharedFlags).FFlagLuaAppEnableWhyThisAdModal then require(script.WhyThisAdModal) else nil
};