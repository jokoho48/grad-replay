#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY modules
#endif

class GRAD_replay {

    class player {
        file = MODULES_DIRECTORY\GRAD_replay\functions\player;

        class addReplayPart {};
        class createMapOverlay {};
        class drawIcon {};
        class getRecordEntry {};
        class initReplay {};
        class onPlaybackPosChanged {};
        class preparePlaybackClient {};
        class receiveData {}
        class setTimeDisplay {};
        class showHintPause {};
        class showHintPlay {};
        class showPlaybackControl {};
        class showProgressBar {};
        class startPlaybackClient {};
        class stopPlaybackClient {};
        class syncPlaybackPos {};
    };

	class server {
		file = MODULES_DIRECTORY\GRAD_replay\functions\server;

		class getSideColor {};
        class pauseRecord {};
        class preparePlaybackServer {};
        class setMeSpectator {};
        class startRecord {};
        class stopRecord {};
        class storeValue {};
	};
};