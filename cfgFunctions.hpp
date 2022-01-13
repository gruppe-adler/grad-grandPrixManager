#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY node_modules
#endif

class GRAD_grandPrixManager {

    class client {
        file = MODULES_DIRECTORY\grad-grandprixmanager\functions\client;

    };

    class server {
        file = MODULES_DIRECTORY\grad-grandprixmanager\functions\server;

        class init { postInit = 1; };
    };
};
