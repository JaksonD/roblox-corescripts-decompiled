local l_Parent_0 = script:FindFirstAncestor("Squads").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.RoduxSquads);
local v3 = require(l_Parent_0.SquadsCore);
local l_RoduxNetworking_0 = require(l_Parent_0.SquadsCore).Http.RoduxNetworking;
return {
    Cryo = require(l_Parent_0.Cryo), 
    Foundation = require(l_Parent_0.Foundation), 
    Hooks = {
        dependencyArray = require(l_Parent_0.RoactUtils).Hooks.dependencyArray, 
        useCurrentSquadSelector = v2.Hooks.useCurrentSquadSelector, 
        useDispatch = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch, 
        useEffectOnce = require(l_Parent_0.RoactUtils).Hooks.useEffectOnce, 
        useLocalization = require(l_Parent_0.Localization).Hooks.useLocalization, 
        usePrevious = require(l_Parent_0.RoactUtils).Hooks.usePrevious, 
        useSelector = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector, 
        useStore = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useStore
    }, 
    LuauPolyfill = require(l_Parent_0.LuauPolyfill), 
    React = v1, 
    Roact = require(l_Parent_0.Roact), 
    RoactRodux = require(l_Parent_0.RoactRodux), 
    Rodux = require(l_Parent_0.Rodux), 
    RoduxNetworking = l_RoduxNetworking_0, 
    SharedFlags = require(l_Parent_0.SharedFlags), 
    SocialExperiments = require(l_Parent_0.SocialExperiments), 
    SquadsCore = v3, 
    t = require(l_Parent_0.t), 
    useNavigation = require(l_Parent_0.Navigation).useNavigation, 
    RoduxPresence = v3.Http.RoduxPresence, 
    NetworkingPresence = v3.Http.NetworkingPresence, 
    RoduxSquads = v3.RoduxSquads, 
    NetworkingSquads = v3.Http.NetworkingSquads, 
    UserBlockingRodux = v3.Http.UserBlockingRodux, 
    UserBlockingNetworking = v3.Http.UserBlockingNetworking
};