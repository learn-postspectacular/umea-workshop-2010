class HighscoreEntry implements Comparable<HighscoreEntry> {
  String name;
  int score;
  
  HighscoreEntry(String n, int s) {
    name=n;
    score=s;
  }
  
  int compareTo(HighscoreEntry other) {
    if (this.score < other.score) {
      return 1;
    }
    if (this.score == other.score) {
      return 0;
    }
    return -1;
  }
}

ArrayList<HighscoreEntry> highscores=new ArrayList<HighscoreEntry>();

void loadHighscores() {
  highscores.clear();
  String[] lines=loadStrings("highscores.txt");
  for(String l : lines) {
    if (l.length()>0) {
      String[] items=split(l,",");
      HighscoreEntry e=new HighscoreEntry(items[0],int(trim(items[1])));
      highscores.add(e);
    }
  }
}

void saveHighscores() {
  String[] lines=new String[highscores.size()];
  for(int i=0; i<lines.length; i++) {
    HighscoreEntry e=highscores.get(i);
    lines[i]=e.name+","+e.score;
  }
  saveStrings(dataPath("highscores.txt"),lines);
}

void addToHighscores(String name, int score) {
  HighscoreEntry e=new HighscoreEntry(name,score);
  highscores.add(e);
  Collections.sort(highscores);
  // remove all entries after top 10
  while (highscores.size()>10) {
    highscores.remove(highscores.size()-1);
  }
}
