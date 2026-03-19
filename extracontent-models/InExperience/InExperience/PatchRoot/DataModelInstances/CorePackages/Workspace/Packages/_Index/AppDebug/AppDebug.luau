return {
    ["jest.config"] = script["jest.config"], 
    dumpInstanceTree = require(script.dumpInstanceTree), 
    idFor = require(script.idFor), 
    littleTraceback = require(script.littleTraceback), 
    logTreeGraphviz = require(script.logTreeGraphviz), 
    LogTree = require(script.LogTree)
};