/*
 * Jakefile
 * HideView
 *
 * Created by Ignacio Cases on June 8, 2011.
 * Copyright 2011, Hnlab.org All rights reserved.
 */

var ENV = require("system").env,
    FILE = require("file"),
    JAKE = require("jake"),
    task = JAKE.task,
    FileList = JAKE.FileList,
    app = require("cappuccino/jake").app,
    configuration = ENV["CONFIG"] || ENV["CONFIGURATION"] || ENV["c"] || "Debug",
    OS = require("os");

app ("HideView", function(task)
{
    task.setBuildIntermediatesPath(FILE.join("Build", "HideView.build", configuration));
    task.setBuildPath(FILE.join("Build", configuration));

    task.setProductName("HideView");
    task.setIdentifier("com.yourcompany.HideView");
    task.setVersion("1.0");
    task.setAuthor("Hnlab.org");
    task.setEmail("feedback @nospam@ yourcompany.com");
    task.setSummary("HideView");
    task.setSources((new FileList("**/*.j")).exclude(FILE.join("Build", "**")));
    task.setResources(new FileList("Resources/**"));
    task.setIndexFilePath("index.html");
    task.setInfoPlistPath("Info.plist");
    task.setNib2CibFlags("-R Resources/");

    if (configuration === "Debug")
        task.setCompilerFlags("-DDEBUG -g");
    else
        task.setCompilerFlags("-O");
});

task ("default", ["HideView"], function()
{
    printResults(configuration);
});

task ("build", ["default"]);

task ("debug", function()
{
    ENV["CONFIGURATION"] = "Debug";
    JAKE.subjake(["."], "build", ENV);
});

task ("release", function()
{
    ENV["CONFIGURATION"] = "Release";
    JAKE.subjake(["."], "build", ENV);
});

task ("run", ["debug"], function()
{
    OS.system(["open", FILE.join("Build", "Debug", "HideView", "index.html")]);
});

task ("run-release", ["release"], function()
{
    OS.system(["open", FILE.join("Build", "Release", "HideView", "index.html")]);
});

task ("deploy", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Deployment", "HideView"));
    OS.system(["press", "-f", FILE.join("Build", "Release", "HideView"), FILE.join("Build", "Deployment", "HideView")]);
    printResults("Deployment")
});

task ("desktop", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Desktop", "HideView"));
    require("cappuccino/nativehost").buildNativeHost(FILE.join("Build", "Release", "HideView"), FILE.join("Build", "Desktop", "HideView", "HideView.app"));
    printResults("Desktop")
});

task ("run-desktop", ["desktop"], function()
{
    OS.system([FILE.join("Build", "Desktop", "HideView", "HideView.app", "Contents", "MacOS", "NativeHost"), "-i"]);
});

function printResults(configuration)
{
    print("----------------------------");
    print(configuration+" app built at path: "+FILE.join("Build", configuration, "HideView"));
    print("----------------------------");
}
