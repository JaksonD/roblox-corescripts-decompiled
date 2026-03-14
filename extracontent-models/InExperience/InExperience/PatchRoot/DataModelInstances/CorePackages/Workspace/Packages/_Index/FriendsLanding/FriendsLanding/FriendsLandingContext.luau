local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Context_0 = v1.SocialLibraries.Context;
local l_React_0 = v1.React;
local v4 = require(script.Context);
return {
    Context = v4, 
    Provider = v4.Provider, 
    Consumer = v4.Consumer, 
    with = l_Context_0.getWith(v4), 
    connect = l_Context_0.getConnect(v4), 
    useContext = function() --[[ Line: 14 ]] --[[ Name: useContext ]]
        -- upvalues: l_React_0 (copy), v4 (copy)
        return (l_React_0.useContext(v4));
    end
};