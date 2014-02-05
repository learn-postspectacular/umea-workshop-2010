class Human {
  
  String name;
  int age;
  boolean isFemale;
  color hairColor;
  
  Human(String name, int age) {
    this.name=name;
    this.age=age;
  }
  
  boolean isOlderThan(Human other) {
    return this.age > other.age;
  }
  
  String getName() {
    return this.name;
  }
  
  String toString() {
    return name+" ("+age+")";
  }
}

Human[] group;
int numPeople=0;

void setup() {
  String[] lines=loadStrings("people.txt");
  println(lines.length+" lines loaded");
  group=new Human[lines.length];
  for(int i=0; i<lines.length; i++) {
    if(lines[i].length()>0) {
      // split "name,age" into separate values
      String[] items=split(lines[i],",");
      group[numPeople]=new Human(items[0], int(trim(items[1])));
      numPeople++;
    }
  }
  println(numPeople+" humans created");
  // calculate min, max, average age of group
  Human youngest=group[0];
  Human oldest=group[0];
  int mediumAge=0;
  for(int i=0; i<numPeople; i++) {
    // find youngest
    if (group[i].age < youngest.age) {
      youngest=group[i];
    }
    // find oldest
    if (group[i].age > oldest.age) {
      oldest=group[i];
    }
    // update median age
    mediumAge+=group[i].age;
  }
  mediumAge/=numPeople;
  // print out stats
  println("group baby: "+youngest);
  println("group granny: "+oldest);
  println("average: "+mediumAge);
}
