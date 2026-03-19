return require(script.Parent.Parent.Action)(script.Name, function(v0, v1) --[[ Line: 4 ]]
    return {
        waitingForRecording = v0, 
        lastFileOutputLocation = v1 or ""
    };
end);