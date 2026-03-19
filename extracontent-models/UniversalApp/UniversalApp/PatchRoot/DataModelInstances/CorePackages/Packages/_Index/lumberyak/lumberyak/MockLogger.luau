local v0 = {
    Levels = {
        Error = "MockError", 
        Warning = "MockWarning", 
        Info = "MockInfo", 
        Debug = "MockDebug", 
        Trace = "MockTrace", 
        fromString = function() --[[ Line: 12 ]] --[[ Name: fromString ]]
            return "MockInfo";
        end
    }
};
v0.__index = v0;
v0.new = function() --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({}, v0));
end;
v0.setParent = function() --[[ Line: 23 ]] --[[ Name: setParent ]]

end;
v0.setContext = function() --[[ Line: 26 ]] --[[ Name: setContext ]]

end;
v0.addSink = function() --[[ Line: 29 ]] --[[ Name: addSink ]]

end;
v0.error = function() --[[ Line: 32 ]] --[[ Name: error ]]

end;
v0.warning = function() --[[ Line: 35 ]] --[[ Name: warning ]]

end;
v0.info = function() --[[ Line: 38 ]] --[[ Name: info ]]

end;
v0.debug = function() --[[ Line: 41 ]] --[[ Name: debug ]]

end;
v0.trace = function() --[[ Line: 44 ]] --[[ Name: trace ]]

end;
return v0;