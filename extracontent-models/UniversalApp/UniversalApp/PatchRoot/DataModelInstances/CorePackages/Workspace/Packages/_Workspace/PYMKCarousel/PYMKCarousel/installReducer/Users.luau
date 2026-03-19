local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_RoduxUsers_0 = v1.RoduxUsers;
local l_convertActions_0 = v1.convertActions;
local l_llama_0 = v1.llama;
local l_usersActionAdaptor_0 = v1.usersActionAdaptor;
local v6 = require(script.Parent.usersOmniActionAdaptor);
local v7 = {
    byUserId = {}, 
    byUsername = {}
};
local v8 = l_RoduxUsers_0.installReducer();
local function _(v9) --[[ Line: 17 ]]
    -- upvalues: l_llama_0 (copy), l_usersActionAdaptor_0 (copy), l_RoduxUsers_0 (copy), v6 (copy)
    return l_llama_0.Dictionary.join(l_usersActionAdaptor_0(l_RoduxUsers_0), v6(v9));
end;
return function(v11) --[[ Line: 21 ]]
    -- upvalues: l_convertActions_0 (copy), v8 (copy), l_llama_0 (copy), l_usersActionAdaptor_0 (copy), l_RoduxUsers_0 (copy), v6 (copy), v7 (copy)
    return l_convertActions_0(v8, l_llama_0.Dictionary.join(l_usersActionAdaptor_0(l_RoduxUsers_0), v6(v11)), v7);
end;