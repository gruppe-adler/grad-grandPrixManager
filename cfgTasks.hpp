/*

    needs to be included in description.ext

*/

/*
    types:
    timeIndividual
    timeGroup
    hits
    lessIsBetter

*/

class cfgGRADGPM {

    class task1 {
        displayName = "Aufgabe 1";
        description = "Fahre so schnell wie möglich von A nach B";
        type = "timeIndividual";
        lessIsBetter = true;
        onStart = ""; // execute on start of challenge
        onEnd = ""; // execute on end of challenge
        audioHints[] = {}; // audio hints to be received as challenge introduction
    };

};
