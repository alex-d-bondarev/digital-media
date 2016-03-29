class Sound{
  //================================================================================
  // properties
  //================================================================================
  
  // sound file names
  String changeBtn = "changeBtn";
  String click = "click";
  String confirmBtn = "confirmBtn";
  String failLanding = "failLanding";
  String flyBtn = "flyBtn";
  String flyM = "flyM";
  String intro = "intro";
  String landing = "landing";
  String lost = "lost";
  String meteor = "meteor";
  String pilot = "pilot";
  String sad = "sad";
  String walking = "walking";
  String win = "win";
  
  // Other
  AudioPlayer song;
  String path = "sound/";
  String type = ".mp3";
  
    
  //================================================================================
  // constructor
  //================================================================================
  Sound() {
    // combine file path, file name and file type for all files
    changeBtn = path + changeBtn + type;
    click = path + click + type;
    confirmBtn = path + confirmBtn + type;
    failLanding = path + failLanding + type;
    flyBtn = path + flyBtn + type;
    flyM = path + flyM + type;
    intro = path + intro + type;
    landing = path + landing + type;
    lost = path + lost + type;
    meteor = path + meteor + type;
    pilot = path + pilot + type;
    sad = path + sad + type;
    walking = path + walking + type;
    win = path + win + type;
    
    // loa default music
    song = minim.loadFile(intro);
  }  
  
  //================================================================================
  // methods
  //================================================================================
  
  //--------------------------------------------------------------------------------
  // Effect: play selected sound. Some sounds will be played only after others finish
  //         other sounds will play, as soon as needed
  //--------------------------------------------------------------------------------
  void play(String name) {
    // wait for current sound to finish
    if(!song.isPlaying()) {
      switchSong(name);
      song.rewind();
      song.play();
      
      // do not wait and play ASAP
    } else if (name.equals("meteor") || name.equals("mouse") ||
               name.equals("landing") || name.equals("failLanding") ||
               name.equals("change")){
      stop();
      switchSong(name);
      song.rewind();
      song.play();
    }
  }
  
  //--------------------------------------------------------------------------------
  // Effect: stop playing current sound
  //--------------------------------------------------------------------------------
  void stop(){
    if(song.isPlaying()) {
      song.pause();
    }
  }
  
  //--------------------------------------------------------------------------------
  // Given: song name
  // Effect: switch current song to given one
  //--------------------------------------------------------------------------------
  void switchSong(String name){
    switch(name) {
        case "change":
          song = minim.loadFile(changeBtn);
          break;
        case "click":
          song = minim.loadFile(click);
          break;
        case "confirm":
          song = minim.loadFile(confirmBtn);
          break;
        case "btn":
          song = minim.loadFile(flyBtn);
          break;
        case "mouse":
          song = minim.loadFile(flyM);
          break;
        case "intro":
          song = minim.loadFile(intro);
          break;
        case "landing":
          song = minim.loadFile(landing);
          break;
        case "failLanding":
          song = minim.loadFile(failLanding);
          break;
        case "meteor":
          song = minim.loadFile(meteor);
          break;
        case "pilot":
          song = minim.loadFile(pilot);
          break;
        case "sad":
          song = minim.loadFile(sad);
          break;
        case "walking":
          song = minim.loadFile(walking);
          break;
        case "win":
          song = minim.loadFile(win);
          break;
        case "lost":
          song = minim.loadFile(lost);
          break;
    }
  }
}