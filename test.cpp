#include <iostream>
#include <fstream>
#include <ctime>

using namespace std;

int main()
{       
        time_t now = time(0);
        char* dt = ctime(&now);
        ofstream sdfailed;
        std::ofstream outfile ("../../logs/sdfailed.txt", std::ios_base::app);
        outfile << "INVALID PATH FOR DEFAULT EDITOR/FOLDER IN " << dt << "\n";
        outfile.close();
        return 0;
}

