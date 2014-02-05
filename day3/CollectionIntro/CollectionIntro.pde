// array vs. list
String[] hiarray=new String[3];

List<String> hiscores=new ArrayList<String>();

// adding elements to a list/collection
hiscores.add("foo");
hiscores.add("bar");
hiscores.add("hello");

// populating array
hiarray[0]="foo";
hiarray[1]="bar";
hiarray[2]="hello";

println(hiarray.length+" items in array");
println(hiscores.size()+" items in list");

for(int i=0; i<hiscores.size(); i++) {
  println(hiscores.get(i));
}

println("check for existence of elements");
println(hiscores.contains("hello"));

for(int i=0; i<hiarray.length; i++) {
  if (hiarray[i].equalsIgnoreCase("HeLlO")) {
    println("yippee!!");
  }
}

println("for each element s IN a collection of elements");
for(String s : hiscores) {
  println(s+" (list)");
}

for(String s : hiarray) {
  println(s+" (array)");
}

println("same result as above");
for(int i=0; i<hiscores.size(); i++) {
  String s=hiscores.get(i);
  println(s);
}

println("using iterator");
for(Iterator<String> i=hiscores.iterator(); i.hasNext();) {
  String s=i.next();
  println(s);
}
