#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY node_modules
#endif

class GRAD_GPM {

    class client {
        file = MODULES_DIRECTORY\grad-grandprixmanager\functions\client;

        class clientEventhandler { postInit = 1; };
        class trackTimeGroup;
    };

    class server {
        file = MODULES_DIRECTORY\grad-grandprixmanager\functions\server;

        class addToGroup;
        class getGroup;

        class init { postInit = 1; };

        class serverEventhandler;
        class taskIsRunning;
        class trackTimeStart;
        class trackTimeStop;
    };
};
