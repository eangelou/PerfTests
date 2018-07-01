import dversion.core;
import std.getopt;

static string hardcoded = "0.0.0";

int main(string[] args)
{
//    Version tc = new dversion.core.Version(1, 2, 3);
//    tc.printVersionJSON();
//
//    auto newVersion = parseVersion("1.12");
//    newVersion.printVersionJSON();

    uint major, minor, patch;
    string versionString;
    bool json;
    auto helpInformation = getopt(args, "m|major", "Version major number.", &major, // numeric
            "n|minor", "Version minor number.", &minor, // numeric
            "p|patch", "Version patch number.", &patch, // numeric
            "v|version", "Version as parsable  ('.' separated) version string. Ommited numbers will be considered 0. If json is enabled, a json representation is assumed (e.g. {\"version\": \"1.2.3\"}).", &versionString, // string 
            "j|json", "Enable JSON version parsing and output.", &json // bool 
            ); // enum
            
    if (helpInformation.helpWanted)
    {
        defaultGetoptPrinter("Some information about the program.", helpInformation.options);
    }

	Version flagVersion;
    if (versionString)
    {
    	
    	if (json) {
	        flagVersion = parseVersionJSON(versionString);
	        flagVersion.printVersionJSON();
    	} else {
    		flagVersion = parseVersion(versionString);
	        flagVersion.printVersion();
    	}
    }
    else
    {
        flagVersion = new dversion.core.Version(major, minor, patch);
        if (json) {
	        flagVersion.printVersionJSON();
        } else {
        	flagVersion.printVersion();
        }
    }

    return 0;
}
