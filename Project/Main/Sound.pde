class Sound{
  //================================================================================
  // properties
  //================================================================================
  
  // sound names
  String changeBtn = "changeBtn";
  String confirmBtn = "confirmBtn";
  String flyBtn = "flyBtn";
  String flyM = "flyM";
  String intro = "intro";
  String landing = "landing";
  String meteor = "meteor";
  String pilot = "pilot";
  String sad = "sad";
  String win = "win";
  
  // Other
  AudioPlayer song;
  Minim minim;
  String path = "sound/";
  String type = ".mp3";
  
    
  //================================================================================
  // constructor
  //================================================================================
  Sound() {
    changeBtn = path + changeBtn + type;
    confirmBtn = path + confirmBtn + type;
    flyBtn = path + flyBtn + type;
    flyM = path + flyM + type;
    intro = path + intro + type;
    landing = path + landing + type;
    meteor = path + meteor + type;
    pilot = path + pilot + type;
    sad = path + sad + type;
    win = path + win + type;
    
    minim = new Minim(this);
    
    song = minim.loadFile(intro);
  }
  
  
  //================================================================================
  // methods
  //================================================================================
  void play(String name) {
    if(!song.isPlaying()) {
      switchSong(name);
      song.rewind();
      song.play();
    }
  }
  
  void stop(){
    if(song.isPlaying()) {
      song.pause();
    }
  }
  
  void switchSong(String name){
    switch(name) {
        case "change":
          song = minim.loadFile(changeBtn);
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
        case "meteor":
          song = minim.loadFile(meteor);
          break;
        case "pilot":
          song = minim.loadFile(pilot);
          break;
        case "sad":
          song = minim.loadFile(sad);
          break;
        case "win":
          song = minim.loadFile(win);
          break;
      }
  }
}