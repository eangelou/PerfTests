module dversion.core;

import std.stdio;
import std.array;
import std.conv : to;
import std.json;
import pyd.class_wrap;
import pyd.pyd;

static Version parseVersionJSON(string s)
{
    JSONValue v = parseJSON(s);
    auto numbers = to!(uint[])(v["version"].toString.replace("\"", "").split('.'));
    switch (numbers.length)
    {
    case 1:
        {
            return new Version(numbers[0]);
        }
    case 2:
        {
            return new Version(numbers[0], numbers[1]);
        }
    default:
        {
            return new Version(numbers[0], numbers[1], numbers[2]);
        }
    }

}

static Version parseVersion(string s)
{
    JSONValue v = parseJSON(s);
    auto numbers = to!(uint[])(s.replace("\"", "").split('.'));
    switch (numbers.length)
    {
    case 1:
        {
            return new Version(numbers[0]);
        }
    case 2:
        {
            return new Version(numbers[0], numbers[1]);
        }
    default:
        {
            return new Version(numbers[0], numbers[1], numbers[2]);
        }
    }
}

class Version
{
    uint major, minor, patch;
    // create a json struct
    JSONValue v;

    this(uint major = 0, uint minor = 0, uint patch = 0)
    {
        this.major = major;
        this.minor = minor;
        this.patch = patch;
        auto strBuilder = appender!string;
        strBuilder.put(to!string(major));
        strBuilder.put(".");
        strBuilder.put(to!string(minor));
        strBuilder.put(".");
        strBuilder.put(to!string(patch));
        this.v = ["version": strBuilder.data];
    }

    string getVersionJSON()
    {
        return this.v.toString();
    }

    void printVersionJSON()
    {
        writeln(this.v.toString());
    }

    string getVersion()
    {
        auto strBuilder = appender!string;
        strBuilder.put(to!string(this.major));
        strBuilder.put(".");
        strBuilder.put(to!string(this.minor));
        strBuilder.put(".");
        strBuilder.put(to!string(this.patch));
        return strBuilder.data;
    }

    void printVersion()
    {
        auto strBuilder = appender!string;
        strBuilder.put(to!string(this.major));
        strBuilder.put(".");
        strBuilder.put(to!string(this.minor));
        strBuilder.put(".");
        strBuilder.put(to!string(this.patch));
        writeln(strBuilder.data);
    }

}

//extern(C) void PydMain() {
//    module_init();
//
//    // Call wrap_class
//    wrap_class!(
//        TestClass,
//        // Wrap the "main" method
//        Def!(TestClass.main, int function()),
//        // Wrap the constructors.
//        Init!(int,int)
//    )();
//}
